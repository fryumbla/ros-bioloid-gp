#include "interface_controller.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "moveit_vrep_interface");
  ros::NodeHandle n;

  ArmController left_arm("left_arm_controller/follow_joint_trajectory",n);
  ArmController right_arm("right_arm_controller/follow_joint_trajectory",n);

  ros::Rate rate(5000);

  while(ros::ok()){
    ros::spinOnce();
    left_arm.compute();
    right_arm.compute();


    rate.sleep();
  }


  return 0;
}
