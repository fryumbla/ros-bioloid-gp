#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import roslib
import os
from sensor_msgs.msg import JointState
from std_msgs.msg import Header
from dynamixel_sdk import *                    # Uses Dynamixel SDK library

# Control table address for AX-12A and AX-18A
#READ AND WRITE
AX_BAUD_RATE               = 4
AX_RETURN_DELAY_TIME       = 5
AX_ANGLE_MINIMUN           = 6
AX_ANGLE_MAXIMUN           = 8

AX_TORQUE_ENABLE           = 24              
AX_LED                     = 25
CW_COMPILANCE_MARGIN       = 26
CCW_COMPILANCE_MARGIN      = 27
CW_COMPILANCE_SLOPE        = 28
CCW_COMPILANCE_SLOPE       = 29
AX_GOAL_POSITION           = 30             #It is a position value of destination. 0 ~ 1,023 (0x3FF) is available. #The unit is 0.29°. If Goal Position is out of the range,     
AX_MOVING_SPEED            = 32
AX_TORQUE_LIMIT            = 34

#ONLY READ
AX_PRESENT_POSITION        = 36
AX_PRESENT_SPEED           = 38
AX_PRESENT_LOAD            = 40
AX_PRESENT_VOLTAGE         = 42
AX_PRESENT_TEMPERATURE     = 43
AX_REGISTERED              = 44
AX_MOVING                  = 46     # Goal position command execution is in progress
AX_LOCK                    = 47     #Locking EEPROM	
AX_PUNCH                   = 48     #Minimum Current Threshold	

# Protocol version
PROTOCOL_VERSION            = 1.0               # See which protocol version is used in the Dynamixel
# Default setting

DXL_ID                      = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]          # Dynamixel ID : 1
ANGLE_MINIMUN               = [2,   2,   350,   2,195,233,204,384,363,151,120,138,511, 2,  395,162,195,195,   2,   2,  2] #0
ANGLE_MAXIMUN               = [1022,1022,1022,680,793,831,638,816,865,656,886,900,1022,513,855,628,825,818,1022,1022,710] #1023


class AX_motor:

    def __init__(self,usb_port,dxl_baud_rate):
        
        self.portHandler = PortHandler(usb_port)
        self.packetHandler = PacketHandler(PROTOCOL_VERSION)

        self.r =rospy.Rate(10) # 10hz
        self.joints_states = JointState()

        self.joint_position=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        self.joint_position_state=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        self.temperature=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        
        self.comunication(dxl_baud_rate)
        self.set_baud_rate()
        self.set_return_delay_time()
        self.set_angle_minimun_limit()
        self.set_angle_maximun_limit()

        self.sendmovingspeed()
        self.torque(1)
        # self.ini_position()
        # self.torque(0)

        # Publish current robot state
        self.joint_state_pub = rospy.Publisher('/joint_states', JointState, queue_size=10)

        # Subscribe desired joint position
        self.joint_goal_sub = rospy.Subscriber('/joint_goals', JointState, self.sendgoalpositions, queue_size=5)

        print("Read Joint goals")
        print(self.read_tempeture())

    def loop(self):
        while not rospy.is_shutdown():
            
            rospy.spin()
            self.joint_state_publisher()
            # self.current(DXL_ID,self.portHandler)
            self.r.sleep()
        print("PORT CLOSE")
        self.portHandler.closePort()


    def comunication(self,dxl_baud_rate):
        # Open port
        if self.portHandler.openPort():
            print("Succeeded to open the port")
        else:
            print("Failed to open the port")
            print("Press any key to terminate...")
            getch()
            quit()

        # Set port baudrate
        if self.portHandler.setBaudRate(dxl_baud_rate):
            print("Succeeded to change the baudrate")
        else:
            print("Failed to change the baudrate")
            print("Press any key to terminate...")
            getch()
            quit()

        for i in DXL_ID:
            dxl_comm_result, dxl_error = self.packetHandler.write1ByteTxRx(self.portHandler, i, AX_TORQUE_ENABLE, 0)
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
            else:
                print("Dynamixel: ",i," has been successfully connected")

    def set_baud_rate(self):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write1ByteTxRx(self.portHandler, i, AX_BAUD_RATE, 1)
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
        print("Dynamixel has been successfully set baud rate")

    def set_return_delay_time(self):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write1ByteTxRx(self.portHandler, i, AX_RETURN_DELAY_TIME, 250)
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
        print("Dynamixel has been successfully set return delay time")

    def set_angle_minimun_limit(self):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write2ByteTxRx(self.portHandler, i, AX_ANGLE_MINIMUN, ANGLE_MINIMUN[i-1])
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
        print("Dynamixel has been successfully set minimun angle")

    def set_angle_maximun_limit(self):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write2ByteTxRx(self.portHandler, i, AX_ANGLE_MAXIMUN, ANGLE_MAXIMUN[i-1])
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
        print("Dynamixel has been successfully set maximun angle")

    def torque(self,order):
        for i in DXL_ID:
            dxl_comm_result, dxl_error = self.packetHandler.write1ByteTxRx(self.portHandler, i, AX_TORQUE_ENABLE, order)
            if dxl_comm_result != COMM_SUCCESS:
                print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("%s" % self.packetHandler.getRxPacketError(dxl_error))
            else:
                if order == 1:
                    print("Torque of Motor ",i," is on")
                else:
                    print("Torque of Motor ",i," is off")

    def ini_position(self):
        for i in DXL_ID:
            dxl_comm_result, dxl_error = self.packetHandler.write4ByteTxRx(self.portHandler, i, AX_GOAL_POSITION, 512)
            if dxl_comm_result != COMM_SUCCESS:
                print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("%s" % self.packetHandler.getRxPacketError(dxl_error))
        print("Dynamixel has been successfully set inicial position")

    def convertValue2Radian(self,value):
        radian = 0.0
        zero_position = 512
        if (value == 512):
            radian = 0.0
        else:
            if (value > zero_position):
                radian = (float)(value - zero_position) * 2.61799 / (float)(zero_position)
            if (value < zero_position):
                radian = (float)(zero_position - value) *-2.61799  / (float)(zero_position)
        return radian   

    def read_positions(self):# Read present position
        for i in DXL_ID:
            dxl_present_position, dxl_comm_result, dxl_error = self.packetHandler.read4ByteTxRx(self.portHandler, i, AX_PRESENT_POSITION)#AX_PRESENT_POSITION
            if dxl_comm_result != COMM_SUCCESS:
                print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("%s" % self.packetHandler.getRxPacketError(dxl_error))
            if (dxl_present_position<1023):    
                    self.joint_position[i-1]=dxl_present_position
        return self.joint_position

    def read_load(self):# Read present load
        for i in DXL_ID:
            dxl_present_temperature, dxl_comm_result, dxl_error = self.packetHandler.read4ByteTxRx(self.portHandler, i, AX_PRESENT_LOAD)
            if dxl_comm_result != COMM_SUCCESS:
                print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("%s" % self.packetHandler.getRxPacketError(dxl_error))
            self.temperature[i-1]=dxl_present_temperature
        return self.temperature
    
    def read_volgate(self):# Read present voltage
        for i in DXL_ID:
            dxl_present_temperature, dxl_comm_result, dxl_error = self.packetHandler.read4ByteTxRx(self.portHandler, i, AX_PRESENT_VOLTAGE)
            if dxl_comm_result != COMM_SUCCESS:
                print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("%s" % self.packetHandler.getRxPacketError(dxl_error))
            self.temperature[i-1]=dxl_present_temperature
        return self.temperature

    def read_tempeture(self):# Read present temperature
        for i in DXL_ID:
            dxl_present_temperature, dxl_comm_result, dxl_error = self.packetHandler.read4ByteTxRx(self.portHandler, i, AX_PRESENT_TEMPERATURE)
            if dxl_comm_result != COMM_SUCCESS:
                print("%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("%s" % self.packetHandler.getRxPacketError(dxl_error))
            self.temperature[i-1]=dxl_present_temperature
        return self.temperature
        
    def convertRadian2Value(self,radian):
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

    def sendgoalpositions(self, data):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write2ByteTxRx(self.portHandler, i, AX_GOAL_POSITION, self.convertRadian2Value(data.position[i-1]))
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
        self.joint_state_publisher()
    def sendmovingspeed(self):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write2ByteTxRx(self.portHandler, i, AX_MOVING_SPEED, 50)
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))

    def sendtorquelimit(self):
        for i in DXL_ID:     
            dxl_comm_result, dxl_error = self.packetHandler.write2ByteTxRx(self.portHandler, i, AX_TORQUE_LIMIT, 1023)
            if dxl_comm_result != COMM_SUCCESS:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getTxRxResult(dxl_comm_result))
            elif dxl_error != 0:
                print("Dynamixel: ",i,"%s" % self.packetHandler.getRxPacketError(dxl_error))
        
    def joint_state_publisher(self):
        self.joints_states = JointState()
        self.joints_states.header = Header()
        self.joints_states.header.stamp = rospy.Time.now()
        self.joints_states.name = ['joint_1', 'joint_2', 'joint_3','joint_4', 'joint_5', 'joint_6', 'joint_7','joint_8', 'joint_9', 'joint_10', 'joint_11', 'joint_12', 'joint_13','joint_14', 'joint_15', 'joint_16', 'joint_17','joint_18', 'joint_19', 'joint_20', 'joint_21']
        
        joint_position=self.read_positions()
        
        for i in range(0,21):
            self.joint_position_state[i]=self.convertValue2Radian(joint_position[i])

        self.joints_states.position = self.joint_position_state
        self.joints_states.velocity = []
        self.joints_states.effort = []
        self.joint_state_pub.publish(self.joints_states)





if __name__ == '__main__':

    rospy.init_node("dynamixel_motors_communication")

    usb_port = rospy.get_param('~usb_port')
    dxl_baud_rate = rospy.get_param('~dxl_baud_rate')

    motor = AX_motor(usb_port,dxl_baud_rate)
    motor.loop()



    



    
        



    
