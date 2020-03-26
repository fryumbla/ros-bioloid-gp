extern "C" {
    #include "/home/francisco/schunk_ws/src/ik_control/remoteApi/extApi.h"
}
#include <iostream>
#include <string>
#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <sensor_msgs/JointState.h>

using namespace std;

int clientID;

sensor_msgs::JointState pub_msg;

int found(int a,char* b,int c,int d)
{
  if(simxGetObjectHandle(a,(const simxChar*) b,(simxInt *) &c,(simxInt) simx_opmode_oneshot_wait)){
    cout << "no joint " << d << " found" << std::endl;
  }
  else{
    return c;
    cout << "joint " << d << " found"  << std::endl;
  }

}

void joint_callback(const sensor_msgs::JointState& data)
{
  pub_msg.name=data.name;
  pub_msg.position = data.position;

  char* joints[21]={"joint_1","joint_2","joint_3","joint_4","joint_5","joint_6","joint_7","joint_8","joint_9","joint_10","joint_11","joint_12","joint_13","joint_14","joint_15","joint_16","joint_17","joint_18","joint_19","joint_20","joint_21"};
  int joint_handle[21]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  for (int i=0;i<=20; ++i){
    joint_handle[i]=found(clientID,joints[i],joint_handle[i],i+1);
  }
  for (int i=0;i<=20; ++i){
    simxSetJointTargetPosition(clientID, (simxInt) joint_handle[i], data.position.at(i), simx_opmode_oneshot);
  }

}

int main(int argc, char **argv) 
{
  string serverIP = "127.0.0.1";
  int serverPort = 19999;

  clientID=simxStart((simxChar*)serverIP.c_str(),serverPort,true,true,2000,5);
  
  if (clientID!=-1)
  {
    cout << "Servidor conectado!" << std::endl;
    
    ros::init(argc, argv, "ros_vrep_communication");
    ros::NodeHandle nh = ros::NodeHandle();
    
    ros::Subscriber sub = nh.subscribe("/joint_goals", 2000, joint_callback);

    // Waits for simulation time update.
    ros::Time last_ros_time_;
    bool wait = true;

    ros::spin();
    simxFinish(clientID); // fechando conexao com o servidor
    cout << "Conexao fechada!" << std::endl;
  }
  else
    cout << "Problemas para conectar con servidor!" << std::endl;
  return 0;
}


