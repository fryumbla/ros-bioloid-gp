; Auto-generated. Do not edit!


(cl:in-package bioloid_hardware-srv)


;//! \htmlinclude VrepSetSimState-request.msg.html

(cl:defclass <VrepSetSimState-request> (roslisp-msg-protocol:ros-message)
  ((operation
    :reader operation
    :initarg :operation
    :type cl:integer
    :initform 0))
)

(cl:defclass VrepSetSimState-request (<VrepSetSimState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepSetSimState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepSetSimState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepSetSimState-request> is deprecated: use bioloid_hardware-srv:VrepSetSimState-request instead.")))

(cl:ensure-generic-function 'operation-val :lambda-list '(m))
(cl:defmethod operation-val ((m <VrepSetSimState-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:operation-val is deprecated.  Use bioloid_hardware-srv:operation instead.")
  (operation m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VrepSetSimState-request>)))
    "Constants for message type '<VrepSetSimState-request>"
  '((:SIM_START . 0)
    (:SIM_STOP . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VrepSetSimState-request)))
    "Constants for message type 'VrepSetSimState-request"
  '((:SIM_START . 0)
    (:SIM_STOP . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepSetSimState-request>) ostream)
  "Serializes a message object of type '<VrepSetSimState-request>"
  (cl:let* ((signed (cl:slot-value msg 'operation)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepSetSimState-request>) istream)
  "Deserializes a message object of type '<VrepSetSimState-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'operation) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepSetSimState-request>)))
  "Returns string type for a service object of type '<VrepSetSimState-request>"
  "bioloid_hardware/VrepSetSimStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepSetSimState-request)))
  "Returns string type for a service object of type 'VrepSetSimState-request"
  "bioloid_hardware/VrepSetSimStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepSetSimState-request>)))
  "Returns md5sum for a message object of type '<VrepSetSimState-request>"
  "058b8c1320f490e738017374cc564f52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepSetSimState-request)))
  "Returns md5sum for a message object of type 'VrepSetSimState-request"
  "058b8c1320f490e738017374cc564f52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepSetSimState-request>)))
  "Returns full string definition for message of type '<VrepSetSimState-request>"
  (cl:format cl:nil "int32 operation~%int32 SIM_START = 0~%int32 SIM_STOP = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepSetSimState-request)))
  "Returns full string definition for message of type 'VrepSetSimState-request"
  (cl:format cl:nil "int32 operation~%int32 SIM_START = 0~%int32 SIM_STOP = 1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepSetSimState-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepSetSimState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepSetSimState-request
    (cl:cons ':operation (operation msg))
))
;//! \htmlinclude VrepSetSimState-response.msg.html

(cl:defclass <VrepSetSimState-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0)
   (err_msg
    :reader err_msg
    :initarg :err_msg
    :type cl:string
    :initform ""))
)

(cl:defclass VrepSetSimState-response (<VrepSetSimState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepSetSimState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepSetSimState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepSetSimState-response> is deprecated: use bioloid_hardware-srv:VrepSetSimState-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <VrepSetSimState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:result-val is deprecated.  Use bioloid_hardware-srv:result instead.")
  (result m))

(cl:ensure-generic-function 'err_msg-val :lambda-list '(m))
(cl:defmethod err_msg-val ((m <VrepSetSimState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:err_msg-val is deprecated.  Use bioloid_hardware-srv:err_msg instead.")
  (err_msg m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<VrepSetSimState-response>)))
    "Constants for message type '<VrepSetSimState-response>"
  '((:OK . 0)
    (:ERROR . 1))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'VrepSetSimState-response)))
    "Constants for message type 'VrepSetSimState-response"
  '((:OK . 0)
    (:ERROR . 1))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepSetSimState-response>) ostream)
  "Serializes a message object of type '<VrepSetSimState-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'err_msg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'err_msg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepSetSimState-response>) istream)
  "Deserializes a message object of type '<VrepSetSimState-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_msg) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'err_msg) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepSetSimState-response>)))
  "Returns string type for a service object of type '<VrepSetSimState-response>"
  "bioloid_hardware/VrepSetSimStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepSetSimState-response)))
  "Returns string type for a service object of type 'VrepSetSimState-response"
  "bioloid_hardware/VrepSetSimStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepSetSimState-response>)))
  "Returns md5sum for a message object of type '<VrepSetSimState-response>"
  "058b8c1320f490e738017374cc564f52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepSetSimState-response)))
  "Returns md5sum for a message object of type 'VrepSetSimState-response"
  "058b8c1320f490e738017374cc564f52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepSetSimState-response>)))
  "Returns full string definition for message of type '<VrepSetSimState-response>"
  (cl:format cl:nil "int32 result~%int32 OK = 0~%int32 ERROR = 1~%string err_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepSetSimState-response)))
  "Returns full string definition for message of type 'VrepSetSimState-response"
  (cl:format cl:nil "int32 result~%int32 OK = 0~%int32 ERROR = 1~%string err_msg~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepSetSimState-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'err_msg))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepSetSimState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepSetSimState-response
    (cl:cons ':result (result msg))
    (cl:cons ':err_msg (err_msg msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VrepSetSimState)))
  'VrepSetSimState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VrepSetSimState)))
  'VrepSetSimState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepSetSimState)))
  "Returns string type for a service object of type '<VrepSetSimState>"
  "bioloid_hardware/VrepSetSimState")