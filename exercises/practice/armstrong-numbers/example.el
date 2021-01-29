;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(defun armstrong-p (n)
  (let* ((digits (mapcar (lambda (d) (- d ?0)) (string-to-list (int-to-string n))))
	 (p (length digits)))
    (= n (apply #'+ (mapcar (lambda (d) (expt d p)) digits)))))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
