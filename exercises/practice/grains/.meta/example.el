;;; grains.el --- Grains exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun square (n)
  "Find the number of grains on square N."
  (string-to-number (calc-eval (format "2^(%d - 1)" n))))

(defun total ()
  "Find the total number of grains on the board."
  (string-to-number (calc-eval "2^64 - 1")))

(provide 'grains)
;;; grains.el ends here
