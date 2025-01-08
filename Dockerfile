FROM ros:jazzy-ros-core
ENV ROS_DISTRO=jazzy

RUN apt-get update -y && apt-get install -y \
    ros-${ROS_DISTRO}-mavros \
    ros-${ROS_DISTRO}-mavros-extras \
    ros-${ROS_DISTRO}-mavros-msgs \
    ros-${ROS_DISTRO}-rmw-cyclonedds-cpp \
    python3-colcon-common-extensions \
    python3-pip \
    build-essential \
    make

RUN apt-get clean

RUN wget https://raw.githubusercontent.com/mavlink/mavros/ros2/mavros/scripts/install_geographiclib_datasets.sh
RUN bash ./install_geographiclib_datasets.sh

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

RUN /bin/bash -c "echo \"source /opt/ros/${ROS_DISTRO}/setup.bash\" >> ~/.bashrc"


