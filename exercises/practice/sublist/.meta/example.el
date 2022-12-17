;;; sublist.el --- Sublist (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun list--partition (list cell-size)
  (cl-loop for index from 0
           ;; we can ignore the rest because this can never contain our sublist
           while (<= index (- (length list) cell-size))
           collect (cl-subseq list index (+ index cell-size))))

(defun list-sublist (list1 list2)
  (cl-some (lambda (partition)
             (equal list1 partition))
           (list--partition list2 (length list1))))

(defun list-classify (list1 list2)
  (cond ((equal list1 list2) :equal)
        ((list-sublist list2 list1) :superlist)
        ((list-sublist list1 list2) :sublist)
        ('t :unequal)))

(provide 'sublist)
;;; sublist.el ends here
