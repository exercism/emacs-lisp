;;; luhn.el --- luhn (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun char-to-number (char)
  "Return the integer (0-9) represented by CHAR."
  (- char 48))

(defun luhn-mangle (index number)
  "Using Luhn, mangle INDEX and NUMBER."
  (let ((twice (* 2 number)))
    (cond
     ((cl-evenp index) number)
     ((> twice 9) (- twice 9))
     (t twice))))

(defun luhn-p (str)
  "Check if STR is valid using the Luhn algorithm."
  (setq str (replace-regexp-in-string " " "" str))
  (when (string-match-p "[^0-9 ]" str)
    (error "String contains invalid character"))
  (when (< 1 (length str))
    (let ((mangled (cl-mapcar #'luhn-mangle
                              (number-sequence 0 (length str))
                              (reverse (mapcar #'char-to-number str)))))
      (= 0 (mod (apply #'+ mangled) 10)))))

(provide 'luhn)
;;; luhn.el ends here
