#!/usr/bin/env python
# -*- coding: utf-8 -*-

# este es para controlar los motores con SDK 


import rospy
import os

from sensor_msgs.msg import JointState
from std_msgs.msg import Header

if os.name == 'nt':
    import msvcrt
    def getch():
        return msvcrt.getch().decode()
else:
    import sys, tty, termios
    fd = sys.stdin.fileno()
    old_settings = termios.tcgetattr(fd)
    def getch():
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch

from dynamixel_sdk import *                    # Uses Dynamixel SDK library


# Control table address
#READ AND WRITE
AX_ANGLE_MINIMUN           = 6
AX_ANGLE_MAXIMUN           = 8

AX_TORQUE_ENABLE           = 24               # Control table address is different in Dynamixel model
AX_LED                     = 25                 

AX_GOAL_POSITION           = 30             #It is a position value of destination. 0 ~ 1,023 (0x3FF) is available. 
                                            #The unit is 0.29°. If Goal Position is out of the range, 
                                            #Angle Limit Error Bit (Bit 1) of Status Packet is returned as ‘1’ and Alarm is triggered as set in Alarm LED/Shutdown.
AX_MOVING_SPEED            = 32
AX_TORQUE_LIMIT            = 34

#ONLY READ
AX_PRESENT_POSITION        = 36
AX_PRESENT_SPEED           = 38
AX_PRESENT_LOAD            = 40
AX_PRESENT_VOLTAGE         = 42
AX_PRESENT_TEMPERATURE     = 43

# Protocol version
PROTOCOL_VERSION            = 1.0               # See which protocol version is used in the Dynamixel
# Default setting
DXL_ID                      = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]                 # Dynamixel ID : 1


BAUDRATE                    = 1000000             # Dynamixel default baudrate : 57600
DEVICENAME                  = '/dev/ttyUSB0'    # Check which port is being used on your controller
                                                # ex) Windows: "COM1"   Linux: "/dev/ttyUSB0" Mac: "/dev/tty.usbserial-*"
ANGLE_MINIMUN               = [2,2,350,2,195,233,204,384,363,151,120,138,511,2,395,162,195,195,2,2,2]
ANGLE_MAXIMUN               = [1022,1022,1022,680,793,831,638,816,865,656,886,900,1022,513,855,628,825,818,1022,1022,710]

# ANGLE_MINIMUN               = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
# ANGLE_MAXIMUN               = [1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023,1023]

DXL_MINIMUM_POSITION_VALUE  = 0           # Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 1023            # and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 20                # Dynamixel moving status threshold

index = 0
dxl_goal_position = [DXL_MINIMUM_POSITION_VALUE, DXL_MAXIMUM_POSITION_VALUE]         # Goal position

# Initialize PortHandler instance
# Set the port path
# Get methods and members of PortHandlerLinux or PortHandlerWindows
portHandler = PortHandler(DEVICENAME)
packetHandler = PacketHandler(PROTOCOL_VERSION)

def comunication():
    # Open port
    if portHandler.openPort():
        print("Succeeded to open the port")
    else:
        print("Failed to open the port")
        print("Press any key to terminate...")
        getch()
        quit()

    # Set port baudrate
    if portHandler.setBaudRate(BAUDRATE):
        print("Succeeded to change the baudrate")
    else:
        print("Failed to change the baudrate")
        print("Press any key to terminate...")
        getch()
        quit()
    
    # set_angle_minimun_limit()
    # set_angle_maximun_limit()

    for i in DXL_ID:
        dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, i, AX_TORQUE_ENABLE, 0)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
        else:
            print("Dynamixel: ",i," has been successfully connected")


def set_angle_minimun_limit():
    for i in DXL_ID:     
        dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, i, AX_ANGLE_MINIMUN, ANGLE_MINIMUN[i-1])#
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
    print("Dynamixel has been successfully set minimun angle")

def set_angle_maximun_limit():
    for i in DXL_ID:     
        dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, i, AX_ANGLE_MAXIMUN, 1023)#ANGLE_MAXIMUN[i-1]
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
    print("Dynamixel has been successfully set maximun angle")

def torque(order):
    for i in DXL_ID:
        dxl_comm_result, dxl_error = packetHandler.write1ByteTxRx(portHandler, i, AX_TORQUE_ENABLE, order)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
        else:
            if order == 1:
                print("Torque of Motor ",i," is on")
            else:
                print("Torque of Motor ",i," is off")

def ini_position():
    for i in DXL_ID:
        dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, i, AX_GOAL_POSITION, 512)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))

def read_positions():
        # Read present position
    joint_position=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    for i in DXL_ID:
        dxl_present_position, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, i, AX_PRESENT_POSITION)#AX_PRESENT_POSITION
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
        joint_position[i-1]=dxl_present_position


    return joint_position

def read_tempeture():
    # Read present temperature
    temperature=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    for i in DXL_ID:
        dxl_present_temperature, dxl_comm_result, dxl_error = packetHandler.read4ByteTxRx(portHandler, i, AX_PRESENT_TEMPERATURE)
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))
        temperature[i-1]=dxl_present_temperature
    return temperature
    

def convertRadian2Value(radian):
    value = 0
    zero_position = (1023 + 0)/2
    # 1.570796327 pi  the angle in the dynamixel motor is 0 to 300 degree 150 degree represent 2.61799 radians
    if (radian > 0):
        value = (int)(radian * (1023 - zero_position) / 2.61799) + zero_position
    elif (radian < 0):
        value = (int)(-radian * (0 - zero_position) / 2.61799) + zero_position
    else:
        value = zero_position

    return value


def convertValue2Radian(value):

    radian = 0.0
    zero_position = (1023 + 0)/2

    if (value > zero_position):
        radian = (float)(value - zero_position) * 1.5708 / (float)(1023 - zero_position)
    elif (value < zero_position):
        radian = (float)(value - zero_position) * 0.1 / (float)(0 - zero_position)
    return radian




def callback(data):
      
    for i in DXL_ID:     
        dxl_comm_result, dxl_error = packetHandler.write4ByteTxRx(portHandler, i, AX_GOAL_POSITION, convertRadian2Value(data.position[i-1]))
        if dxl_comm_result != COMM_SUCCESS:
            print("%s" % packetHandler.getTxRxResult(dxl_comm_result))
        elif dxl_error != 0:
            print("%s" % packetHandler.getRxPacketError(dxl_error))

    joint_position_state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    pub = rospy.Publisher('current_joint_states', JointState, queue_size=10)
    joints_states = JointState()
    joints_states.header = Header()
    joints_states.header.stamp = rospy.Time.now()
    joints_states.name = ['joint_1', 'joint_2', 'joint_3','joint_4', 'joint_5', 'joint_6', 'joint_7','joint_8', 'joint_9', 'joint_10', 'joint_11', 'joint_12', 'joint_13','joint_14', 'joint_15', 'joint_16', 'joint_17','joint_18', 'joint_19', 'joint_20', 'joint_21']
    
    joint_position=read_positions()
    
    for i in range(0,20):
        joint_position_state[i]=convertValue2Radian(joint_position[i])

    print(read_tempeture())

    joints_states.position = joint_position_state
    joints_states.velocity = []
    joints_states.effort = []
    pub.publish(joints_states)
    

def main():

    rospy.init_node("communication")
    comunication()
    torque(1)
    ini_position()
    # torque(0)
           
    # while not rospy.is_shutdown():
        
    #     joint_position_state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    #     pub = rospy.Publisher('joint_states', JointState, queue_size=10)
    #     rospy.init_node("state_joints")
    #     # rate = rospy.Rate(1000000) # 10hz
    #     rate = rospy.Rate(10) # 10hz   
    #     joints_states = JointState()
    #     joints_states.header = Header()
    #     joints_states.header.stamp = rospy.Time.now()
    #     joints_states.name = ['joint_1', 'joint_2', 'joint_3','joint_4', 'joint_5', 'joint_6', 'joint_7','joint_8', 'joint_9', 'joint_10', 'joint_11', 'joint_12', 'joint_13','joint_14', 'joint_15', 'joint_16', 'joint_17','joint_18', 'joint_19', 'joint_20', 'joint_21']
        
    #     joint_position=read_positions()
        
    #     for i in range(0,20):
    #         joint_position_state[i]=convertValue2Radian(joint_position[i])


    #     joints_states.position = joint_position_state
    #     joints_states.velocity = []
    #     joints_states.effort = []
    #     pub.publish(joints_states)
        # rate.sleep()   

    while not rospy.is_shutdown():

        rospy.Subscriber('/joint_goals', JointState, callback)
        rate = rospy.Rate(10) # 10hz
        rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        portHandler.closePort()
        pass
    



    
        



    
