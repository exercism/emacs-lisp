;;; house.el --- House (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst line
"This is the horse and the hound and the horn \
that belonged to the farmer sowing his corn \
that kept the rooster \
that crowed in the morn \
that woke the priest all shaven and shorn \
that married the man all tattered and torn \
that kissed the maiden all forlorn \
that milked the cow with the crumpled horn \
that tossed the dog \
that worried the cat \
that killed the rat \
that ate the malt \
that lay in the house \
that Jack built.")

(defconst table [0 389 368 351 331 310 267 232 190 145 99 62 8])

(defun lyrics (verse)
  (concat (substring line 0 8) (substring line (aref table verse))))

(defun recite (start-verse end-verse)
  (when (<= start-verse end-verse)
    (cons (lyrics start-verse) (recite (1+ start-verse) end-verse))))

(provide 'house)
;;; house.el ends here

