;;;;
;;;; simple-scene.lisp
;;;;

(defpackage #:simple-scene
  (:use :cl :linalg)
  (:export #:render))

(in-package #:simple-scene)

(defparameter *cam* (make-instance 'clrt-camera:camera
				   :pos (make-vector 3 :data #(0.0 0.0 0.0))
				   :up (make-vector 3 :data #(0.0 1.0 0.0))
				   :look-at (make-vector 3 :data #(0.0 0.0 100.0))))

(defparameter *scene* (make-instance 'clrt-scene:scene
				     :camera *cam*))

(defparameter *cube* (make-instance 'clrt-objects:cube
				    :center (make-vector 3 :data #(0.0 0.0 100.0))
				    :width 40.0
				    :height 40.0
				    :depth 40.0))

(clrt-scene:add-object *scene* *cube*)


(defun render ()
  (clrt-scene:render *scene* 640 480 "test.png"))

