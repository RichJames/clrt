;;;; clrt.asd

(asdf:defsystem #:clrt
  :description "clrt - A simple common lisp raytracer"
  :author "Rich James <richjamespub1@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (#:zpng)
  :components ((:file "package")
               (:file "linalg")
	       (:file "camera" :depends-on ("linalg"))
	       (:file "ray" :depends-on ("linalg"))
	       (:file "lights" :depends-on ("linalg"))
	       (:file "objects" :depends-on ("linalg" "camera" "ray"))
	       (:file "scene" :depends-on ("linalg" "camera" "objects" "lights"))
	       (:file "sphere" :depends-on ("linalg" "objects"))
	       (:file "cube" :depends-on ("linalg" "objects"))))
