;;;;
;;;; cube.lisp
;;;;

(in-package #:clrt-objects)

(defclass cube (object)
  (fll
   flr
   fur
   ful
   bll
   blr
   bur
   bul
   ;;; The following slots will resemble a list consisting of
   ;;; the face's origin, it's up- and right-vector as well as
   ;;; the face's surface normal.
   front
   back
   left
   right
   top
   bottom
   ))

(defmethod initialize-instance :after ((cube cube) &key width height depth)
  (assert (< 0 width)
	  nil
	  ":width must be > 0.")
  (assert (< 0 height)
	  nil
	  ":height must be > 0.")
  (assert (< 0 depth)
	  nil
	  ":depth must be > 0.")
  (let ((cx (vec-x (object-center cube)))
	(cy (vec-y (object-center cube)))
	(cz (vec-z (object-center cube)))
	(w/2 (/ width 2.0))
	(h/2 (/ height 2.0))
	(d/2 (/ depth 2.0)))
    (macrolet ((prep-edge (edge-name opx opy opz)
		 `(setf (slot-value cube ,edge-name)
			(make-vector 3
				     :data (make-array 3
							:element-type 'single-float
							:initial-contents (vector (,opx cx w/2)
										  (,opy cy h/2)
										  (,opz cz d/2)))))))
      (prep-edge 'fll - - -)
      (prep-edge 'flr + - -)
      (prep-edge 'fur + + -)
      (prep-edge 'ful - + -)
      (prep-edge 'bll - - +)
      (prep-edge 'blr + - +)
      (prep-edge 'bur + + +)
      (prep-edge 'bul - + +))))
