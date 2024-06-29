;;; variable-length-quantity.el --- Variable Length Quantity (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(define-error 'incomplete "incomplete sequence")


(defun encode (numbers)
  "Encode a list of numbers into VLQ format."
  (let ((encode-single (lambda (number)
                         (let ((byte-string (list (logand number 127)))) ; Initialize with the least significant byte
                           (setq number (lsh number -7)) ; Shift right before the loop
                           (while (> number 0)
                             (push (logior (logand number 127) 128) byte-string)
                             (setq number (lsh number -7)))
                           byte-string))))
    (apply #'append (mapcar encode-single numbers))))


(defun decode (byte-string)
  "Decode a byte string from VLQ format into numbers."
  (let ((values '())
        (number 0)
        (incomplete t))
    (dolist (byte byte-string)
      (setq number (lsh number 7))
      (setq number (logior number (logand byte 127)))
      (if (= (logand byte 128) 0)
          (progn
            (setq values (cons number values))
            (setq number 0)
            (setq incomplete nil))
        (setq incomplete t)))
    (if incomplete
        (signal 'incomplete 'nil)
      (reverse values))))


(provide 'variable-length-quantity)
;;; variable-length-quantity.el ends here
