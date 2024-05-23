;;; robot-simulator.el --- robot-simulator Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defconst directions [north east south west])


(defconst steps '((north  . (0 1))
                  (east   . (1 0))
                  (south  . (0 -1))
                  (west   . (-1 0))))


(defun create-robot (x y direction)
  (record 'robot x y direction))


(defun move (robot instructions)
  (let ((state robot))
    (seq-doseq (instruction instructions)
      (cond ((equal ?L instruction)
             (rotate state -1))
            ((equal ?R instruction)
             (rotate state 1))
            ((equal ?A instruction)
             (advance state))))
    state))


(defun rotate (robot offset)
  (let* ((old-index (cl-position (aref robot 3) directions))
         (new-index (mod (+ old-index offset) 4)))
    (aset robot 3 (aref directions new-index))))


(defun advance (robot)
  (let* ((delta (assq (aref robot 3) steps))
         (delta-x (cadr delta))
         (delta-y (caddr delta)))
    (aset robot 1 (+ delta-x (aref robot 1)))
    (aset robot 2 (+ delta-y (aref robot 2)))))


(provide 'robot-simulator)
;;; robot-simulator.el ends here
