;;; atbash-cipher.el --- Atbash-Cipher (exercism)

;;; Commentary:
;;;
;;; Adapted from the Common Lisp example, at
;;; https://github.com/exercism/xlisp/blob/master/atbash-cipher/example.lisp


;;; Code:

(defun encode (plaintext)
  "Encode PLAINTEXT to atbash-cipher encoding."
  (to-string (group (to-cipher-seq plaintext))))

(defun to-string (seq)
  "Convert SEQ of characters to a string."
  (cl-concatenate 'string seq))

(defun group (seq &optional group-size)
  "Group SEQ into chunks of size GROUP-SIZE."
  (let ((length (or group-size 5)))
    (cl-loop
     for c in seq and i from 1
     collect c
     when (and (not (= i (length seq)))
               (zerop (mod i length)))
     collect ?\ )))


(defun to-cipher-seq (plaintext)
  "Convert PLAINTEXT to a ciphered sequence."
  (cleanup-ciphered-seq (cl-map 'list #'encipher plaintext)))

(defun cleanup-ciphered-seq (seq)
  "Clean values of char code 0 from SEQ."
  (remove 0 seq))

(defun encipher (c)
  "Encipher the character C."
  (cond ((alpha-char-p c) (opposite-char (downcase c)))
        ((digit-char-p c) c)
        (t 0)))

(defun digit-char-p (c)
  "Determine if char C is numeric."
  (and
   (>= c ?0)
   (<= c ?9)))




(defun alpha-char-p (c)
  "Determine if char C is alphabetic."
  (and
   (>= c ?A)
   (<= c ?z)))



(defun opposite-char (c)
  "Find the opposite char of argument character C."
  (- ?z
     (- c ?a)))


(provide 'atbash-cipher)
;;; atbash-cipher.el ends here
