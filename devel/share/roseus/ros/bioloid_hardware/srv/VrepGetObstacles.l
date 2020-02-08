;; Auto-generated. Do not edit!


(when (boundp 'bioloid_hardware::VrepGetObstacles)
  (if (not (find-package "BIOLOID_HARDWARE"))
    (make-package "BIOLOID_HARDWARE"))
  (shadow 'VrepGetObstacles (find-package "BIOLOID_HARDWARE")))
(unless (find-package "BIOLOID_HARDWARE::VREPGETOBSTACLES")
  (make-package "BIOLOID_HARDWARE::VREPGETOBSTACLES"))
(unless (find-package "BIOLOID_HARDWARE::VREPGETOBSTACLESREQUEST")
  (make-package "BIOLOID_HARDWARE::VREPGETOBSTACLESREQUEST"))
(unless (find-package "BIOLOID_HARDWARE::VREPGETOBSTACLESRESPONSE")
  (make-package "BIOLOID_HARDWARE::VREPGETOBSTACLESRESPONSE"))

(in-package "ROS")



(if (not (find-package "VISION_MSGS"))
  (ros::roseus-add-msgs "vision_msgs"))


(defclass bioloid_hardware::VrepGetObstaclesRequest
  :super ros::object
  :slots (_dummy ))

(defmethod bioloid_hardware::VrepGetObstaclesRequest
  (:init
   (&key
    ((:dummy __dummy) 0)
    )
   (send-super :init)
   (setq _dummy (round __dummy))
   self)
  (:dummy
   (&optional __dummy)
   (if __dummy (setq _dummy __dummy)) _dummy)
  (:serialization-length
   ()
   (+
    ;; int32 _dummy
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _dummy
       (write-long _dummy s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _dummy
     (setq _dummy (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass bioloid_hardware::VrepGetObstaclesResponse
  :super ros::object
  :slots (_names _obstacles ))

(defmethod bioloid_hardware::VrepGetObstaclesResponse
  (:init
   (&key
    ((:names __names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:obstacles __obstacles) (let (r) (dotimes (i 0) (push (instance vision_msgs::BoundingBox3D :init) r)) r))
    )
   (send-super :init)
   (setq _names __names)
   (setq _obstacles __obstacles)
   self)
  (:names
   (&optional __names)
   (if __names (setq _names __names)) _names)
  (:obstacles
   (&rest __obstacles)
   (if (keywordp (car __obstacles))
       (send* _obstacles __obstacles)
     (progn
       (if __obstacles (setq _obstacles (car __obstacles)))
       _obstacles)))
  (:serialization-length
   ()
   (+
    ;; string[] _names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _names)) 4
    ;; vision_msgs/BoundingBox3D[] _obstacles
    (apply #'+ (send-all _obstacles :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _names
     (write-long (length _names) s)
     (dolist (elem _names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; vision_msgs/BoundingBox3D[] _obstacles
     (write-long (length _obstacles) s)
     (dolist (elem _obstacles)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; vision_msgs/BoundingBox3D[] _obstacles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles (let (r) (dotimes (i n) (push (instance vision_msgs::BoundingBox3D :init) r)) r))
     (dolist (elem- _obstacles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass bioloid_hardware::VrepGetObstacles
  :super ros::object
  :slots ())

(setf (get bioloid_hardware::VrepGetObstacles :md5sum-) "426cd5f67aa6396d3bc5bc91413d573b")
(setf (get bioloid_hardware::VrepGetObstacles :datatype-) "bioloid_hardware/VrepGetObstacles")
(setf (get bioloid_hardware::VrepGetObstacles :request) bioloid_hardware::VrepGetObstaclesRequest)
(setf (get bioloid_hardware::VrepGetObstacles :response) bioloid_hardware::VrepGetObstaclesResponse)

(defmethod bioloid_hardware::VrepGetObstaclesRequest
  (:response () (instance bioloid_hardware::VrepGetObstaclesResponse :init)))

(setf (get bioloid_hardware::VrepGetObstaclesRequest :md5sum-) "426cd5f67aa6396d3bc5bc91413d573b")
(setf (get bioloid_hardware::VrepGetObstaclesRequest :datatype-) "bioloid_hardware/VrepGetObstaclesRequest")
(setf (get bioloid_hardware::VrepGetObstaclesRequest :definition-)
      "int32 dummy
---
string[] names
vision_msgs/BoundingBox3D[] obstacles

================================================================================
MSG: vision_msgs/BoundingBox3D
# A 3D bounding box that can be positioned and rotated about its center (6 DOF)
# Dimensions of this box are in meters, and as such, it may be migrated to
#   another package, such as geometry_msgs, in the future.

# The 3D position and orientation of the bounding box center
geometry_msgs/Pose center

# The size of the bounding box, in meters, surrounding the object's center
#   pose.
geometry_msgs/Vector3 size

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get bioloid_hardware::VrepGetObstaclesResponse :md5sum-) "426cd5f67aa6396d3bc5bc91413d573b")
(setf (get bioloid_hardware::VrepGetObstaclesResponse :datatype-) "bioloid_hardware/VrepGetObstaclesResponse")
(setf (get bioloid_hardware::VrepGetObstaclesResponse :definition-)
      "int32 dummy
---
string[] names
vision_msgs/BoundingBox3D[] obstacles

================================================================================
MSG: vision_msgs/BoundingBox3D
# A 3D bounding box that can be positioned and rotated about its center (6 DOF)
# Dimensions of this box are in meters, and as such, it may be migrated to
#   another package, such as geometry_msgs, in the future.

# The 3D position and orientation of the bounding box center
geometry_msgs/Pose center

# The size of the bounding box, in meters, surrounding the object's center
#   pose.
geometry_msgs/Vector3 size

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :bioloid_hardware/VrepGetObstacles "426cd5f67aa6396d3bc5bc91413d573b")


