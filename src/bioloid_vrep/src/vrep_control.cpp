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
  if(simxGetObjectHandle(a,(const simxChar*) b,(simxInt *) &c,(simxInt) simx_opmode_oneshot_wait))
  {
    cout << "no joint " << d << " found" << std::endl;
  }
  else
  {
    return c;
    cout << "joint " << d << " found"  << std::endl;
  }

}

void joint_callback(const sensor_msgs::JointState& data)
{
  pub_msg.name=data.name;
  pub_msg.position = data.position;


  int joint_1_handle=0;
  int joint_2_handle=0;
  int joint_3_handle=0;
  int joint_4_handle=0;
  int joint_5_handle=0;
  int joint_6_handle=0;
  int joint_7_handle=0;
  int joint_8_handle=0;
  int joint_9_handle=0;
  int joint_10_handle=0;
  int joint_11_handle=0;
  int joint_12_handle=0;
  int joint_13_handle=0;
  int joint_14_handle=0;
  int joint_15_handle=0;
  int joint_16_handle=0;
  int joint_17_handle=0;
  int joint_18_handle=0;
  int joint_19_handle=0;
  int joint_20_handle=0;
  int joint_21_handle=0;

  joint_1_handle=found(clientID,"joint_1",joint_1_handle,1);
  joint_2_handle=found(clientID,"joint_2",joint_2_handle,2);
  joint_3_handle=found(clientID,"joint_3",joint_3_handle,3);
  joint_4_handle=found(clientID,"joint_4",joint_4_handle,4);
  joint_5_handle=found(clientID,"joint_5",joint_5_handle,5);
  joint_6_handle=found(clientID,"joint_6",joint_6_handle,6);
  joint_7_handle=found(clientID,"joint_7",joint_7_handle,7);
  joint_8_handle=found(clientID,"joint_8",joint_8_handle,8);
  joint_9_handle=found(clientID,"joint_9",joint_9_handle,9);
  joint_10_handle=found(clientID,"joint_10",joint_10_handle,10);
  joint_11_handle=found(clientID,"joint_11",joint_11_handle,11);
  joint_12_handle=found(clientID,"joint_12",joint_12_handle,12);
  joint_13_handle=found(clientID,"joint_13",joint_13_handle,13);
  joint_14_handle=found(clientID,"joint_14",joint_14_handle,14);
  joint_15_handle=found(clientID,"joint_15",joint_15_handle,15);
  joint_16_handle=found(clientID,"joint_16",joint_16_handle,16);
  joint_17_handle=found(clientID,"joint_17",joint_17_handle,17);
  joint_18_handle=found(clientID,"joint_18",joint_18_handle,18);
  joint_19_handle=found(clientID,"joint_19",joint_19_handle,19);
  joint_20_handle=found(clientID,"joint_20",joint_20_handle,20);
  joint_21_handle=found(clientID,"joint_21",joint_21_handle,21);

  // cout << joint_1_handle  << std::endl;
  // cout << joint_2_handle << std::endl;
  // cout << joint_3_handle << std::endl;
  // cout << joint_4_handle << std::endl;
  // cout << joint_5_handle << std::endl;
 



  //simxGetJointPosition(clientID, joint_1_handle, simx_opmode_streaming);
  simxSetJointTargetPosition(clientID, (simxInt) joint_1_handle, data.position.at(0), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_2_handle, data.position.at(2), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_3_handle, data.position.at(4), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_4_handle, data.position.at(6), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_5_handle, data.position.at(1), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_6_handle, data.position.at(3), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_7_handle, data.position.at(5), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_8_handle, data.position.at(7), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_9_handle, data.position.at(18), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_10_handle, data.position.at(8), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_11_handle, data.position.at(10), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_12_handle, data.position.at(12), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_13_handle, data.position.at(14), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_14_handle, data.position.at(16), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_15_handle, data.position.at(9), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_16_handle, data.position.at(11), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_17_handle, data.position.at(13), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_18_handle, data.position.at(15), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_19_handle, data.position.at(17), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_20_handle, data.position.at(19), simx_opmode_oneshot);
  simxSetJointTargetPosition(clientID, (simxInt) joint_21_handle, data.position.at(20), simx_opmode_oneshot);


  //cout << pub_msg.name.at(0) << std::endl;
}

int main(int argc, char **argv) 
{
  string serverIP = "127.0.0.1";
  int serverPort = 19999;

  clientID=simxStart((simxChar*)serverIP.c_str(),serverPort,true,true,2000,5);
 
  if (clientID!=-1)
  {
    cout << "Servidor conectado!" << std::endl;
    
    ros::init(argc, argv, "vrep_control");
    ros::NodeHandle nh = ros::NodeHandle();
    
    ros::Subscriber sub = nh.subscribe("/joint_states", 2000, joint_callback);

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


