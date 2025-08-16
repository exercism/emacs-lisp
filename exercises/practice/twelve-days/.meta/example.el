;;; twelve-days.el --- Twelve Days (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defconst ordinals ["" "first" "second" "third" "fourth" "fifth" "sixth"
  "seventh" "eighth" "ninth" "tenth" "eleventh" "twelfth"])

(defconst gifts
"twelve Drummers Drumming, \
eleven Pipers Piping, \
ten Lords-a-Leaping, \
nine Ladies Dancing, \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")

(defconst table [0 235 213 194 174 157 137 113 90 69 48 26 0])

(defun lyrics (verse)
  (concat
    "On the "
    (aref ordinals verse)
    " day of Christmas my true love gave to me: "
    (substring gifts (aref table verse))))

(defun recite (start-verse end-verse)
  (when (<= start-verse end-verse)
    (cons (lyrics start-verse) (recite (1+ start-verse) end-verse))))

(provide 'house)
;;; house.el ends here

