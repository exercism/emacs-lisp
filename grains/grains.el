;;; grains.el --- Grains exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl)

(defun square (n)
  "Find the number of grains on square N."
  (expt 2 (- n 1)))

(defun total ()
  "Find the total number of grains on the board."
  (reduce #'+ (mapcar #'square (number-sequence 1 64))))

(provide 'grains)
;;; grains.el ends here
