#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import os
import sys

from std_msgs.msg import String


print "Select options " 
userinput=raw_input("1.Slow \n2.Normal Walk \nEnter Choice : ")

if userinput == '1':
    dly=1 
    spd=5
elif userinput == '2': 
    dly=0.3 
    spd=700
else:
    print "Not Valid Input !" 
    sys.exit()

def main():
    rospy.init_node('walk_sensor')
    pub = rospy.Publisher('robot', String, queue_size=10) 

    while not rospy.is_shutdown():
        rate = rospy.Rate(10) # 10hz
        rospy.spin()



if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        portHandler.closePort()
        pass