#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_sdk/DynamixelSDK/ros"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/francisco/robotis_ws/src/ros-bioloid-gp/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/francisco/robotis_ws/src/ros-bioloid-gp/install/lib/python2.7/dist-packages:/home/francisco/robotis_ws/src/ros-bioloid-gp/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/francisco/robotis_ws/src/ros-bioloid-gp/build" \
    "/usr/bin/python2" \
    "/home/francisco/robotis_ws/src/ros-bioloid-gp/src/bioloid_sdk/DynamixelSDK/ros/setup.py" \
    build --build-base "/home/francisco/robotis_ws/src/ros-bioloid-gp/build/bioloid_sdk/DynamixelSDK/ros" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/francisco/robotis_ws/src/ros-bioloid-gp/install" --install-scripts="/home/francisco/robotis_ws/src/ros-bioloid-gp/install/bin"
