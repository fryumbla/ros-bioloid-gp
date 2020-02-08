;; Auto-generated. Do not edit!


(when (boundp 'bioloid_hardware::VrepGetSimState)
  (if (not (find-package "BIOLOID_HARDWARE"))
    (make-package "BIOLOID_HARDWARE"))
  (shadow 'VrepGetSimState (find-package "BIOLOID_HARDWARE")))
(unless (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATE")
  (make-package "BIOLOID_HARDWARE::VREPGETSIMSTATE"))
(unless (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATEREQUEST")
  (make-package "BIOLOID_HARDWARE::VREPGETSIMSTATEREQUEST"))
(unless (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATERESPONSE")
  (make-package "BIOLOID_HARDWARE::VREPGETSIMSTATERESPONSE"))

(in-package "ROS")





(defclass bioloid_hardware::VrepGetSimStateRequest
  :super ros::object
  :slots (_dummy ))

(defmethod bioloid_hardware::VrepGetSimStateRequest
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

(intern "*READY_STATE*" (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATERESPONSE"))
(shadow '*READY_STATE* (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATERESPONSE"))
(defconstant bioloid_hardware::VrepGetSimStateResponse::*READY_STATE* 0)
(intern "*RUNNING_STATE*" (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATERESPONSE"))
(shadow '*RUNNING_STATE* (find-package "BIOLOID_HARDWARE::VREPGETSIMSTATERESPONSE"))
(defconstant bioloid_hardware::VrepGetSimStateResponse::*RUNNING_STATE* 1)
(defclass bioloid_hardware::VrepGetSimStateResponse
  :super ros::object
  :slots (_state ))

(defmethod bioloid_hardware::VrepGetSimStateResponse
  (:init
   (&key
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _state (round __state))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; int32 _state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _state
       (write-long _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _state
     (setq _state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass bioloid_hardware::VrepGetSimState
  :super ros::object
  :slots ())

(setf (get bioloid_hardware::VrepGetSimState :md5sum-) "090b1ecdfa88ad0b24f5bc475c9bd86c")
(setf (get bioloid_hardware::VrepGetSimState :datatype-) "bioloid_hardware/VrepGetSimState")
(setf (get bioloid_hardware::VrepGetSimState :request) bioloid_hardware::VrepGetSimStateRequest)
(setf (get bioloid_hardware::VrepGetSimState :response) bioloid_hardware::VrepGetSimStateResponse)

(defmethod bioloid_hardware::VrepGetSimStateRequest
  (:response () (instance bioloid_hardware::VrepGetSimStateResponse :init)))

(setf (get bioloid_hardware::VrepGetSimStateRequest :md5sum-) "090b1ecdfa88ad0b24f5bc475c9bd86c")
(setf (get bioloid_hardware::VrepGetSimStateRequest :datatype-) "bioloid_hardware/VrepGetSimStateRequest")
(setf (get bioloid_hardware::VrepGetSimStateRequest :definition-)
      "int32 dummy
---
int32 state
int32 READY_STATE = 0
int32 RUNNING_STATE = 1
")

(setf (get bioloid_hardware::VrepGetSimStateResponse :md5sum-) "090b1ecdfa88ad0b24f5bc475c9bd86c")
(setf (get bioloid_hardware::VrepGetSimStateResponse :datatype-) "bioloid_hardware/VrepGetSimStateResponse")
(setf (get bioloid_hardware::VrepGetSimStateResponse :definition-)
      "int32 dummy
---
int32 state
int32 READY_STATE = 0
int32 RUNNING_STATE = 1
")



(provide :bioloid_hardware/VrepGetSimState "090b1ecdfa88ad0b24f5bc475c9bd86c")


