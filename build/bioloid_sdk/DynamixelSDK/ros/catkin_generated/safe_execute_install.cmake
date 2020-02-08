execute_process(COMMAND "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/DynamixelSDK/ros/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/DynamixelSDK/ros/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
