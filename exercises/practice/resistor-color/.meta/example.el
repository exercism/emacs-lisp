;;; resistor-color.el --- Resistor Color (exercism)  -*- lexical-binding: t; -*-

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

(defun color-code (color)
  (cdr (assoc color band-values)))

(defun colors ()
  (mapcar #'car band-values))


(provide 'resistor-color)
;;; resistor-color.el ends here

