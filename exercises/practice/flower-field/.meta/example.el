;;; flower-field.el --- Flower Field (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun annotate (garden)
  (when garden
    (let* ((num-columns (length (car garden)))
           (lines (vconcat garden))
           (num-rows (length lines))
           (results nil))
      (cl-loop for row from (1- num-rows) downto 0
        for result = (copy-sequence (aref lines row))
        for r-start = (max 0 (1- row))
        for r-end = (min num-rows (+ 2 row))
        do (cl-loop for column from 0 below num-columns
             for c-start = (max 0 (1- column))
             for c-end = (min num-columns (+ 2 column))
             for count = 0
             do (unless (= ?* (aref result column))
                  (cl-loop for r from r-start below r-end
                    for line = (aref lines r)
                    do (cl-loop for c from c-start below c-end
                         do (when (= ?* (aref line c))
                              (setq count (1+ count)))))
                  (unless (= 0 count)
                    (aset result column (+ ?0 count)))))
        do (setq results (cons result results)))
      results)))

(provide 'flower-field)
;;; flower-field.el ends here
