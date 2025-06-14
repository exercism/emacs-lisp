;;; matrix.el --- Matrix (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'seq)

(defun row (string index)
  (seq-into (mapcar #'string-to-number
              (split-string (nth (1- index)
                              (split-string string "\n")) " ")) 'vector))

(defun column (string index)
  (let ((extract (lambda (line)
                   (string-to-number (nth (1- index)
                                       (split-string line " "))))))
    (seq-into (seq-map extract
                (split-string string "\n")) 'vector)))

(provide 'matrix)
;;; matrix.el ends here
