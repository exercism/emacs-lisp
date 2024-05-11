;;; nth-prime.el --- Nth Prime (exercism)  -*- lexical-binding: t; -*-


;;; Commentary:

; We use the prime number theorem to over-estimate the nth prime
; as 1 + n (log2 n)

; We use the Sieve of Eratosthenes to generate primes.


;;; Code:

(require 'cl-lib)

(defun over-estimate (number)
  (cl-loop for count from 1
    while (< (ash 1 count) number)
    finally return (1+ (* number count))))

(defun prime (number)
  (when (= number 0)
    (error "there is no zeroth prime"))
  (let* ((limit (over-estimate number))
         (table (make-bool-vector (1+ limit) t))
         (count 0))
    (cl-loop for p from 2
      for psq = (* p p)
      until (< limit psq)
      do (when (aref table p)
           (cl-loop for m from psq to limit by p
             do (aset table m nil))))
    (cl-loop for p from 2
      do (when (aref table p)
           (setq count (1+ count)))
      until (= count number)
      finally return p)))


(provide 'nth-prime)
;;; nth-prime.el ends here

