;;; largest-series-product.el --- Largest Series Product (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun largest-product (digits span)
  (when (< span 0)
    (error "span must not be negative"))
  (when (> span (length digits))
    (error "span must not exceed string length"))
  (unless (cl-every 'cl-digit-char-p (cl-coerce digits 'list))
    (error "digits input must only contain digits"))
  (let ((largest 0))
    (dotimes (i (+ 1 (- (length digits) span)))
      (let ((product 1))
        (dotimes (j span)
          (setq product (* product (cl-digit-char-p (aref digits (+ i j))))))
        (when (< largest product)
          (setq largest product))))
    largest))

(provide 'largest-series-product)
;;; largest-series-product.el ends here
