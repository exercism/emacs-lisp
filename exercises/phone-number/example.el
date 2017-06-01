;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:

;;; Code:


(defun numbers (num)
  (let ((number (replace-regexp-in-string "[^0-9]+" "" num)))
    (cond
     ((= (length number) 10) number)
     ((and (= (length number) 11)
           (string-equal (substring number 0 1) "1")) (substring number 1))
     (t "0000000000"))))


(defun area-code (num)
  (substring (numbers num) 0 3))


(defun prefix (num)
  (substring (numbers num) 3 6))


(defun line-number (num)
  (substring (numbers num) 6))


(defun pprint (num)
  (format "(%s) %s-%s" (area-code num) (prefix num) (line-number num)))


(provide 'phone-number)
;;; phone-number.el ends here
