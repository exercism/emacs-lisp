;;; series.el --- Series (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:



(defun slices (series slice-length)
  (cond
    ((equal "" series) (error "series cannot be empty"))
    ((> slice-length (length series)) (error "slice length cannot be greater than series length"))
    ((= slice-length 0) (error "slice length cannot be zero"))
    ((< slice-length 0) (error "slice length cannot be negative"))
    (t (mapcar (lambda (start)
                       (substring series start (+ start slice-length)))
               (number-sequence 0 (- (length series) slice-length))))))


(provide 'series)
;;; series.el ends here

