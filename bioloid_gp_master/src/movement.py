#!/usr/bin/env python

import rospy

from sensor_msgs.msg import JointState
from std_msgs.msg import Header

# #Dimensiones de la herramienta y el brazo
# longTool= 0.0255
# armLenghts[5] = {0.047, 0.0145, 0.025, 0.0675, (0.0745+longTool)}
# #Dimensiones de la pierna
# LegLenghts[5] = {0.0385, 0.031, 0.0145, 0.075, 0.0295}

class movement:
    def __init__(self):
        rospy.init_node("motion_control")
        self.r = rospy.Rate(10)
        self.pub = rospy.Publisher('/joint_goals', JointState, queue_size=1)

    def loop(self):
        self.main()
        self.r.sleep()


    def main(self):

        g30=0.5235987756
        g45=0.7853981634

        time=1
        walkingtime=0.5

        self.joints_states = JointState()
        self.joints_states.header = Header()
        self.joints_states.header.stamp = rospy.Time.now()
        self.joints_states.name = ["joint_1","joint_2","joint_3","joint_4","joint_5","joint_6","joint_7","joint_8","joint_9","joint_10","joint_11","joint_12","joint_13","joint_14","joint_15","joint_16","joint_17","joint_18","joint_19","joint_20","joint_21"]

        while not rospy.is_shutdown():
            
            number = input ("Enter number: ")
            if (number==1):
                self.joint_position_state=[-0.1,0.1,-0.2,0.2,0.6,-0.6,0,0,     0,0,0,0,0,0,0,0,0,0,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                # rospy.sleep(time)
            if (number==2):
                self.joint_position_state=[-0.1,0.1,-0.2,0.2,0.6,-0.6,0,0,     -g30/3,-g30/3,0,0,0,0,0,0,-g30/3,-g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                self.joint_position_state=[-0.1,0.3,-0.2,0.5,0.6,-0.5,0,0,     -g30/3,-g30/3,-g30,0,-g30,0,         0,0,-g30/3,-g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                self.joint_position_state=[-0.1,0.3,-0.2,0.5,0.6,-0.5,0,0,     -g30/3,-g30/3,-g30,-g30/3,-g30,0,0,g30/3,-g30/3,-g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                self.joint_position_state=[-0.1,0.1,-0.2,0.2,0.6,-0.6,0,0,     0,0,-g30,-g30/3,-g30,0,     0,g30/3,0,0,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)

                
            if (number==3):
                self.joint_position_state=[-0.1,0.3,-0.2,0.5,0.6,-0.5,0,0,     g30/3,g30/3,-g30*1/3,g30/3,-g30*3/3,g30*3/3,     -g30*2/3,g30*2/3,g30/3,g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                self.joint_position_state=[-0.1,0.3,-0.2,0.5,0.6,-0.5,0,0,     g30/3,g30/3,0,g30,0,g30,     0,0,g30/3,g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                self.joint_position_state=[-0.1,0.3,-0.2,0.5,0.6,-0.5,0,0,     g30/3,g30/3,g30*1/3,g30,0,g30,     -g30*1/3,0,g30/3,g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                self.joint_position_state=[-0.1,0.3,-0.2,0.5,0.6,-0.5,0,0,     -g30/3,-g30/3,0,g30,0,g30,     0,g30*1/3,-g30/3,-g30/3,    0,0,0]
                self.joints_states.position = self.joint_position_state
                self.pub.publish(self.joints_states)
                rospy.sleep(time)
                # self.joint_position_state=[-0.1,0.1,-0.2,0.2,0.6,-0.6,0,0,     -g30/3,-g30/3,0,0,0,0,           0,0,-g30/3,-g30/3,    0,0,0]
                # self.joints_states.position = self.joint_position_state
                # self.pub.publish(self.joints_states)
                # rospy.sleep(time)
            # if (number==4):
            #     self.joint_position_state=[0.1,-0.3,0.2,-0.5,-0.6,0.5,0,0,     g30/3,g30/3,g30,g30/3,g30,0,0,-g30/3,g30/3,g30/3,    0,0,0]
            #     self.joints_states.position = self.joint_position_state
            #     self.pub.publish(self.joints_states)
            #     rospy.sleep(time)		
            # if (number==5):
            #     self.joint_position_state=[0.1,-0.3,0.2,-0.5,-0.6,0.5,0,0,     0,0,g30,g30/3,g30,0,     0,-g30/3,0,0,    0,0,0]
            #     self.joints_states.position = self.joint_position_state
            #     self.pub.publish(self.joints_states)
            #     rospy.sleep(time)	
            # if (number==6):
            #     self.joint_position_state=[0.1,-0.3,0.2,-0.5,-0.6,0.5,0,0,     -g30/3,-g30/3,g30,g30/3,g30,0,     g30/3,-g30/3,-g30/3,-g30/3,    0,0,0]
            #     self.joints_states.position = self.joint_position_state
            #     self.pub.publish(self.joints_states)
            #     rospy.sleep(time)	
                # self.joint_position_state=[0.1,-0.3,0.2,-0.5,-0.6,0.5,0,0,     -g30/3,-g30/3,0,g30/2,0,0,0,0,-g30/3,-g30/3,    0,0,0]
                # self.joints_states.position = self.joint_position_state
                # self.pub.publish(self.joints_states)
                # rospy.sleep(time)
            # if (number==7):
            #     # segundo paso
            #     joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0,0,0,0,0,0,0,0,0,0,0,0,0]
            # if (number==8):
            #     # segundo paso
            #     joint_position_state=[0.5,-0.5,0.5,-0.5,0.5,-0.5,-0.5,0.5,0,-0.3,0,0,0,0,0,0,0,0,0,0,0]
            # if (number==9):
            #     # segundo paso
            #     joint_position_state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
                    


if __name__ == '__main__':
    movement= movement()
    while not rospy.is_shutdown():
        movement.loop()