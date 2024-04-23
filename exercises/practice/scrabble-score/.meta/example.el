;;; scrabble-score.el --- Scrabble Score (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defvar letters->score '(
  ("AEIOULNRST" . 1)
  ("DG" . 2)
  ("BCMP" . 3)
  ("FHVWY" . 4)
  ("K" . 5)
  ("JX" . 8)
  ("QZ" . 10)
))

(defun letter-score (letter)
  "The Scrabble score for letter"
  (let ((table letters->score))
    (while
      (not (cl-find letter (caar table)))
      (setq table (cdr table)))
    (cdar table)))

(defun score (word)
  "The Scrabble score for word"
  (let ((total 0)
        (letters (cl-coerce (upcase word) 'list)))
    (dolist (letter letters)
      (setq total (+ total (letter-score letter))))
    total))

(provide 'scrabble-score)
;;; scrabble-score.el ends here
