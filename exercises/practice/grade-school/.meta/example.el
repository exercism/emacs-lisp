;;; grade-school.el --- Grade School (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'cl-lib)

(cl-defstruct school (roster (make-hash-table :test 'equal)))

(defun add (school name grade)
  (let ((current-roster (school-roster school)))
    (if (cl-loop for g being the hash-keys of current-roster
                 thereis (member name (gethash g current-roster)))
        nil
      (puthash grade (sort (cons name (gethash grade current-roster)) #'string<) current-roster)
      t)))

(defun roster (school)
  (let ((grades-and-names (list)))
    (maphash (lambda (grade names) (push (cons grade names) grades-and-names))
             (school-roster school))
    (apply #'append
           (mapcar #'cdr
                   (sort grades-and-names (lambda (a b) (< (car a) (car b))))))))

(defun grade (school grade)
  (gethash grade (school-roster school)))

(defun set-grade (school grade newval)
  (puthash grade (sort newval #'string<) (school-roster school)))


(provide 'grade-school)
;;; grade-school.el ends here
