; Auto-generated. Do not edit!


(cl:in-package bioloid_hardware-msg)


;//! \htmlinclude VrepState.msg.html

(cl:defclass <VrepState> (roslisp-msg-protocol:ros-message)
  ((vrep_state
    :reader vrep_state
    :initarg :vrep_state
    :type cl:integer
    :initform 0)
   (action_state
    :reader action_state
    :initarg :action_state
    :type cl:integer
    :initform 0))
)

(cl:defclass VrepState (<VrepState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-msg:<VrepState> is deprecated: use bioloid_hardware-msg:VrepState instead.")))

(cl:ensure-generic-function 'vrep_state-val :lambda-list '(m))
(cl:defmethod vrep_state-val ((m <VrepState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-msg:vrep_state-val is deprecated.  Use bioloid_hardware-msg:vrep_state instead.")
  (vrep_state m))

(cl:ensure-generic-function 'action_state-val :lambda-list '(m))
(cl:defmethod action_state-val ((m <VrepState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-msg:action_state-val is deprecated.  Use bioloid_hardware-msg:action_state instead.")
  (action_state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VrepState>)))
    "Constants for message type '<VrepState>"
  '((:SIM_STOPPED . 0)
    (:SIM_RUNNING . 1)
    (:READY_FOR_ACTION . 0)
    (:ACTION_RUNNING . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VrepState)))
    "Constants for message type 'VrepState"
  '((:SIM_STOPPED . 0)
    (:SIM_RUNNING . 1)
    (:READY_FOR_ACTION . 0)
    (:ACTION_RUNNING . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepState>) ostream)
  "Serializes a message object of type '<VrepState>"
  (cl:let* ((signed (cl:slot-value msg 'vrep_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'action_state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepState>) istream)
  "Deserializes a message object of type '<VrepState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vrep_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action_state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepState>)))
  "Returns string type for a message object of type '<VrepState>"
  "bioloid_hardware/VrepState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepState)))
  "Returns string type for a message object of type 'VrepState"
  "bioloid_hardware/VrepState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepState>)))
  "Returns md5sum for a message object of type '<VrepState>"
  "d63861455531e6f74503f4566b260146")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepState)))
  "Returns md5sum for a message object of type 'VrepState"
  "d63861455531e6f74503f4566b260146")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepState>)))
  "Returns full string definition for message of type '<VrepState>"
  (cl:format cl:nil "# vrep start/stop~%int32 vrep_state~%int32 SIM_STOPPED = 0~%int32 SIM_RUNNING = 1~%~%# vrep action state~%int32 action_state~%int32 READY_FOR_ACTION = 0~%int32 ACTION_RUNNING = 1~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepState)))
  "Returns full string definition for message of type 'VrepState"
  (cl:format cl:nil "# vrep start/stop~%int32 vrep_state~%int32 SIM_STOPPED = 0~%int32 SIM_RUNNING = 1~%~%# vrep action state~%int32 action_state~%int32 READY_FOR_ACTION = 0~%int32 ACTION_RUNNING = 1~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepState>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepState>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepState
    (cl:cons ':vrep_state (vrep_state msg))
    (cl:cons ':action_state (action_state msg))
))
