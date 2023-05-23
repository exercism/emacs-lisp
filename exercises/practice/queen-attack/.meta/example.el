;;; queen-attack.el --- Queen Attack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun valid-position-p (queen)
  (and (<= 0 (car queen) 7) (<= 0 (cdr queen) 7)))

(defun can-attack-p (white-queen black-queen)
  (let ((row-white (car white-queen))
        (column-white (cdr white-queen))
        (row-black (car black-queen))
        (column-black (cdr black-queen)))
    (or (= row-white row-black)
        (= column-white column-black)
        (= (- row-white column-white) (- row-black column-black))
        (= (+ row-white column-white) (+ row-black column-black)))))


(provide 'queen-attack)
;;; queen-attack.el ends here
