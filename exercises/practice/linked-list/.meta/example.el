;;; linked-list.el --- Linked List (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'cl-lib)


(cl-defstruct node
  value prev next)


(cl-defstruct dll
  head tail)


(defun dll-create ()
  (make-dll :head nil :tail nil))


(defun dll-push (list value)
  (let ((new-node (make-node :value value :prev (dll-tail list) :next nil)))
    (if (dll-tail list)
        (setf (node-next (dll-tail list)) new-node)
      (setf (dll-head list) new-node))
    (setf (dll-tail list) new-node)))


(defun dll-pop (list)
  (when (dll-tail list)
    (let ((value (node-value (dll-tail list)))
          (new-tail (node-prev (dll-tail list))))
      (if new-tail
          (setf (node-next new-tail) nil)
        (setf (dll-head list) nil))
      (setf (dll-tail list) new-tail)
      value)))


(defun dll-unshift (list value)
  (let ((new-node (make-node :value value :prev nil :next (dll-head list))))
    (if (dll-head list)
        (setf (node-prev (dll-head list)) new-node)
      (setf (dll-tail list) new-node))
    (setf (dll-head list) new-node)))


(defun dll-shift (list)
  (when (dll-head list)
    (let ((value (node-value (dll-head list)))
          (new-head (node-next (dll-head list))))
      (if new-head
          (setf (node-prev new-head) nil)
        (setf (dll-tail list) nil))
      (setf (dll-head list) new-head)
      value)))


(defun dll-count (list)
  (let ((count 0)
        (current (dll-head list)))
    (while current
      (setq count (1+ count))
      (setq current (node-next current)))
    count))


(defun dll-delete (list value)
  (let ((current (dll-head list)))
    (while current
      (if (equal (node-value current) value)
          (progn
            (let ((prev-node (node-prev current))
                  (next-node (node-next current)))
              (if prev-node
                  (setf (node-next prev-node) next-node)
                (setf (dll-head list) next-node))
              (if next-node
                  (setf (node-prev next-node) prev-node)
                (setf (dll-tail list) prev-node)))
            (setq current nil))
        (setq current (node-next current))))))


(provide 'linked-list)
;;; linked-list.el ends here
