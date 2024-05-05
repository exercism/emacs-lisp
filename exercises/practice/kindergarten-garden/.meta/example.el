;;; kindergarten-garden.el --- Kindergarten Garden (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun plants (diagram student)
  (cl-flet ((plant (index)
              (cl-case (aref diagram index)
                (?G "grass")
                (?C "clover")
                (?R "radishes")
                (?V "violets"))))
    (let* ((midpoint (/ (1+ (length diagram)) 2))
           (student_index (- (aref student 0) ?A))
           (first (* 2 student_index))
           (second (1+ first))
           (third (+ midpoint first))
           (fourth (1+ third)))
      (mapcar #'plant (list first second third fourth)))))

(provide 'plants)
;;; kindergarten-garden.el ends here
