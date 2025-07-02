;;; circular-buffer.el --- Circular Buffer (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'eieio)

(define-error 'empty-buffer-error "buffer is empty")

(define-error 'full-buffer-error "buffer is full")

(defclass circular-buffer ()
  ((capacity :initarg :capacity :initform 10)
   (buf-modulus :initform 20)
   (data :initform nil)
   (front :initform 0)
   (back :initform 0))
  :documentation "Circular buffer class")


(cl-defmethod initialize-instance :after ((buf circular-buffer) &rest _)
  (with-slots (capacity buf-modulus data) buf
    (setf buf-modulus (* 2 capacity)
          data (make-vector capacity nil))))

(cl-defmethod buf-empty-p ((buf circular-buffer))
  (with-slots (front back) buf
    (= front back)))

(cl-defmethod buf-full-p ((buf circular-buffer))
  (with-slots (front back buf-modulus capacity) buf
    (= (mod (- back front) buf-modulus) capacity)))

(cl-defmethod next-spot ((buf circular-buffer) s)
  (with-slots (buf-modulus) buf
    (mod (1+ s) buf-modulus)))

(cl-defmethod advance-front ((buf circular-buffer))
  (with-slots (front) buf
    (setf front (next-spot buf front))))

(cl-defmethod advance-back ((buf circular-buffer))
  (with-slots (back) buf
    (setf back (next-spot buf back))))

(cl-defmethod clear ((buf circular-buffer))
  (with-slots (front back) buf
    (setf front back)))

(cl-defmethod read-buff ((buf circular-buffer))
  (with-slots (front data capacity) buf
    (if (buf-empty-p buf)
        (signal 'empty-buffer-error nil)
      (let ((v (aref data (mod front capacity))))
        (advance-front buf)
        v))))

(cl-defmethod write ((buf circular-buffer) v)
  (with-slots (back data capacity) buf
    (if (buf-full-p buf)
        (signal 'full-buffer-error nil)
      (progn
        (aset data (mod back capacity) v)
        (advance-back buf)))))

(cl-defmethod overwrite ((buf circular-buffer) v)
  (with-slots (front) buf
    (when (buf-full-p buf)
      (advance-front buf))
    (write buf v)))

(provide 'circular-buffer)
;;; circular-buffer.el ends here

