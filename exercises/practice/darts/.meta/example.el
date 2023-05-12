;;; darts.el --- Darts (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun score (x y)
  (let ((distance-to-center (sqrt (+ (expt x 2) (expt y 2)))))
    (cond
     ((<= distance-to-center 1)
      10)
     ((<= distance-to-center 5)
      5)
     ((<= distance-to-center 10)
      1)
     (t
      0))))


(provide 'darts)
;;; darts.el ends here
