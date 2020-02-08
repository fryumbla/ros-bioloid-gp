; Auto-generated. Do not edit!


(cl:in-package bioloid_hardware-srv)


;//! \htmlinclude VrepGetSimState-request.msg.html

(cl:defclass <VrepGetSimState-request> (roslisp-msg-protocol:ros-message)
  ((dummy
    :reader dummy
    :initarg :dummy
    :type cl:integer
    :initform 0))
)

(cl:defclass VrepGetSimState-request (<VrepGetSimState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepGetSimState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepGetSimState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepGetSimState-request> is deprecated: use bioloid_hardware-srv:VrepGetSimState-request instead.")))

(cl:ensure-generic-function 'dummy-val :lambda-list '(m))
(cl:defmethod dummy-val ((m <VrepGetSimState-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:dummy-val is deprecated.  Use bioloid_hardware-srv:dummy instead.")
  (dummy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepGetSimState-request>) ostream)
  "Serializes a message object of type '<VrepGetSimState-request>"
  (cl:let* ((signed (cl:slot-value msg 'dummy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepGetSimState-request>) istream)
  "Deserializes a message object of type '<VrepGetSimState-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dummy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepGetSimState-request>)))
  "Returns string type for a service object of type '<VrepGetSimState-request>"
  "bioloid_hardware/VrepGetSimStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepGetSimState-request)))
  "Returns string type for a service object of type 'VrepGetSimState-request"
  "bioloid_hardware/VrepGetSimStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepGetSimState-request>)))
  "Returns md5sum for a message object of type '<VrepGetSimState-request>"
  "090b1ecdfa88ad0b24f5bc475c9bd86c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepGetSimState-request)))
  "Returns md5sum for a message object of type 'VrepGetSimState-request"
  "090b1ecdfa88ad0b24f5bc475c9bd86c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepGetSimState-request>)))
  "Returns full string definition for message of type '<VrepGetSimState-request>"
  (cl:format cl:nil "int32 dummy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepGetSimState-request)))
  "Returns full string definition for message of type 'VrepGetSimState-request"
  (cl:format cl:nil "int32 dummy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepGetSimState-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepGetSimState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepGetSimState-request
    (cl:cons ':dummy (dummy msg))
))
;//! \htmlinclude VrepGetSimState-response.msg.html

(cl:defclass <VrepGetSimState-response> (roslisp-msg-protocol:ros-message)
  ((state
    :reader state
    :initarg :state
    :type cl:integer
    :initform 0))
)

(cl:defclass VrepGetSimState-response (<VrepGetSimState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepGetSimState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepGetSimState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepGetSimState-response> is deprecated: use bioloid_hardware-srv:VrepGetSimState-response instead.")))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <VrepGetSimState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:state-val is deprecated.  Use bioloid_hardware-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VrepGetSimState-response>)))
    "Constants for message type '<VrepGetSimState-response>"
  '((:READY_STATE . 0)
    (:RUNNING_STATE . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VrepGetSimState-response)))
    "Constants for message type 'VrepGetSimState-response"
  '((:READY_STATE . 0)
    (:RUNNING_STATE . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepGetSimState-response>) ostream)
  "Serializes a message object of type '<VrepGetSimState-response>"
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepGetSimState-response>) istream)
  "Deserializes a message object of type '<VrepGetSimState-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepGetSimState-response>)))
  "Returns string type for a service object of type '<VrepGetSimState-response>"
  "bioloid_hardware/VrepGetSimStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepGetSimState-response)))
  "Returns string type for a service object of type 'VrepGetSimState-response"
  "bioloid_hardware/VrepGetSimStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepGetSimState-response>)))
  "Returns md5sum for a message object of type '<VrepGetSimState-response>"
  "090b1ecdfa88ad0b24f5bc475c9bd86c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepGetSimState-response)))
  "Returns md5sum for a message object of type 'VrepGetSimState-response"
  "090b1ecdfa88ad0b24f5bc475c9bd86c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepGetSimState-response>)))
  "Returns full string definition for message of type '<VrepGetSimState-response>"
  (cl:format cl:nil "int32 state~%int32 READY_STATE = 0~%int32 RUNNING_STATE = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepGetSimState-response)))
  "Returns full string definition for message of type 'VrepGetSimState-response"
  (cl:format cl:nil "int32 state~%int32 READY_STATE = 0~%int32 RUNNING_STATE = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepGetSimState-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepGetSimState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepGetSimState-response
    (cl:cons ':state (state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VrepGetSimState)))
  'VrepGetSimState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VrepGetSimState)))
  'VrepGetSimState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepGetSimState)))
  "Returns string type for a service object of type '<VrepGetSimState>"
  "bioloid_hardware/VrepGetSimState")