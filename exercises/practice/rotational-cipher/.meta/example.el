;;; rotational-cipher.el --- Rotational Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst shift-max 26)

(defun rotate (text shift-key)
  (let ((normalized-shift-key (mod shift-key shift-max)))
    (concat
     (mapcar
      (lambda (char)
        (cond
         ((<= ?A char ?Z)
          (+ (mod (+ (- char ?A) normalized-shift-key) shift-max) ?A))
         ((<= ?a char ?z)
          (+ (mod (+ (- char ?a) normalized-shift-key) shift-max) ?a))
         (t
          char)))
      text))))


(provide 'rotational-cipher)
;;; rotational-cipher.el ends here
