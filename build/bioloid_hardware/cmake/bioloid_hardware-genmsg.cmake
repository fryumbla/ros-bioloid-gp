# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "bioloid_hardware: 1 messages, 4 services")

set(MSG_I_FLAGS "-Ibioloid_hardware:/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Ivision_msgs:/opt/ros/melodic/share/vision_msgs/cmake/../msg;-Itrajectory_msgs:/opt/ros/melodic/share/trajectory_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(bioloid_hardware_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" NAME_WE)
add_custom_target(_bioloid_hardware_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioloid_hardware" "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" ""
)

get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" NAME_WE)
add_custom_target(_bioloid_hardware_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioloid_hardware" "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" ""
)

get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" NAME_WE)
add_custom_target(_bioloid_hardware_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioloid_hardware" "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" ""
)

get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" NAME_WE)
add_custom_target(_bioloid_hardware_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioloid_hardware" "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" "trajectory_msgs/JointTrajectory:trajectory_msgs/JointTrajectoryPoint:std_msgs/Header"
)

get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" NAME_WE)
add_custom_target(_bioloid_hardware_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "bioloid_hardware" "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" "geometry_msgs/Vector3:geometry_msgs/Pose:vision_msgs/BoundingBox3D:geometry_msgs/Quaternion:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
)

### Generating Services
_generate_srv_cpp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_cpp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_cpp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_cpp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
)

### Generating Module File
_generate_module_cpp(bioloid_hardware
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(bioloid_hardware_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(bioloid_hardware_generate_messages bioloid_hardware_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_cpp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_cpp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_cpp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_cpp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_cpp _bioloid_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioloid_hardware_gencpp)
add_dependencies(bioloid_hardware_gencpp bioloid_hardware_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioloid_hardware_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
)

### Generating Services
_generate_srv_eus(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_eus(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_eus(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_eus(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
)

### Generating Module File
_generate_module_eus(bioloid_hardware
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(bioloid_hardware_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(bioloid_hardware_generate_messages bioloid_hardware_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_eus _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_eus _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_eus _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_eus _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_eus _bioloid_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioloid_hardware_geneus)
add_dependencies(bioloid_hardware_geneus bioloid_hardware_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioloid_hardware_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
)

### Generating Services
_generate_srv_lisp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_lisp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_lisp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_lisp(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
)

### Generating Module File
_generate_module_lisp(bioloid_hardware
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(bioloid_hardware_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(bioloid_hardware_generate_messages bioloid_hardware_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_lisp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_lisp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_lisp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_lisp _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_lisp _bioloid_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioloid_hardware_genlisp)
add_dependencies(bioloid_hardware_genlisp bioloid_hardware_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioloid_hardware_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
)

### Generating Services
_generate_srv_nodejs(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_nodejs(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_nodejs(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_nodejs(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
)

### Generating Module File
_generate_module_nodejs(bioloid_hardware
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(bioloid_hardware_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(bioloid_hardware_generate_messages bioloid_hardware_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_nodejs _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_nodejs _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_nodejs _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_nodejs _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_nodejs _bioloid_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioloid_hardware_gennodejs)
add_dependencies(bioloid_hardware_gennodejs bioloid_hardware_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioloid_hardware_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
)

### Generating Services
_generate_srv_py(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_py(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_py(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/melodic/share/vision_msgs/cmake/../msg/BoundingBox3D.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
)
_generate_srv_py(bioloid_hardware
  "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectory.msg;/opt/ros/melodic/share/trajectory_msgs/cmake/../msg/JointTrajectoryPoint.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
)

### Generating Module File
_generate_module_py(bioloid_hardware
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(bioloid_hardware_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(bioloid_hardware_generate_messages bioloid_hardware_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_py _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetSimState.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_py _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/msg/VrepState.msg" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_py _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepSetJointTrajectory.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_py _bioloid_hardware_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_hardware/srv/VrepGetObstacles.srv" NAME_WE)
add_dependencies(bioloid_hardware_generate_messages_py _bioloid_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(bioloid_hardware_genpy)
add_dependencies(bioloid_hardware_genpy bioloid_hardware_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS bioloid_hardware_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/bioloid_hardware
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(bioloid_hardware_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(bioloid_hardware_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(bioloid_hardware_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET vision_msgs_generate_messages_cpp)
  add_dependencies(bioloid_hardware_generate_messages_cpp vision_msgs_generate_messages_cpp)
endif()
if(TARGET trajectory_msgs_generate_messages_cpp)
  add_dependencies(bioloid_hardware_generate_messages_cpp trajectory_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/bioloid_hardware
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(bioloid_hardware_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(bioloid_hardware_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(bioloid_hardware_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET vision_msgs_generate_messages_eus)
  add_dependencies(bioloid_hardware_generate_messages_eus vision_msgs_generate_messages_eus)
endif()
if(TARGET trajectory_msgs_generate_messages_eus)
  add_dependencies(bioloid_hardware_generate_messages_eus trajectory_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/bioloid_hardware
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(bioloid_hardware_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(bioloid_hardware_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(bioloid_hardware_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET vision_msgs_generate_messages_lisp)
  add_dependencies(bioloid_hardware_generate_messages_lisp vision_msgs_generate_messages_lisp)
endif()
if(TARGET trajectory_msgs_generate_messages_lisp)
  add_dependencies(bioloid_hardware_generate_messages_lisp trajectory_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/bioloid_hardware
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(bioloid_hardware_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(bioloid_hardware_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(bioloid_hardware_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET vision_msgs_generate_messages_nodejs)
  add_dependencies(bioloid_hardware_generate_messages_nodejs vision_msgs_generate_messages_nodejs)
endif()
if(TARGET trajectory_msgs_generate_messages_nodejs)
  add_dependencies(bioloid_hardware_generate_messages_nodejs trajectory_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/bioloid_hardware
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(bioloid_hardware_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(bioloid_hardware_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(bioloid_hardware_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET vision_msgs_generate_messages_py)
  add_dependencies(bioloid_hardware_generate_messages_py vision_msgs_generate_messages_py)
endif()
if(TARGET trajectory_msgs_generate_messages_py)
  add_dependencies(bioloid_hardware_generate_messages_py trajectory_msgs_generate_messages_py)
endif()
