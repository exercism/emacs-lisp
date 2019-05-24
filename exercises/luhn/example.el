;;; luhn.el --- luhn (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun luhn-p (dastring)
  "Check if an input string DASTRING is valid using lhun algorithm."
  (let ((str (replace-regexp-in-string " " "" dastring)))
    (if (string-match-p "[^0-9 ]" str)
	(error "String contains invalid character")
      (if (<= (length str) 1)
	  nil
	(let* ((digit-list (reverse (mapcar (lambda (x) (- x 48))
				            (string-to-list str))))
	       (digit-list-with-index (cl-pairlis (number-sequence 0 (- (length digit-list) 1))
                                                  digit-list)))
	  (zerop (mod (apply #'+
                             (mapcar (lambda (x)
                                       (if (equal 1 (mod (car x) 2))
				           (if (> (* 2 (cdr x)) 9)
				               (- (* 2 (cdr x)) 9)
				             (* 2 (cdr x)))
				         (cdr x)))
				     digit-list-with-index))
		      10)))))))

(provide 'luhn)
;;; luhn.el ends here
