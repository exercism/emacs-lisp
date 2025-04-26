;;; resistor-color-trio.el --- Resistor Color Trio (exercism)  -*- lexical-binding: t; -*-

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


(defun label (colors)
  (let* ((color-1 (nth 0 colors))
         (color-2 (nth 1 colors))
         (color-3 (nth 2 colors))
         (value (+ (* (cdr (assoc color-1 band-values)) 10)
                   (cdr (assoc color-2 band-values))))
         (resistance (* value (expt 10 (cdr (assoc color-3 band-values))))))
    (string-replace ".0" ""
      (cond
       ((< resistance 1000)
        (format "%d ohms" resistance))
       ((< resistance 1000000)
        (format "%.1f kiloohms" (/ resistance 1000.0)))
       ((< resistance 1000000000)
        (format "%.1f megaohms" (/ resistance 1000000.0)))
       (t
        (format "%.1f gigaohms" (/ resistance 1000000000.0)))))))


(provide 'resistor-color-trio)
;;; resistor-color-trio.el ends here
