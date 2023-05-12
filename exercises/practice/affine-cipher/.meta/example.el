;;; affine-cipher.el --- Affine Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'seq)

(defconst letters-in-latin 26)

(defun encode (phrase key)
  (let ((a (cdr (assoc "a" key)))
        (b (cdr (assoc "b" key)))
        (m letters-in-latin)
        (phrase-cleaned
         (replace-regexp-in-string "[^a-z0-9]" "" (downcase phrase))))
    (unless (coprime-p a m)
      (error "a and m must be coprime."))
    (mapconcat
     'identity
     (seq-partition
      (mapcar
       (apply-partially 'exercism-encode-char a b m) phrase-cleaned)
      5)
     " ")))

(defun exercism-encode-char (a b m char)
  (if (<= ?0 char ?9)
      char
    (+ (mod (+ (* a (- char ?a)) b) m) ?a)))

(defun decode (phrase key)
  (let ((a (cdr (assoc "a" key)))
        (b (cdr (assoc "b" key)))
        (m letters-in-latin)
        (phrase-cleaned
         (replace-regexp-in-string "[^a-z0-9]" "" (downcase phrase))))
    (unless (coprime-p a m)
      (error "a and m must be coprime."))
    (seq-into
     (mapcar
      (apply-partially 'exercism-decode-char a b m) phrase-cleaned)
     'string)))

(defun exercism-decode-char (a b m char)
  (if (<= ?0 char ?9)
      char
    (+ (mod (* (mmi a m) (- (- char ?a) b)) m) ?a)))

(defun mmi (a m)
  "Find the modular multiplicative inverse (MMI) of A mod M using the extended Euclidean algorithm."
  (let ((tt 0) ;; t is already used as constant for truth
        (newtt 1)
        (r m)
        (newr a))
    (while (not (= newr 0))
      (let ((quotient (/ r newr))
            temp)
        (setq temp newtt)
        (setq newtt (- tt (* quotient newtt)))
        (setq tt temp)
        (setq temp newr)
        (setq newr (- r (* quotient newr)))
        (setq r temp)))

    (if (> r 1)
        (error
         "a is not invertible (provided numbers are not coprime)"))
    (if (< tt 0)
        (setq tt (+ tt m)))
    tt))

(defun coprime-p (m n)
  (= (gcd m n) 1))

(defun gcd (m n)
  "Find greatest common divisor of M and N.
Uses the Euclidian Algorithm."
  (let ((m
         (if (< m n)
             n
           m))
        (n
         (if (< m n)
             m
           n))
        r)
    (while (not (= n 0))
      (setq r (mod m n))
      (setq m n)
      (setq n r))
    m))

(provide 'affine-cipher)
;;; affine-cipher.el ends here
