;;; matching-brackets.el --- Matching Brackets (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(require 'seq)

(defun is-paired (value)
  (let ((brackets '()))
    (and
     (seq-every-p
      (lambda (char)
        (cond
         ((= char ?\()
          (push ?\) brackets))
         ((= char ?\[)
          (push ?\] brackets))
         ((= char ?{)
          (push ?} brackets))
         ((= char ?\))
          ;; need to use equal because = doesn't accept nil
          (if (equal (car brackets) ?\))
              ;; make sure return is true when brackets gets set to nil / empty list
              (or (setq brackets (cdr brackets)) t)
            nil))
         ((= char ?\])
          (if (equal (car brackets) ?\])
              (or (setq brackets (cdr brackets)) t)
            nil))
         ((= char ?})
          (if (equal (car brackets) ?})
              (or (setq brackets (cdr brackets)) t)
            nil))
         (t
          t)))
      value)
     (seq-empty-p brackets))))


(provide 'matching-brackets)
;;; matching-brackets.el ends here
