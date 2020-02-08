; Auto-generated. Do not edit!


(cl:in-package bioloid_hardware-srv)


;//! \htmlinclude VrepSetJointTrajectory-request.msg.html

(cl:defclass <VrepSetJointTrajectory-request> (roslisp-msg-protocol:ros-message)
  ((trajectory
    :reader trajectory
    :initarg :trajectory
    :type trajectory_msgs-msg:JointTrajectory
    :initform (cl:make-instance 'trajectory_msgs-msg:JointTrajectory))
   (duration
    :reader duration
    :initarg :duration
    :type cl:float
    :initform 0.0))
)

(cl:defclass VrepSetJointTrajectory-request (<VrepSetJointTrajectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepSetJointTrajectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepSetJointTrajectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepSetJointTrajectory-request> is deprecated: use bioloid_hardware-srv:VrepSetJointTrajectory-request instead.")))

(cl:ensure-generic-function 'trajectory-val :lambda-list '(m))
(cl:defmethod trajectory-val ((m <VrepSetJointTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:trajectory-val is deprecated.  Use bioloid_hardware-srv:trajectory instead.")
  (trajectory m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <VrepSetJointTrajectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:duration-val is deprecated.  Use bioloid_hardware-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepSetJointTrajectory-request>) ostream)
  "Serializes a message object of type '<VrepSetJointTrajectory-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trajectory) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepSetJointTrajectory-request>) istream)
  "Deserializes a message object of type '<VrepSetJointTrajectory-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trajectory) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepSetJointTrajectory-request>)))
  "Returns string type for a service object of type '<VrepSetJointTrajectory-request>"
  "bioloid_hardware/VrepSetJointTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepSetJointTrajectory-request)))
  "Returns string type for a service object of type 'VrepSetJointTrajectory-request"
  "bioloid_hardware/VrepSetJointTrajectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepSetJointTrajectory-request>)))
  "Returns md5sum for a message object of type '<VrepSetJointTrajectory-request>"
  "b9e165befafe1cf891b356b2cd8f6e3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepSetJointTrajectory-request)))
  "Returns md5sum for a message object of type 'VrepSetJointTrajectory-request"
  "b9e165befafe1cf891b356b2cd8f6e3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepSetJointTrajectory-request>)))
  "Returns full string definition for message of type '<VrepSetJointTrajectory-request>"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory trajectory~%float64 duration~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepSetJointTrajectory-request)))
  "Returns full string definition for message of type 'VrepSetJointTrajectory-request"
  (cl:format cl:nil "trajectory_msgs/JointTrajectory trajectory~%float64 duration~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectory~%Header header~%string[] joint_names~%JointTrajectoryPoint[] points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: trajectory_msgs/JointTrajectoryPoint~%# Each trajectory point specifies either positions[, velocities[, accelerations]]~%# or positions[, effort] for the trajectory to be executed.~%# All specified values are in the same order as the joint names in JointTrajectory.msg~%~%float64[] positions~%float64[] velocities~%float64[] accelerations~%float64[] effort~%duration time_from_start~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepSetJointTrajectory-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trajectory))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepSetJointTrajectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepSetJointTrajectory-request
    (cl:cons ':trajectory (trajectory msg))
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude VrepSetJointTrajectory-response.msg.html

(cl:defclass <VrepSetJointTrajectory-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass VrepSetJointTrajectory-response (<VrepSetJointTrajectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepSetJointTrajectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepSetJointTrajectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepSetJointTrajectory-response> is deprecated: use bioloid_hardware-srv:VrepSetJointTrajectory-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <VrepSetJointTrajectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:result-val is deprecated.  Use bioloid_hardware-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VrepSetJointTrajectory-response>)))
    "Constants for message type '<VrepSetJointTrajectory-response>"
  '((:OK . 0)
    (:ERROR . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VrepSetJointTrajectory-response)))
    "Constants for message type 'VrepSetJointTrajectory-response"
  '((:OK . 0)
    (:ERROR . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepSetJointTrajectory-response>) ostream)
  "Serializes a message object of type '<VrepSetJointTrajectory-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepSetJointTrajectory-response>) istream)
  "Deserializes a message object of type '<VrepSetJointTrajectory-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepSetJointTrajectory-response>)))
  "Returns string type for a service object of type '<VrepSetJointTrajectory-response>"
  "bioloid_hardware/VrepSetJointTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepSetJointTrajectory-response)))
  "Returns string type for a service object of type 'VrepSetJointTrajectory-response"
  "bioloid_hardware/VrepSetJointTrajectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepSetJointTrajectory-response>)))
  "Returns md5sum for a message object of type '<VrepSetJointTrajectory-response>"
  "b9e165befafe1cf891b356b2cd8f6e3f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepSetJointTrajectory-response)))
  "Returns md5sum for a message object of type 'VrepSetJointTrajectory-response"
  "b9e165befafe1cf891b356b2cd8f6e3f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepSetJointTrajectory-response>)))
  "Returns full string definition for message of type '<VrepSetJointTrajectory-response>"
  (cl:format cl:nil "int32 result~%int32 OK = 0~%int32 ERROR = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepSetJointTrajectory-response)))
  "Returns full string definition for message of type 'VrepSetJointTrajectory-response"
  (cl:format cl:nil "int32 result~%int32 OK = 0~%int32 ERROR = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepSetJointTrajectory-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepSetJointTrajectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepSetJointTrajectory-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VrepSetJointTrajectory)))
  'VrepSetJointTrajectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VrepSetJointTrajectory)))
  'VrepSetJointTrajectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepSetJointTrajectory)))
  "Returns string type for a service object of type '<VrepSetJointTrajectory>"
  "bioloid_hardware/VrepSetJointTrajectory")