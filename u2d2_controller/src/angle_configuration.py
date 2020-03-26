#!/usr/bin/env python
# -*- coding: utf-8 -*-


import rospy
from sensor_msgs.msg import JointState


pub = rospy.Publisher('joint_states', JointState, queue_size=10)

rospy.init_node("state_joints")

def callback(data):
    joints_states = JointState()
    joints_states.header=data.header
    joints_states.header.stamp=data.header.stamp
    joints_states.name=data.name
    joints_states.position=data.position
    joints_states.velocity=data.velocity
    joints_states.effort=data.effort

    pub.publish(joints_states)

def connect(): 

    while not rospy.is_shutdown():



        rate = rospy.Rate(10) # 10hz
        
        rospy.Subscriber('/dynamixel_workbench/joint_states', JointState, callback)

        rospy.spin()


if __name__ == '__main__':
    try:
        connect()
    except rospy.ROSInterruptException:
        portHandler.closePort()
        pass