;;; rail-fence-cipher.el --- Rail Fence Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'seq)
(require 'cl-lib)

(defun encode (message rails)
  (let ((rail-list (make-list rails ""))
        (index 0)
        (direction 'down))
    (seq-do
     (lambda (char)
       (setf (nth index rail-list)
             (concat (char-to-string char) (nth index rail-list)))
       (cond
        ((>= index (1- rails))
         (setq direction 'down))
        ((<= index 0)
         (setq direction 'up)))
       (if (equal direction 'up)
           (cl-incf index)
         (cl-decf index)))
     message)
    (mapconcat 'nreverse rail-list "")))

(defun decode (message rails)
  (let* ((message-length (length message))
         (cycle-length (* 2 (1- rails)))
         (cycles (/ message-length cycle-length))
         (decoded (make-vector message-length nil)))
    ;; format:  off
    (cl-loop
     for rail-index below rails
     with message-index = -1
     with decoded-index
     do
     (cl-loop
      for cycle-index upto cycles
      do (setf decoded-index (+ rail-index (* cycle-index cycle-length)))
      while (< decoded-index message-length)
      do
      (setf (elt decoded decoded-index)
            (elt message (cl-incf message-index)))
      and
      if (is-middle-rail rail-index rails)
      ;; middle rails consume two characters per cycle
      do
      (setf decoded-index
            (+ (- cycle-length rail-index) (* cycle-index cycle-length)))
      and
      if (< decoded-index message-length)
      do
      (setf (elt decoded decoded-index)
            (elt message (cl-incf message-index)))))
    ;; format:  on
    (seq-into decoded 'string)))

(defun is-middle-rail (rail-index rails)
  (< 0 rail-index (1- rails)))


(provide 'rail-fence-cipher)
;;; rail-fence-cipher.el ends here
