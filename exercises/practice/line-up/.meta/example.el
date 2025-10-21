;;; line-up.el --- Line Up (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun suffix (number)
  (let ((units (mod number 10))
        (tens (mod (/ number 10) 10)))
    (cond ((= tens 1) "th")
          ((= units 1) "st")
          ((= units 2) "nd")
          ((= units 3) "rd")
          (t "th"))))


(defun ticket (name number)
  (concat
    name
    ", you are the "
    (number-to-string number)
    (suffix number)
    " customer we serve today. Thank you!"))


(provide 'line-up)
;;; line-up.el ends here

