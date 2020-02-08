;; Auto-generated. Do not edit!


(when (boundp 'bioloid_hardware::VrepState)
  (if (not (find-package "BIOLOID_HARDWARE"))
    (make-package "BIOLOID_HARDWARE"))
  (shadow 'VrepState (find-package "BIOLOID_HARDWARE")))
(unless (find-package "BIOLOID_HARDWARE::VREPSTATE")
  (make-package "BIOLOID_HARDWARE::VREPSTATE"))

(in-package "ROS")
;;//! \htmlinclude VrepState.msg.html


(intern "*SIM_STOPPED*" (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(shadow '*SIM_STOPPED* (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(defconstant bioloid_hardware::VrepState::*SIM_STOPPED* 0)
(intern "*SIM_RUNNING*" (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(shadow '*SIM_RUNNING* (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(defconstant bioloid_hardware::VrepState::*SIM_RUNNING* 1)
(intern "*READY_FOR_ACTION*" (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(shadow '*READY_FOR_ACTION* (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(defconstant bioloid_hardware::VrepState::*READY_FOR_ACTION* 0)
(intern "*ACTION_RUNNING*" (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(shadow '*ACTION_RUNNING* (find-package "BIOLOID_HARDWARE::VREPSTATE"))
(defconstant bioloid_hardware::VrepState::*ACTION_RUNNING* 1)
(defclass bioloid_hardware::VrepState
  :super ros::object
  :slots (_vrep_state _action_state ))

(defmethod bioloid_hardware::VrepState
  (:init
   (&key
    ((:vrep_state __vrep_state) 0)
    ((:action_state __action_state) 0)
    )
   (send-super :init)
   (setq _vrep_state (round __vrep_state))
   (setq _action_state (round __action_state))
   self)
  (:vrep_state
   (&optional __vrep_state)
   (if __vrep_state (setq _vrep_state __vrep_state)) _vrep_state)
  (:action_state
   (&optional __action_state)
   (if __action_state (setq _action_state __action_state)) _action_state)
  (:serialization-length
   ()
   (+
    ;; int32 _vrep_state
    4
    ;; int32 _action_state
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _vrep_state
       (write-long _vrep_state s)
     ;; int32 _action_state
       (write-long _action_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _vrep_state
     (setq _vrep_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _action_state
     (setq _action_state (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get bioloid_hardware::VrepState :md5sum-) "d63861455531e6f74503f4566b260146")
(setf (get bioloid_hardware::VrepState :datatype-) "bioloid_hardware/VrepState")
(setf (get bioloid_hardware::VrepState :definition-)
      "# vrep start/stop
int32 vrep_state
int32 SIM_STOPPED = 0
int32 SIM_RUNNING = 1

# vrep action state
int32 action_state
int32 READY_FOR_ACTION = 0
int32 ACTION_RUNNING = 1
")



(provide :bioloid_hardware/VrepState "d63861455531e6f74503f4566b260146")


