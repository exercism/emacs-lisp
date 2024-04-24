;;; resistor-color-duo.el --- Resistor Color Duo (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(setq band-values 
'(("black"  . 0)
  ("brown"  . 1)
  ("red"    . 2)
  ("orange" . 3)
  ("yellow" . 4)
  ("green"  . 5)
  ("blue"   . 6)
  ("violet" . 7)
  ("grey"   . 8)
  ("white"  . 9)))

(defun value (colors)
    (+ (* (get-value (nth 0 colors)) 10)
       (get-value (nth 1 colors))))
 
(defun get-value (color)
 (cdr (assoc color band-values)))

(provide 'resistor-color-duo)
;;; resistor-color-duo.el ends here
