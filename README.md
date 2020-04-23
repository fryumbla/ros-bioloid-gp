[![ROS](http://www.ros.org/wp-content/uploads/2013/10/rosorg-logo1.png)](http://www.ros.org/)

<h1 style="border:none"> SOCIAL ROBOT (BIOLOID GP) Simulation and Manipulation Package </h1>
&copy; 2020, Francisco Yumbla

<hr>

## 1. How to Install

### 1.1. System Requirements

This package is written an tested on **Ubuntu 18.04 + ROS Melodic** environment. Dependencies are also for this environment.

#### 1.1.1 Desktop 

Install ROS in your Ubuntu 18.04 computer (follow this tutorials): http://wiki.ros.org/melodic/Installation/Ubuntu

Create a ROS Workspace: ~/catkin_ws

#### 1.1.2 Jetson Nano

Getting Jetson Nano Started: https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit

Ros installer (follow this tutorials to install ROS Melodic in jetson nano): http://wiki.ros.org/melodic/Installation/Ubuntu

Install the ROS Desktop package, including support for rqt, rvizand other useful robotics packages:
```
sudo apt install ros-melodic-desktop
```

Note: “ROS Desktop Full” is a more complete package, however it is not recommended for an embedded platform; 2D/3D simulators will be installed with it and they take too much space on ROM, and are too computationally hungry to be used on the Jetson Nano.


### 1.2. Dependencies Prerequisites

Please install all the packages listed below in your Ubuntu PC or Jetson Nano, in the given order.

* For description package:
   ```
   ros-melodic-joint-state-publisher
   ros-melodic-joint-state-publisher-gui
   ```
* ros-melodic-
* ros-melodic-
* ros-melodic-
* ros-melodic-
* ros-melodic-
* ros-melodic-moveit

    <!-- [1] abb_experimental is literally *experimental*, so it is not configured as an `.deb` packag. Therefore, it should be downloaded from the Github reposity. Do `git clone https://github.com/ros-industrial/abb_experimental` inside `${ros_workspace}/src`. -->


### 1.3 Build

Extract the metapackage `ros-bioloid-gp` into `${ros_workspace}/src`. `catkin_make` your workspace.
```
git clone --recursive https://github.com/fryumbla/ros-bioloid-gp.git
catkin_make
```

### 1.4. V-REP

The bioloid-gp-project uses  a v-rep simulator (version 3.5.0 or higher).

Download: [V-REP Linux](http://www.coppeliarobotics.com/downloads.html)

Decompress
```
tar -xvzf {file_name}
```

Execution
```
cd {v-rep directory path}
./vrep.sh
```
To work with ROS, the socialrobot project uses a remote api. Modify the remoteApiConnections.txt file in the vrep directory to enable it .
```
portIndex1_port             = 19997
```

## 2. Structure of Package

To be updated...


## 3. How to Use

### 3.1. Simulation

#### 3.1.1 V-REP Simulation

1. V-REP execution (Since simulation is performed with vrep remote api, roscore must be executed first)

2. Run the next node for the communication Vrep to ros
   ```
   rosrun bioloid_vrep comunication
   ```

To see the list of movement, type `rosrun bioloid_gp_master movement.py` program, introduce the number do you want to move `1 2 3` and `Enter`.
This node publis the joints goals in the topic `/joint_goals`

#### 3.1.2 Gazebo Simulation

1. Launch the robot in gazebo
   ```
   roslaunch bioloidgp_social_robot gazebo.launch

   ```

2. Run the next node for the communication ROS to Gazebo
   ```
   rosrun bioloid_gp_master communitation_gazebo.py 
   ```
To see the list of movement, type `rosrun bioloid_gp_master movement.py` program, introduce the number do you want to move `1 2 3` and `Enter`.
This node publis the joints goals in the topic `/joint_goals`


### 3.2. Real Robot

You can use the communication controller. Type `rosrun bioloid_gp_communication communication.py` in the terminal, , and you will get the comunication TTL to the Dynamixel motors. 
To see the list of movement, type `rosrun bioloid_gp_master movement.py` program, introduce the number do you want to move `1 2 3` and `Enter`.

<!-- ### 3.3. Path-Planning APIs

The script `assembler_controller.py` provides a convenient method to plan paths. One should give the pose of end-effector in the following form; [x, y, z, roll, pitch, yaw].

* `move_to_pose()`: move to designated pose 
* `move_by_cartesian_path()`: move to designated pose, in straight path.
* `rotate_joint()`: rotate specific joint by desiged angle. This method gets the angles of all 6 joints, add the given value to specified joint, and then makes the robot go to that configuration. Therefore, the joints that are not designated to move might move by a little angle, due to controller errors. -->



<!-- este esta estable 
roslaunch u2d2_controller dynamixel_controller.launch      start the comunication for all dynamixel and wait the goal position

roslaunch u2d2_controller dynamixel_controller.launch      start the comunication for all Dynamixel motors   the output is the dynamixel_workbench
roslaunch u2d2_controller angle_configuration.launch       sirve para subscribirse en el anteriior y cambiar de topico y crear nodo the joint_states

roslaunch bioloid_gp4 display.launch           el siguiente codigo es el default the solidworks con angulos fake
roslaunch bioloid_gp4 displayfran.launch       este de aca es la mia per debo sin angulos por eso causa error necesito topic de angulos que lo da el codigo de angle configuration



con sdk este es el codigo de funcion  pero es inestable 
      
roslaunch u2d2_controller read_write.launch    esta utiliza SDK para controlar los motores pero es inestable en rviz
roslaunch bioloid_gp4 displayfran.launch       este de aca es la mia per debo sin angulos por eso causa error necesito topic de angulos que lo da el codigo de angle configuration



listo el programa de comunicacion y control 
roslaunch bioloid_gp4 displayfran.launch
roslaunch u2d2_controller read_write.launch

open vrep and play
rosrun bioloid_vrep comunication


el ejemplo tutorial utiliza el paquede dynamixel_controller

u2d2 controler utiliza el paquete dynamixel_workbench_controllers falta terminar el .yaml con toda la configuracion de los joints -->


