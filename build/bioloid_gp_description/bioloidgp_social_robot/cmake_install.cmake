# Install script for directory: /home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_gp_description/bioloidgp_social_robot

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloidgp_social_robot/catkin_generated/installspace/bioloidgp_social_robot.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bioloidgp_social_robot/cmake" TYPE FILE FILES
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloidgp_social_robot/catkin_generated/installspace/bioloidgp_social_robotConfig.cmake"
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_gp_description/bioloidgp_social_robot/catkin_generated/installspace/bioloidgp_social_robotConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bioloidgp_social_robot" TYPE FILE FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_gp_description/bioloidgp_social_robot/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bioloidgp_social_robot/config" TYPE DIRECTORY FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_gp_description/bioloidgp_social_robot/config/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bioloidgp_social_robot/launch" TYPE DIRECTORY FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_gp_description/bioloidgp_social_robot/launch/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bioloidgp_social_robot/meshes" TYPE DIRECTORY FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_gp_description/bioloidgp_social_robot/meshes/")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/bioloidgp_social_robot/urdf" TYPE DIRECTORY FILES "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_gp_description/bioloidgp_social_robot/urdf/")
endif()

