# Source to reset ROS environment variables.
export ROS_MASTER_URI=http://localhost:11311
unset ROS_IP
unset ROS_HOSTNAME

echo ROS_MASTER_URI=$ROS_MASTER_URI
echo Unset ROS_IP and ROS_HOSTNAME
