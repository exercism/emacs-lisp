;;; isogram.el --- isogram (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun upper-char-p (c)
  "Determine if char C is alphabetic and upper case."
  (and
   (>= c ?A)
   (<= c ?Z)))

(defun isogramp (phrase)
  "Determine if a given phrase is an isogram."
  (let* ((bitset 0)
         (updated 0)
         (characters (cl-coerce (upcase phrase) 'list))
         (letters (cl-remove-if-not 'upper-char-p characters)))
    (cl-loop for c in letters
      do (setq updated (logior bitset (lsh 1 (- c ?A))))
      always (> updated bitset)
      do (setq bitset updated))))

(provide 'isogram)
;;; isogram.el ends here
