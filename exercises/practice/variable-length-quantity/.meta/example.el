;;; variable-length-quantity.el --- Variable Length Quantity (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun encode (hex-numbers)
  "Encode a list of hexadecimal numbers into VLQ format."
  (let ((encode-single (lambda (number)
                         (let ((byte-string (list (logand number #x7F)))) ; Initialize with the least significant byte
                           (setq number (ash number -7)) ; Shift right before the loop
                           (while (> number 0)
                             (push (logior (logand number #x7F) #x80) byte-string)
                             (setq number (ash number -7)))
                           byte-string))))
    (apply #'append (mapcar encode-single hex-numbers))))


(defun decode (hex-values)
  "Decode a list of hexadecimal values from VLQ format into hexadecimal numbers."
  (let ((values '())
        (number 0)
        (incomplete t))
    (dolist (byte hex-values)
      (setq number (ash number 7))
      (setq number (logior number (logand byte #x7F)))
      (if (= (logand byte #x80) 0)
          (progn
            (setq values (cons number values))
            (setq number 0)
            (setq incomplete nil))
        (setq incomplete t)))
    (if incomplete
        (error "imcomplete sequence")
      (reverse values))))


(provide 'variable-length-quantity)
;;; variable-length-quantity.el ends here
