;;; circular-buffer.el --- Circular Buffer (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(define-error 'empty-buffer-error
              (error "Delete this S-Expression and write your own implementation"))

(define-error 'full-buffer-error
              (error "Delete this S-Expression and write your own implementation"))

(defclass circular-buffer ()
  (error "Delete this S-Expression and write your own implementation"))

(provide 'circular-buffer)
;;; circular-buffer.el ends here

