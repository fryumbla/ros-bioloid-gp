#!/usr/bin/env python
import serial
import rospy
import math
from sensor_msgs.msg import Imu
from geometry_msgs.msg import Vector3

def convert_accel(int_val):
    ''' Convert acceleration component from device value to ROS value.
    :param int_val: Reading from device.
    :type int_val: str
    :returns: float value in meters per second squared.
    '''
    return float(int_val) * 9.81

class ImuAttributes(Imu):
    def __init__(self, frame_id):
        super(ImuAttributes, self).__init__(
            orientation_covariance=[-1.0, 0.0, 0.0,
                                    0.0, 0.0, 0.0,
                                    0.0, 0.0, 0.0],
            angular_velocity_covariance=[-1.0, 0.0, 0.0,
                                         0.0, 0.0, 0.0,
                                         0.0, 0.0, 0.0],
            linear_acceleration_covariance=[0.0, 0.0, 0.0,
                                            0.0, 0.0, 0.0,
                                            0.0, 0.0, 0.0])
        if frame_id:
            self.header.frame_id = frame_id

class ImuMessages(object):
    """ ROS message translation for UTexas BWI segbot Arduino imu ranges. """
    def __init__(self):

        rospy.init_node('imu_publisher', anonymous=True)
        self.pubs = rospy.Publisher('imu', Imu, queue_size=10)
       
        self.imus = ImuAttributes('imu')
        
        
        
        self.serial = serial.Serial('/dev/ttyUSB1', 115200)
        
        #self.rate = rospy.Rate(1) #1000hz
        
        self.serial.write('<sor10>') 
        rospy.sleep(1)
        
        #print 50

        # self.serial.write('<lf>') #reset
        # rospy.sleep(1)     
        # print ('reset finish')
        # self.serial.write('<sof2>') # Pose 1: euler, 2: quaternion
        # rospy.sleep(1)
        # self.serial.write('<sog1>') # angular velocity (dps =degree per second)
        # rospy.sleep(1)
        # self.serial.write('<soa2>') # linear accel (g = 9.81m/s^2)
        # rospy.sleep(1)
        
        # self.serial.write('<sem>')
        # print ('setting finish')
        # rospy.sleep(1.2) #magneto off

        
        
    def publish(self):
        
    # Parse serial message line into a list of IMU data strings
    # containing integers.
        
        
        while not rospy.is_shutdown():
            
            
            readings = self.serial.readline()  # read a '\n' terminated line
            
            print "imu program"
            print(readings)

            if not readings:                # no data available
                rospy.logwarn('Invalid IMU message: ')
                print ('not connect')
                return
            
            
            
            str= readings.replace("*", "")
                        
            str= str.replace("\r\n", "")
            
            str_list = str.split(",")
            
            #print str_list
            
            if len(str_list) is not 10:
                continue
                
            msg = self.imus

            now = rospy.Time.now()          # time when message received
            msg.header.stamp = now
            
            try:
            # quaternion
                msg.orientation.x = float(str_list[0])
            except:
                new_list = str_list[0][4:]
                msg.orientation.x = float(new_list)
            msg.orientation.y = float(str_list[1])
            msg.orientation.z = float(str_list[2])
            msg.orientation.w = float(str_list[3])

            # linear acceleration
            x = convert_accel(str_list[7])
            y = convert_accel(str_list[8])
            z = convert_accel(str_list[9])

            msg.linear_acceleration = Vector3(x, y, z)

            # angular velpcotu
            x = math.radians(float(str_list[4]))
            y = math.radians(float(str_list[5]))
            z = math.radians(float(str_list[6]))
            msg.angular_velocity = Vector3(x, y, z)
            
            #rospy.loginfo(msg.orientation)
            #print msg.orientation
            
            #self.rate.sleep()
            self.pubs.publish(msg)
            rospy.loginfo(msg)

if __name__=="__main__":
    

    imu = ImuMessages()  # make an ImuMessages instance
    
    try:
        handler = imu.publish()  # declare message handler interface
                
    except rospy.ROSInterruptException:
        imu.serial.close()
    
