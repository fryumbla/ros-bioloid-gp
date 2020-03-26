#!/usr/bin/env python
import time
import rospy
from sensor_msgs.msg import JointState
from dynamixel_workbench_msgs.srv import DynamixelCommand, DynamixelCommandRequest
from std_msgs.msg import Header
 
 
class OpenManipulatorMove(object):
    def __init__(self):
        rospy.loginfo("OpenManipulatorMove INIT...Please wait.")
 
        # We subscribe to the joint states to have info of the system
 
        self.joint_states_topic_name = '/dynamixel_workbench/joint_states'
        self._check_join_states_ready()
        sub = rospy.Subscriber(self.joint_states_topic_name, JointState, self.joint_states_callback)
 
 
        # We start the Publisher for the positions of the joints
        self.goal_dynamixel_position_publisher = rospy.Publisher('/goal_dynamixel_position',
                                                                    JointState,
                                                                    queue_size=1)
 
        # Wait for the service client /joint_command to be running
        joint_command_service_name = "/dynamixel_workbench/dynamixel_command"
        rospy.wait_for_service(joint_command_service_name)
        # Create the connection to the service
        self.joint_command_service = rospy.ServiceProxy(joint_command_service_name, DynamixelCommand)
 
        rospy.loginfo("OpenManipulatorMove Ready!")
 
    def joint_states_callback(self,msg):
        """
        rosmsg show sensor_msgs/JointState
            std_msgs/Header header
              uint32 seq
              time stamp
              string frame_id
            string[] name
            float64[] position
            float64[] velocity
            float64[] effort
 
        :param msg:
        :return:
        """
        self.joint_states_msg = msg
 
    def _check_join_states_ready(self):
        self.joint_states_msg = None
        rospy.logdebug("Waiting for "+self.joint_states_topic_name+" to be READY...")
        while self.joint_states_msg is None and not rospy.is_shutdown():
            try:
                self.joint_states_msg = rospy.wait_for_message(self.joint_states_topic_name, JointState, timeout=5.0)
                rospy.logdebug("Current "+self.joint_states_topic_name+" READY=>")
 
            except:
                rospy.logerr("Current "+self.joint_states_topic_name+" not ready yet, retrying ")
 
    def move_all_joints(self, position_array):
 
        rospy.logwarn("move_all_joints STARTED")
        # We check that the position array has the correct number of elements
        number_of_joints = len(self.joint_states_msg.name)
 
        if len(position_array) == number_of_joints:
            
            new_joint_position = JointState()

            h = Header()
            h.stamp = rospy.Time.now()  # Note you need to call rospy.init_node() before this will work
            h.frame_id = self.joint_states_msg.header.frame_id

            new_joint_position.header = h
            new_joint_position.name = self.joint_states_msg.name
            # new_joint_position.name = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21"]
            new_joint_position.position = position_array

            # These values arent used, so they dont matter really
            new_joint_position.velocity = self.joint_states_msg.velocity
            new_joint_position.effort = self.joint_states_msg.effort

            rospy.logwarn("PUBLISH STARTED")
            self.goal_dynamixel_position_publisher.publish(new_joint_position)
            rospy.logwarn("PUBLISH FINISHED")

        else:
            rospy.logerr("The Array given doesnt have the correct length="+str(number_of_joints))
 
        rospy.logwarn("move_all_joints FINISHED")
 
 
    def move_one_joint(self, joint_id, position, unit="rad"):
        """
        rossrv show dynamixel_workbench_msgs/DynamixelCommand
            string unit
            uint8 id
            float32 goal_position
            ---
            bool result
 
        :param joint_id:
        :param position:
        :param units:
        :return:
        """
        joint_cmd_req = DynamixelCommandRequest()
        joint_cmd_req.unit = unit
        joint_cmd_req.id = joint_id
        joint_cmd_req.goal_position = position
 
        if joint_id == 7:
            rospy.logwarn("CHECKING Gripper Value is safe?")
            if self.check_gripper_pos_safe(position):
 
                # Send through the connection the name of the object to be deleted by the service
                result = self.joint_command_service(joint_cmd_req)
                rospy.logwarn("move_one_joint went ok?="+str(result))
            else:
                rospy.logwarn("Gripper Value Not safe=" + str(position))
        else:
            # Send through the connection the name of the object to be deleted by the service
            result = self.joint_command_service(joint_cmd_req)
            rospy.logwarn("move_one_joint went ok?=" + str(result))
 
    def get_joint_names(self):
        return self.joint_states_msg.name
 
 
    def check_gripper_pos_safe(self, gripper_value):
        """
        We need to check that the gripper pos is -1.0 > position[6] > -3.14
        Otherwise it gets jammed
        :param gripper_value:
        :return:
        """
        return (-0.5 > gripper_value > 0.5)
 
def movement_sequence_test():
 
    joint_position_home = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
 

    while not rospy.is_shutdown():
        openman_obj = OpenManipulatorMove()

        openman_obj.move_all_joints(joint_position_home)
        rate = rospy.Rate(10) # 10hz
        # rospy.spin()


 
    # for joint_position_array in joint_position_sequence_say_no:
    #     openman_obj.move_all_joints(joint_position_array)
    #     time.sleep(0.2)
 
    # for joint_position_array in joint_position_sequence_say_pendulum:
    #     openman_obj.move_all_joints(joint_position_array)
    #     time.sleep(0.5)
 

if __name__ == "__main__":
    rospy.init_node('move_openmanipulator_node', log_level=rospy.WARN)

    movement_sequence_test()