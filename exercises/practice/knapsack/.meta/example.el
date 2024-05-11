;;; knapsack.el --- Knapsack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun maximum-value (maximum-weight items)
  (let ((table (make-vector (1+ maximum-weight) 0)))
    (dolist (item items)
      (let ((weight (alist-get :weight item))
            (value (alist-get :value item)))
        (cl-loop for index from maximum-weight downto weight
          for new-value = (+ value (aref table (- index weight)))
          do (when (> new-value (aref table index))
               (aset table index new-value)))))
    (aref table maximum-weight)))

(provide 'knapsack)
;;; knapsack.el ends here

