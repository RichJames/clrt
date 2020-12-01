;;;;
;;;; simple-scene.lisp
;;;;

(defpackage #:simple-scene
  (:use :cl :linalg)
  (:export #:render))

(in-package #:simple-scene)

(defparameter *cam* (make-instance 'clrt-camera:camera
				   :pos (make-vector 3 :data #(50.0 50.0 0.0))
				   :up (make-vector 3 :data #(0.0 1.0 0.0))
				   :look-at (make-vector 3 :data #(0.0 0.0 100.0))))

(defparameter *scene* (make-instance 'clrt-scene:scene
				     :camera *cam*))

(defparameter *blue-material* (make-instance 'clrt-material:material
					     :ambient-color (make-vector 3 :data #(0.0 0.0 0.2))
					     :ambient-coeff 0.1
					     :diffuse-color (make-vector 3 :data #(0.0 0.0 0.8))
					     :diffuse-coeff 0.6
					     :specular-color (make-vector 3 :data #(1.0 1.0 1.0))
					     :specular-coeff 0.3
					     :roughness 50))

(defparameter *other-material* (make-instance 'clrt-material:material
					     :ambient-color (make-vector 3 :data #(0.3 0.0 0.0))
					     :ambient-coeff 0.1
					     :diffuse-color (make-vector 3 :data #(0.7 0.0 0.0))
					     :diffuse-coeff 0.5
					     :specular-color (make-vector 3 :data #(1.0 1.0 1.0))
					     :specular-coeff 0.4
					     :roughness 25))

(defparameter *cube* (make-instance 'clrt-objects:cube
				    :center (make-vector 3 :data #(0.0 30.0 100.0))
				    :width 40.0
				    :height 40.0
				    :depth 40.0
				    :material *other-material*))


(defparameter *sphere* (make-instance 'clrt-objects:sphere
				      :center (make-vector 3 :data #(0.0 0.0 100.0))
				      :radius 40.0
				      :material *blue-material*))

(clrt-scene:add-object *scene* *cube*)
#+ (or)
(clrt-scene:add-object *scene* *sphere*)

(defparameter *light1* (make-instance 'clrt-lights:light
				     :pos (make-vector 3 :data #(-100.0 100.0 0.0))))

(defparameter *light2* (make-instance 'clrt-lights:light
				     :pos (make-vector 3 :data #(75.0 75.0 0.0))))

(clrt-scene:add-light *scene* *light1*)
(clrt-scene:add-light *scene* *light2*)


(defun render ()
  (clrt-scene:render *scene* 640 480 "test.png"))

