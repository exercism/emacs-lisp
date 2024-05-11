;;; space-age.el --- Space Age (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun orbital-period (planet)
  (pcase planet
    (:mercury 0.2408467)
    (:venus 0.61519726)
    (:earth 1.0)
    (:mars 1.8808158)
    (:jupiter 11.862615)
    (:saturn 29.447498)
    (:uranus 84.016846)
    (:neptune 164.79132)
    (_ (error "not a planet"))))

(defun age (planet seconds)
  (/ seconds (* (orbital-period planet) 31557600)))


(provide 'space-age)
;;; space-age.el ends here

