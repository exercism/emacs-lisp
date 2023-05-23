;;; binary-search.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun find-binary (array value)
  (let ((left 0)
        (right (1- (length array)))
        middle
        index-of-value)
    (while (and (not index-of-value) (<= left right))
      (setq middle (+ left (/ (- right left) 2)))
      (cond
       ((equal (aref array middle) value)
        (setq index-of-value middle))
       ((< (aref array middle) value)
        (setq left (1+ middle)))
       ((> (aref array middle) value)
        (setq right (1- middle)))))
    index-of-value))


(provide 'binary-search)
;;; binary-search.el ends here
