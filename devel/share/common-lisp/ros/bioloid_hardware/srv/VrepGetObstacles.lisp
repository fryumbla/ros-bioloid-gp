; Auto-generated. Do not edit!


(cl:in-package bioloid_hardware-srv)


;//! \htmlinclude VrepGetObstacles-request.msg.html

(cl:defclass <VrepGetObstacles-request> (roslisp-msg-protocol:ros-message)
  ((dummy
    :reader dummy
    :initarg :dummy
    :type cl:integer
    :initform 0))
)

(cl:defclass VrepGetObstacles-request (<VrepGetObstacles-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepGetObstacles-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepGetObstacles-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepGetObstacles-request> is deprecated: use bioloid_hardware-srv:VrepGetObstacles-request instead.")))

(cl:ensure-generic-function 'dummy-val :lambda-list '(m))
(cl:defmethod dummy-val ((m <VrepGetObstacles-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:dummy-val is deprecated.  Use bioloid_hardware-srv:dummy instead.")
  (dummy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepGetObstacles-request>) ostream)
  "Serializes a message object of type '<VrepGetObstacles-request>"
  (cl:let* ((signed (cl:slot-value msg 'dummy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepGetObstacles-request>) istream)
  "Deserializes a message object of type '<VrepGetObstacles-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dummy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepGetObstacles-request>)))
  "Returns string type for a service object of type '<VrepGetObstacles-request>"
  "bioloid_hardware/VrepGetObstaclesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepGetObstacles-request)))
  "Returns string type for a service object of type 'VrepGetObstacles-request"
  "bioloid_hardware/VrepGetObstaclesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepGetObstacles-request>)))
  "Returns md5sum for a message object of type '<VrepGetObstacles-request>"
  "426cd5f67aa6396d3bc5bc91413d573b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepGetObstacles-request)))
  "Returns md5sum for a message object of type 'VrepGetObstacles-request"
  "426cd5f67aa6396d3bc5bc91413d573b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepGetObstacles-request>)))
  "Returns full string definition for message of type '<VrepGetObstacles-request>"
  (cl:format cl:nil "int32 dummy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepGetObstacles-request)))
  "Returns full string definition for message of type 'VrepGetObstacles-request"
  (cl:format cl:nil "int32 dummy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepGetObstacles-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepGetObstacles-request>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepGetObstacles-request
    (cl:cons ':dummy (dummy msg))
))
;//! \htmlinclude VrepGetObstacles-response.msg.html

(cl:defclass <VrepGetObstacles-response> (roslisp-msg-protocol:ros-message)
  ((names
    :reader names
    :initarg :names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (obstacles
    :reader obstacles
    :initarg :obstacles
    :type (cl:vector vision_msgs-msg:BoundingBox3D)
   :initform (cl:make-array 0 :element-type 'vision_msgs-msg:BoundingBox3D :initial-element (cl:make-instance 'vision_msgs-msg:BoundingBox3D))))
)

(cl:defclass VrepGetObstacles-response (<VrepGetObstacles-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VrepGetObstacles-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VrepGetObstacles-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bioloid_hardware-srv:<VrepGetObstacles-response> is deprecated: use bioloid_hardware-srv:VrepGetObstacles-response instead.")))

(cl:ensure-generic-function 'names-val :lambda-list '(m))
(cl:defmethod names-val ((m <VrepGetObstacles-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:names-val is deprecated.  Use bioloid_hardware-srv:names instead.")
  (names m))

(cl:ensure-generic-function 'obstacles-val :lambda-list '(m))
(cl:defmethod obstacles-val ((m <VrepGetObstacles-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bioloid_hardware-srv:obstacles-val is deprecated.  Use bioloid_hardware-srv:obstacles instead.")
  (obstacles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VrepGetObstacles-response>) ostream)
  "Serializes a message object of type '<VrepGetObstacles-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VrepGetObstacles-response>) istream)
  "Deserializes a message object of type '<VrepGetObstacles-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vision_msgs-msg:BoundingBox3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VrepGetObstacles-response>)))
  "Returns string type for a service object of type '<VrepGetObstacles-response>"
  "bioloid_hardware/VrepGetObstaclesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepGetObstacles-response)))
  "Returns string type for a service object of type 'VrepGetObstacles-response"
  "bioloid_hardware/VrepGetObstaclesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VrepGetObstacles-response>)))
  "Returns md5sum for a message object of type '<VrepGetObstacles-response>"
  "426cd5f67aa6396d3bc5bc91413d573b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VrepGetObstacles-response)))
  "Returns md5sum for a message object of type 'VrepGetObstacles-response"
  "426cd5f67aa6396d3bc5bc91413d573b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VrepGetObstacles-response>)))
  "Returns full string definition for message of type '<VrepGetObstacles-response>"
  (cl:format cl:nil "string[] names~%vision_msgs/BoundingBox3D[] obstacles~%~%================================================================================~%MSG: vision_msgs/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters, and as such, it may be migrated to~%#   another package, such as geometry_msgs, in the future.~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%#   pose.~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VrepGetObstacles-response)))
  "Returns full string definition for message of type 'VrepGetObstacles-response"
  (cl:format cl:nil "string[] names~%vision_msgs/BoundingBox3D[] obstacles~%~%================================================================================~%MSG: vision_msgs/BoundingBox3D~%# A 3D bounding box that can be positioned and rotated about its center (6 DOF)~%# Dimensions of this box are in meters, and as such, it may be migrated to~%#   another package, such as geometry_msgs, in the future.~%~%# The 3D position and orientation of the bounding box center~%geometry_msgs/Pose center~%~%# The size of the bounding box, in meters, surrounding the object's center~%#   pose.~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VrepGetObstacles-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VrepGetObstacles-response>))
  "Converts a ROS message object to a list"
  (cl:list 'VrepGetObstacles-response
    (cl:cons ':names (names msg))
    (cl:cons ':obstacles (obstacles msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'VrepGetObstacles)))
  'VrepGetObstacles-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'VrepGetObstacles)))
  'VrepGetObstacles-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VrepGetObstacles)))
  "Returns string type for a service object of type '<VrepGetObstacles>"
  "bioloid_hardware/VrepGetObstacles")