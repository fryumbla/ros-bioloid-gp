[![ROS](http://www.ros.org/wp-content/uploads/2013/10/rosorg-logo1.png)](http://www.ros.org/)

<h1 style="border:none"> SOCIAL ROBOT (BIOLOID GP) Simulation and Manipulation Package </h1>
&copy; 2020, Francisco Yumbla

<hr>

## 1. How to Install

### 1.1. System Requirements

This package is written an tested on **Ubuntu 18.04 + ROS Melodic** environment. Dependencies are also for this environment.

V-REP must be installed in advance.

### 1.2. Dependencies Prerequisites

There are a number of dependencies in this package, since the ABB robot is operated by ROS-Industrial package. Please install all the packages listed below in your Ubuntu PC, in the given order.

* ros-melodic-desktop-full
* ros-melodic-industrial-core
* ros-melodic-industrial-msgs
* ros-melodic-industrial-robot-client
* ros-melodic-industrial-robot-simulator
* ros-melodic-industrial-utils
* ros-melodic-moveit

    <!-- [1] abb_experimental is literally *experimental*, so it is not configured as an `.deb` packag. Therefore, it should be downloaded from the Github reposity. Do `git clone https://github.com/ros-industrial/abb_experimental` inside `${ros_workspace}/src`. -->


### 1.2. Build

Extract the metapackage `ros-bioloid-gp` into `${ros_workspace}/src`. `catkin_make` your workspace.
```
git clone --recursive https://github.com/fryumbla/ros-bioloid-gp.git
catkin_make
```



### 1.3. V-REP

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

2. Run the modules needed for the demo with roslaunch
   ```
   roslaunch socialrobot_state demo_init.launch
   ```

Type `rosrun rise_assembler assembler_manual_controller` in the terminal, and you will get the comunication TTL to the Dynamixel motors. 
To see the list of movement, type `rosrun bioloid_gp_master movement.py` program, introduce the number do you want to move `1 2 3` and `Enter`.

#### 3.1.2 Gazebo Simulation

1. V-REP execution (Since simulation is performed with vrep remote api, roscore must be executed first)

2. Run the modules needed for the demo with roslaunch
   ```
   roslaunch socialrobot_state demo_init.launch
   ```

Type `rosrun rise_assembler assembler_manual_controller` in the terminal, and you will get the comunication TTL to the Dynamixel motors. 
To see the list of movement, type `rosrun bioloid_gp_master movement.py` program, introduce the number do you want to move `1 2 3` and `Enter`.


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


