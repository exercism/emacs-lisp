;;; luhn.el --- luhn (exercism)

;;; Commentary:

;;; Code:

(require 'seq)
(defun luhn-p (dastring)
  "Check if an input string DASTRING is valid using lhun algorithm."
  (let ((str (replace-regexp-in-string " " "" dastring)))
    (if (string-match-p "[^0-9 ]" str)
	(error "String contains invalid character")
      (progn
	(if (<= (length str) 1)
	    nil
	  (let ((digit-list (reverse (mapcar #'(lambda (x) (- x 48))
					     (string-to-list (replace-regexp-in-string " " "" str))))))
	    (zerop (mod (apply #'+ (seq-map-indexed
				    (lambda (elt idx) (if (oddp idx)
							  (if (> (* 2 elt) 9)
							      (- (* 2 elt) 9)
							    (* 2 elt))
							elt))
				    digit-list))
			10))))))))
(provide 'luhn)
;;; luhn.el ends here
