;;; simple-cipher.el --- Simple Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'seq)
(require 'cl-lib)

(defconst alphabet-for-random-letter "abcdefghijklmnopqrstuvwxyz")

(defun encode (plaintext key)
  (simple-cipher plaintext key '+))

(defun decode (ciphertext key)
  (simple-cipher ciphertext key '-))

(defun simple-cipher (text key fun)
  (let ((calc-key
         (if (<= (length text) (length key))
             key
           (dotimes (_index (/ (length text) (length key)) key)
             (let ((key-copy key))
               (setq key (concat key key-copy)))))))
    (mapconcat
     'identity
     (cl-mapcar (lambda (char1 char2)
                  (char-to-string
                   (+ ?a
                      (mod
                       (funcall fun (- char1 ?a) (- char2 ?a))
                       (length alphabet-for-random-letter)))))
                text
                calc-key)
     "")))

(defun generate-key ()
  (let ((key ""))
    (dotimes (_i 100 key)
      (setq
       key
       (concat
        key
        (char-to-string
         (seq-elt
          alphabet-for-random-letter
          (mod
           ;; NOT cryptographically secure!
           ;; see https://emacs.stackexchange.com/questions/35615/secure-random-numbers
           (random t) (length alphabet-for-random-letter)))))))))

(provide 'simple-cipher)
;;; simple-cipher.el ends here
