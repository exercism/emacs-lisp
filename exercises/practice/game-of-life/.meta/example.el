;;; game-of-life.el --- Conway&#39;s Game of Life (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun tick (matrix)
  (when matrix
    (let* ((lines (vconcat (mapcar #'vconcat matrix)))
           (num-rows (length lines))
           (num-columns (length (aref lines 0)))
           (results nil))
      (cl-loop for row from (1- num-rows) downto 0
        for result = nil
        for r-start = (max 0 (1- row))
        for r-end = (min num-rows (+ 2 row))
        do (cl-loop for column from (1- num-columns) downto 0
             for c-start = (max 0 (1- column))
             for c-end = (min num-columns (+ 2 column))
             for previous = (aref (aref lines row) column)
             for count = (- previous)
             do (cl-loop for r from r-start below r-end
                  for line = (aref lines r)
                  do (cl-loop for c from c-start below c-end
                       do (when (= 1 (aref line c))
                            (setq count (1+ count)))))
             for cell = (cl-case count
                          (3 1)
                          (2 previous)
                          (t 0))
             do (setq result (cons cell result)))

        do (setq results (cons result results)))
      results)))


(provide 'game-of-life)
;;; game-of-life.el ends here

