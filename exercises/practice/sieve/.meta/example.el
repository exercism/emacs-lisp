;;; sieve.el --- Sieve (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun primes (limit)
  (let ((table (make-bool-vector (1+ limit) t))
        (result nil))
    (cl-loop for p from 2
      for psq = (* p p)
      until (< limit psq)
      do (when (aref table p)
           (cl-loop for m from psq to limit by p
             do (aset table m nil))))
    (cl-loop for p from limit downto 2
      do (when (aref table p)
           (setq result (cons p result))))
    result))

(provide 'sieve)
;;; sieve.el ends here

