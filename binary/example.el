;;; binary.el --- Binary exercise (exercism)

;;; Commentary:

;;; Code:

(defun to-decimal (binary-string)
  "Convert BINARY-STRING to a decimal integer."
  (string-to-number binary-string 2))


(provide 'binary)
;;; binary.el ends here
