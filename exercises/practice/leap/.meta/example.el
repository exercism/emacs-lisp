;;; leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun leap-year-p (year)
  "Determine if YEAR is a leap year."
  (and (= 0 (mod year 4))
       (or (not (= 0 (mod year 100)))
           (= 0 (mod year 400)))))

(provide 'leap)
;;; leap.el ends here
