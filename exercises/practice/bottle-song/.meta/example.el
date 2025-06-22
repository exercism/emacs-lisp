;;; bottle-song.el --- Bottle Song (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defconst numbers ["No" "One" "Two" "Three" "Four" "Five" "Six" "Seven"
  "Eight" "Nine" "Ten"])

(defun line (bottles lower)
  (concat
    (if lower
      (downcase (aref numbers bottles))
      (aref numbers bottles))
    " green bottle"
    (if (= bottles 1)
      ""
      "s")
    " hanging on the wall"
    (if lower
      "."
      ",")))

(defun lyrics (bottles)
  (list
    (line bottles nil)
    (line bottles nil)
    "And if one green bottle should accidentally fall,"
    (concat "There'll be " (line (1- bottles) t))))

(defun recite (start-bottles take-down)
  (if (= take-down 1)
    (lyrics start-bottles)
    (append
      (lyrics start-bottles)
      (list "")
      (recite (1- start-bottles) (1- take-down)))))


(provide 'bottle-song)
;;; bottle-song.el ends here

