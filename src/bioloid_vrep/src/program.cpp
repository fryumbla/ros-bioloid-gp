extern "C" {
    #include "/remoteApi/extApi.h"
}
#include <iostream>
#include <string>
#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <sensor_msgs/JointState.h>

using namespace std;
int clientID;
sensor_msgs::JointState pub_msg;

void joint_callback(const sensor_msgs::JointState& data)
{
  pub_msg.name=data.name;
  pub_msg.position = data.position;
  char* joints[21]={"joint_1","joint_2","joint_3".......
  int joint_handle[21];
  for (int i=0;i<=20; ++i){
    joint_handle[i]=simxGetObjectHandle(clientID,
    joints[i],joint_handle[i],simx_opmode_oneshot_wait);
    simxSetJointTargetPosition(clientID,joint_handle[i], 
              data.position.at(i), simx_opmode_oneshot);
}

int main(int argc, char **argv) 
{
  clientID=simxStart("127.0.0.1",19999,true,true,2000,5);
  if (clientID!=-1){
    cout << "Server connecter!" << std::endl;
    ros::init(argc, argv, "ros_vrep_communication");
    ros::NodeHandle nh = ros::NodeHandle();
    ros::Subscriber sub = nh.subscribe("/joint_states"
                                  ,2000,joint_callback);
    ros::Time last_ros_time_;
    bool wait = true;
    ros::spin();
    simxFinish(clientID);
    cout << "End connextion!" << std::endl;
  }
  else
    cout << "Server connection fail!" << std::endl;
  return 0;
}


