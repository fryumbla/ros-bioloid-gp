
(cl:in-package :asdf)

(defsystem "bioloid_hardware-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "VrepState" :depends-on ("_package_VrepState"))
    (:file "_package_VrepState" :depends-on ("_package"))
  ))