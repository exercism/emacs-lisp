;;; crypto-square.el --- Crypto Square (exercism)

;;; Commentary:

;;; Code:

(defun normalize-text (string)
  (replace-regexp-in-string "[^a-z0-9]" "" (downcase string)))

(defun find-rectangle-size (string)
  (ceiling (sqrt (length string))))

(defun chop-string (string columns)
  (with-temp-buffer
    (insert string)
    (goto-char (point-min))
    (while (not (eobp))
      (ignore-errors (forward-char columns))
      (insert "\n"))
    (split-string (buffer-string) "\n" t)))

(defun strings-column (strings column)
  (mapconcat (lambda (string)
               (if (< column (length string))
                   (char-to-string (aref string column))
                 " "))
             strings ""))

(defun transpose-strings (strings columns)
  (mapcar (lambda (col) (strings-column strings col))
          (number-sequence 0 (1- columns))))

(defun encipher (plaintext)
  (let* ((text (normalize-text plaintext))
         (columns (find-rectangle-size text))
         (strings (chop-string text columns))
         (transposed (transpose-strings strings columns)))
    (mapconcat #'identity transposed " ")))

(provide 'crypto-square)
;;; crypto-square.el ends here
