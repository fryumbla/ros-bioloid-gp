# Install script for directory: /home/francisco/robotis_ws/src/ros-bioloid-gp/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/francisco/robotis_ws/src/ros-bioloid-gp/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/francisco/robotis_ws/src/ros-bioloid-gp/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/francisco/robotis_ws/src/ros-bioloid-gp/install" TYPE PROGRAM FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/francisco/robotis_ws/src/ros-bioloid-gp/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/francisco/robotis_ws/src/ros-bioloid-gp/install" TYPE PROGRAM FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/francisco/robotis_ws/src/ros-bioloid-gp/install/setup.bash;/home/francisco/robotis_ws/src/ros-bioloid-gp/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/francisco/robotis_ws/src/ros-bioloid-gp/install" TYPE FILE FILES
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/setup.bash"
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/francisco/robotis_ws/src/ros-bioloid-gp/install/setup.sh;/home/francisco/robotis_ws/src/ros-bioloid-gp/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/francisco/robotis_ws/src/ros-bioloid-gp/install" TYPE FILE FILES
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/setup.sh"
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/francisco/robotis_ws/src/ros-bioloid-gp/install/setup.zsh;/home/francisco/robotis_ws/src/ros-bioloid-gp/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/francisco/robotis_ws/src/ros-bioloid-gp/install" TYPE FILE FILES
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/setup.zsh"
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/francisco/robotis_ws/src/ros-bioloid-gp/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/francisco/robotis_ws/src/ros-bioloid-gp/install" TYPE FILE FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/gtest/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench/dynamixel_workbench/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench-msgs/dynamixel_workbench_msgs/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_communication/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_master/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_vrep/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/DynamixelSDK/ros/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench/dynamixel_workbench_toolbox/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench/dynamixel_workbench_single_manager/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench/dynamixel_workbench_single_manager_gui/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench/dynamixel_workbench_controllers/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/dynamixel-workbench/dynamixel_workbench_operators/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sensors/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/u2d2_controller/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloid_gp1/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloid_gp2/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloid_gp3/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloid_gp4/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_moveit/bioloid_moveit_gp4/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloidgp_social_robot/cmake_install.cmake")
  include("/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_hardware/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
