;; Auto-generated. Do not edit!


(when (boundp 'bioloid_hardware::VrepSetJointTrajectory)
  (if (not (find-package "BIOLOID_HARDWARE"))
    (make-package "BIOLOID_HARDWARE"))
  (shadow 'VrepSetJointTrajectory (find-package "BIOLOID_HARDWARE")))
(unless (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORY")
  (make-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORY"))
(unless (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYREQUEST")
  (make-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYREQUEST"))
(unless (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYRESPONSE")
  (make-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYRESPONSE"))

(in-package "ROS")

(if (not (find-package "TRAJECTORY_MSGS"))
  (ros::roseus-add-msgs "trajectory_msgs"))




(defclass bioloid_hardware::VrepSetJointTrajectoryRequest
  :super ros::object
  :slots (_trajectory _duration ))

(defmethod bioloid_hardware::VrepSetJointTrajectoryRequest
  (:init
   (&key
    ((:trajectory __trajectory) (instance trajectory_msgs::JointTrajectory :init))
    ((:duration __duration) 0.0)
    )
   (send-super :init)
   (setq _trajectory __trajectory)
   (setq _duration (float __duration))
   self)
  (:trajectory
   (&rest __trajectory)
   (if (keywordp (car __trajectory))
       (send* _trajectory __trajectory)
     (progn
       (if __trajectory (setq _trajectory (car __trajectory)))
       _trajectory)))
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; trajectory_msgs/JointTrajectory _trajectory
    (send _trajectory :serialization-length)
    ;; float64 _duration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; trajectory_msgs/JointTrajectory _trajectory
       (send _trajectory :serialize s)
     ;; float64 _duration
       (sys::poke _duration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; trajectory_msgs/JointTrajectory _trajectory
     (send _trajectory :deserialize buf ptr-) (incf ptr- (send _trajectory :serialization-length))
   ;; float64 _duration
     (setq _duration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(intern "*OK*" (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYRESPONSE"))
(shadow '*OK* (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYRESPONSE"))
(defconstant bioloid_hardware::VrepSetJointTrajectoryResponse::*OK* 0)
(intern "*ERROR*" (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYRESPONSE"))
(shadow '*ERROR* (find-package "BIOLOID_HARDWARE::VREPSETJOINTTRAJECTORYRESPONSE"))
(defconstant bioloid_hardware::VrepSetJointTrajectoryResponse::*ERROR* 1)
(defclass bioloid_hardware::VrepSetJointTrajectoryResponse
  :super ros::object
  :slots (_result ))

(defmethod bioloid_hardware::VrepSetJointTrajectoryResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass bioloid_hardware::VrepSetJointTrajectory
  :super ros::object
  :slots ())

(setf (get bioloid_hardware::VrepSetJointTrajectory :md5sum-) "b9e165befafe1cf891b356b2cd8f6e3f")
(setf (get bioloid_hardware::VrepSetJointTrajectory :datatype-) "bioloid_hardware/VrepSetJointTrajectory")
(setf (get bioloid_hardware::VrepSetJointTrajectory :request) bioloid_hardware::VrepSetJointTrajectoryRequest)
(setf (get bioloid_hardware::VrepSetJointTrajectory :response) bioloid_hardware::VrepSetJointTrajectoryResponse)

(defmethod bioloid_hardware::VrepSetJointTrajectoryRequest
  (:response () (instance bioloid_hardware::VrepSetJointTrajectoryResponse :init)))

(setf (get bioloid_hardware::VrepSetJointTrajectoryRequest :md5sum-) "b9e165befafe1cf891b356b2cd8f6e3f")
(setf (get bioloid_hardware::VrepSetJointTrajectoryRequest :datatype-) "bioloid_hardware/VrepSetJointTrajectoryRequest")
(setf (get bioloid_hardware::VrepSetJointTrajectoryRequest :definition-)
      "trajectory_msgs/JointTrajectory trajectory
float64 duration

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
---
int32 result
int32 OK = 0
int32 ERROR = 1
")

(setf (get bioloid_hardware::VrepSetJointTrajectoryResponse :md5sum-) "b9e165befafe1cf891b356b2cd8f6e3f")
(setf (get bioloid_hardware::VrepSetJointTrajectoryResponse :datatype-) "bioloid_hardware/VrepSetJointTrajectoryResponse")
(setf (get bioloid_hardware::VrepSetJointTrajectoryResponse :definition-)
      "trajectory_msgs/JointTrajectory trajectory
float64 duration

================================================================================
MSG: trajectory_msgs/JointTrajectory
Header header
string[] joint_names
JointTrajectoryPoint[] points
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: trajectory_msgs/JointTrajectoryPoint
# Each trajectory point specifies either positions[, velocities[, accelerations]]
# or positions[, effort] for the trajectory to be executed.
# All specified values are in the same order as the joint names in JointTrajectory.msg

float64[] positions
float64[] velocities
float64[] accelerations
float64[] effort
duration time_from_start
---
int32 result
int32 OK = 0
int32 ERROR = 1
")



(provide :bioloid_hardware/VrepSetJointTrajectory "b9e165befafe1cf891b356b2cd8f6e3f")


