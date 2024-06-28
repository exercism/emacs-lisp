;;; proverb.el --- Proverb (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun recite (strings)
  (let ((n (length strings)))
    (cond ((= n 0) '())
          ((= n 1) (list (format "And all for the want of a %s." (car strings))))
          (t (append (cl-loop for i from 0 to (- n 2)
                              collect (format "For want of a %s the %s was lost." (nth i strings) (nth (1+ i) strings)))
                     (list (format "And all for the want of a %s." (car strings))))))))


(provide 'proverb)
;;; proverb.el ends here

