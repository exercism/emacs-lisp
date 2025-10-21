;;; dominoes.el --- Dominoes (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'seq)

(defun evenp (number)
  (= (logand number 1) 0))

(defun can-chain (dominoes)
  (letrec ((table-length 7)
           (numbers (cl-loop for i below table-length collect i))
           (tally (make-vector table-length 0))
           (parent (vconcat numbers))
           (root (lambda (number)
                   (if (= (aref parent number) number)
                     number
                     (funcall root (aref parent number)))))
           (process (lambda (stone)
             (aset tally (car stone) (1+ (aref tally (car stone))))
             (aset tally (cdr stone) (1+ (aref tally (cdr stone))))
             (aset parent (funcall root (cdr stone)) (funcall root (car stone)))))
           (rootp (lambda (number)
                    (and (> (aref tally number) 0) (= (funcall root number) number)))))
    (mapc process dominoes)
    (and (seq-every-p #'evenp tally) (length< (seq-filter rootp numbers) 2))))


(provide 'dominoes)
;;; dominoes.el ends here

