;; Auto-generated. Do not edit!


(when (boundp 'bioloid_hardware::VrepSetSimState)
  (if (not (find-package "BIOLOID_HARDWARE"))
    (make-package "BIOLOID_HARDWARE"))
  (shadow 'VrepSetSimState (find-package "BIOLOID_HARDWARE")))
(unless (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATE")
  (make-package "BIOLOID_HARDWARE::VREPSETSIMSTATE"))
(unless (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATEREQUEST")
  (make-package "BIOLOID_HARDWARE::VREPSETSIMSTATEREQUEST"))
(unless (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATERESPONSE")
  (make-package "BIOLOID_HARDWARE::VREPSETSIMSTATERESPONSE"))

(in-package "ROS")





(intern "*SIM_START*" (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATEREQUEST"))
(shadow '*SIM_START* (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATEREQUEST"))
(defconstant bioloid_hardware::VrepSetSimStateRequest::*SIM_START* 0)
(intern "*SIM_STOP*" (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATEREQUEST"))
(shadow '*SIM_STOP* (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATEREQUEST"))
(defconstant bioloid_hardware::VrepSetSimStateRequest::*SIM_STOP* 1)
(defclass bioloid_hardware::VrepSetSimStateRequest
  :super ros::object
  :slots (_operation ))

(defmethod bioloid_hardware::VrepSetSimStateRequest
  (:init
   (&key
    ((:operation __operation) 0)
    )
   (send-super :init)
   (setq _operation (round __operation))
   self)
  (:operation
   (&optional __operation)
   (if __operation (setq _operation __operation)) _operation)
  (:serialization-length
   ()
   (+
    ;; int32 _operation
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _operation
       (write-long _operation s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _operation
     (setq _operation (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(intern "*OK*" (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATERESPONSE"))
(shadow '*OK* (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATERESPONSE"))
(defconstant bioloid_hardware::VrepSetSimStateResponse::*OK* 0)
(intern "*ERROR*" (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATERESPONSE"))
(shadow '*ERROR* (find-package "BIOLOID_HARDWARE::VREPSETSIMSTATERESPONSE"))
(defconstant bioloid_hardware::VrepSetSimStateResponse::*ERROR* 1)
(defclass bioloid_hardware::VrepSetSimStateResponse
  :super ros::object
  :slots (_result _err_msg ))

(defmethod bioloid_hardware::VrepSetSimStateResponse
  (:init
   (&key
    ((:result __result) 0)
    ((:err_msg __err_msg) "")
    )
   (send-super :init)
   (setq _result (round __result))
   (setq _err_msg (string __err_msg))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:err_msg
   (&optional __err_msg)
   (if __err_msg (setq _err_msg __err_msg)) _err_msg)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ;; string _err_msg
    4 (length _err_msg)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;; string _err_msg
       (write-long (length _err_msg) s) (princ _err_msg s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _err_msg
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _err_msg (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass bioloid_hardware::VrepSetSimState
  :super ros::object
  :slots ())

(setf (get bioloid_hardware::VrepSetSimState :md5sum-) "058b8c1320f490e738017374cc564f52")
(setf (get bioloid_hardware::VrepSetSimState :datatype-) "bioloid_hardware/VrepSetSimState")
(setf (get bioloid_hardware::VrepSetSimState :request) bioloid_hardware::VrepSetSimStateRequest)
(setf (get bioloid_hardware::VrepSetSimState :response) bioloid_hardware::VrepSetSimStateResponse)

(defmethod bioloid_hardware::VrepSetSimStateRequest
  (:response () (instance bioloid_hardware::VrepSetSimStateResponse :init)))

(setf (get bioloid_hardware::VrepSetSimStateRequest :md5sum-) "058b8c1320f490e738017374cc564f52")
(setf (get bioloid_hardware::VrepSetSimStateRequest :datatype-) "bioloid_hardware/VrepSetSimStateRequest")
(setf (get bioloid_hardware::VrepSetSimStateRequest :definition-)
      "int32 operation
int32 SIM_START = 0
int32 SIM_STOP = 1
---
int32 result
int32 OK = 0
int32 ERROR = 1
string err_msg
")

(setf (get bioloid_hardware::VrepSetSimStateResponse :md5sum-) "058b8c1320f490e738017374cc564f52")
(setf (get bioloid_hardware::VrepSetSimStateResponse :datatype-) "bioloid_hardware/VrepSetSimStateResponse")
(setf (get bioloid_hardware::VrepSetSimStateResponse :definition-)
      "int32 operation
int32 SIM_START = 0
int32 SIM_STOP = 1
---
int32 result
int32 OK = 0
int32 ERROR = 1
string err_msg
")



(provide :bioloid_hardware/VrepSetSimState "058b8c1320f490e738017374cc564f52")


