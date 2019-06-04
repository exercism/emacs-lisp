;;; roman-numerals.el --- roman-numerals Exercise (exercism)

;;; Commentary:

;;; Code:


(defun to-roman (value)
  (let ((decode '(("M"  . 1000)
                  ("CM" . 900)
                  ("D"  . 500)
                  ("CD" . 400)
                  ("C"  . 100)
                  ("XC" .  90)
                  ("L"  .  50)
                  ("XL" .  40)
                  ("X"  .  10)
                  ("IX" .   9)
                  ("V"  .   5)
                  ("IV" .   4)
                  ("I"  .   1)))
        (roman nil))
    (if (> value 3000)
        (error "Value out of range"))
    (while (not (eq value 0))
      (let ((r (caar decode))
            (d (cdar decode)))
        (when (>= value d)
          (setq roman (append roman (make-list (/ value d) r)))
          (setq value (% value d)))
        (setq decode (cdr decode))))
    (apply #'concat roman)))


(provide 'roman-numerals)
;;; roman-numerals.el ends here
