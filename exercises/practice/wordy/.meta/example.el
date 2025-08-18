;;; wordy.el --- Wordy (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(define-error 'parse-error "unable to understand question")

(defun calculate (left tokens)
  (if (null tokens)
    left
    (let ((operation (car tokens)))
      (cond
        ((null (cdr tokens)) (signal 'parse-error nil))
        ((string= operation "plus") (calculate (+ left (string-to-number (cadr tokens))) (drop 2 tokens)))
        ((string= operation "minus") (calculate (- left (string-to-number (cadr tokens))) (drop 2 tokens)))
        ((string= operation "multiplied-by") (calculate (* left (string-to-number (cadr tokens))) (drop 2 tokens)))
        ((string= operation "divided-by") (calculate (/ left (string-to-number (cadr tokens))) (drop 2 tokens)))
        (t (signal 'parse-error nil))))))

(defun answer (question)
  (unless (string= (substring question -1) "?") (signal 'parse-error nil))
  (let ((tokens (split-string (string-replace " by" "-by" (substring question 0 -1)))))
    (unless (string= (car tokens) "What") (signal 'parse-error nil))
    (unless (string= (cadr tokens) "is") (signal 'parse-error nil))
    (unless (cddr tokens) (signal 'parse-error nil))
    (calculate (string-to-number (caddr tokens)) (drop 3 tokens))))


(provide 'wordy)
;;; wordy.el ends here
