;;; food-chain.el --- Food Chain (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defvar +creatures+ ["fly" "spider" "bird" "cat" "dog" "goat" "cow" "horse"])
(defvar +unique-lines+ ["I don't know why she swallowed the fly. Perhaps she'll die."
                        "It wriggled and jiggled and tickled inside her."
                        "How absurd to swallow a bird!"
                        "Imagine that, to swallow a cat!"
                        "What a hog, to swallow a dog!"
                        "Just opened her throat and swallowed a goat!"
                        "I don't know how she swallowed a cow!"
                        "She's dead, of course!"])

(defun verse-end-p (index)
  (or (= 7 index) (zerop index)))

(defun add-lines (index)
  (if (verse-end-p index)
      (list (aref +unique-lines+ index))
    (let* ((spider (if (= 2 index) " that wriggled and jiggled and tickled inside her" ""))
           (creature (aref +creatures+ index))
           (next-creature (aref +creatures+ (1- index)))
           (line (format "She swallowed the %s to catch the %s%s." creature next-creature spider)))
      (cons line (add-lines (1- index))))))

(defun single-verse (index)
  (let* ((start-line (format "I know an old lady who swallowed a %s." (aref +creatures+ index)))
         (second-line (unless (verse-end-p index) (aref +unique-lines+ index)))
         (verse-block (add-lines index)))
    (if second-line
        (cons start-line (cons second-line verse-block))
      (cons start-line verse-block))))


(defun recite (start-verse end-verse)
  (let (output)
    (cl-loop for index from (1- start-verse) below end-verse
             do (setq output (append output (single-verse index) '(""))))
    (butlast output 1)))  ;; Remove the last empty string added

(provide 'food-chain)
;;; food-chain.el ends here

