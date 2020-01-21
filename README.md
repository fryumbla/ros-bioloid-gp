# ros-bioloid-gp


este esta estable 
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

u2d2 controler utiliza el paquete dynamixel_workbench_controllers falta terminar el .yaml con toda la configuracion de los joints


