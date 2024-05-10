;;; knapsack.el --- Knapsack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun knapsack (capacity weights values)
  (let ((table (make-vector (1+ capacity) 0)))
    (cl-loop while weights
      for weight = (car weights)
      for value = (car values)
      do (setq weights (cdr weights))
      do (setq values (cdr values))
      do (cl-loop for index from capacity downto weight
           do (aset table index (max (aref table index)
                                     (+ value (aref table (- index weight)))))))
    (aref table capacity)))

(provide 'knapsack)
;;; knapsack.el ends here

