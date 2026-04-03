;;; change.el --- Change (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun find-fewest-coins (target coins)
  (when (< target 0) (error "target can't be negative"))
  (let* ((len (+ target (apply #'max coins) 1))
         (best-count (make-vector len len))
         (best-coin (make-vector len 0)))
    (aset best-count 0 0)
    (cl-loop for i below target
      for count-i = (aref best-count i)
      do (cl-loop for coin in coins
           for j = (+ i coin)
           when (< count-i (aref best-count j))
           do (aset best-count j (1+ count-i))
              (aset best-coin j coin)))

    (when (= (aref best-count target) len)
      (error "can't make target with given coins"))
    (cl-loop for remaining = target then (- remaining coin)
      for coin = (aref best-coin remaining)
      while (> remaining 0)
      collect coin)))

(provide 'change)
;;; change.el ends here
