;;; reverse-string.el --- Reverse String (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'cl-lib)
(require 'ucs-normalize)

(defun combining-mark-p (char)
  (let ((category (get-char-code-property char 'general-category)))
    (or (string= category "Mn")  ; Nonspacing_Mark
        (string= category "Mc")  ; Spacing_Mark
        (string= category "Me")))) ; Enclosing_Mark

(defun split-grapheme-clusters (str)
  (let ((clusters '())
        (i 0)
        (len (length str)))
    (while (< i len)
      (let ((start i))
        (setq i (1+ i))
        (while (and (< i len)
                    (combining-mark-p (aref str i)))
          (setq i (1+ i)))
        (push (substring str start i) clusters)))
    (nreverse clusters)))

(defun reverse-string (value)
  (let* ((decomposed (ucs-normalize-NFD-string value))
         (clusters (split-grapheme-clusters decomposed)))
    (apply #'concat (reverse clusters))))

(provide 'reverse-string)
;;; reverse-string.el ends here
