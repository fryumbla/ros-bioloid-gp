
(cl:in-package :asdf)

(defsystem "bioloid_hardware-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :trajectory_msgs-msg
               :vision_msgs-msg
)
  :components ((:file "_package")
    (:file "VrepGetObstacles" :depends-on ("_package_VrepGetObstacles"))
    (:file "_package_VrepGetObstacles" :depends-on ("_package"))
    (:file "VrepGetSimState" :depends-on ("_package_VrepGetSimState"))
    (:file "_package_VrepGetSimState" :depends-on ("_package"))
    (:file "VrepSetJointTrajectory" :depends-on ("_package_VrepSetJointTrajectory"))
    (:file "_package_VrepSetJointTrajectory" :depends-on ("_package"))
    (:file "VrepSetSimState" :depends-on ("_package_VrepSetSimState"))
    (:file "_package_VrepSetSimState" :depends-on ("_package"))
  ))