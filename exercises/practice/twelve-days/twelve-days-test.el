;;; twelve-days-test.el --- Twelve Days (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "twelve-days.el")
(declare-function recite "twelve-days.el" (start-verse end-verse))


(ert-deftest verse-first-day-a-partridge-in-a-pear-tree ()
  (let ((expected '(
"On the first day of Christmas my true love gave to me: \
a Partridge in a Pear Tree.")))
    (should (equal (recite 1 1) expected))))


(ert-deftest verse-second-day-two-turtle-doves ()
  (let ((expected '(
"On the second day of Christmas my true love gave to me: \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 2 2) expected))))


(ert-deftest verse-third-day-three-french-hens ()
  (let ((expected '(
"On the third day of Christmas my true love gave to me: \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 3 3) expected))))


(ert-deftest verse-fourth-day-four-calling-birds ()
  (let ((expected '(
"On the fourth day of Christmas my true love gave to me: \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 4 4) expected))))


(ert-deftest verse-fifth-day-five-gold-rings ()
  (let ((expected '(
"On the fifth day of Christmas my true love gave to me: \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 5 5) expected))))


(ert-deftest verse-sixth-day-six-geese-a-laying ()
  (let ((expected '(
"On the sixth day of Christmas my true love gave to me: \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 6 6) expected))))


(ert-deftest verse-seventh-day-seven-swans-a-swimming ()
  (let ((expected '(
"On the seventh day of Christmas my true love gave to me: \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 7 7) expected))))


(ert-deftest verse-eighth-day-eight-maids-a-milking ()
  (let ((expected '(
"On the eighth day of Christmas my true love gave to me: \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 8 8) expected))))


(ert-deftest verse-ninth-day-nine-ladies-dancing ()
  (let ((expected '(
"On the ninth day of Christmas my true love gave to me: \
nine Ladies Dancing, \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 9 9) expected))))


(ert-deftest verse-tenth-day-ten-lords-a-leaping ()
  (let ((expected '(
"On the tenth day of Christmas my true love gave to me: \
ten Lords-a-Leaping, \
nine Ladies Dancing, \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 10 10) expected))))


(ert-deftest verse-eleventh-day-eleven-pipers-piping ()
  (let ((expected '(
"On the eleventh day of Christmas my true love gave to me: \
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
and a Partridge in a Pear Tree.")))
    (should (equal (recite 11 11) expected))))


(ert-deftest verse-twelfth-day-twelve-drummers-drumming ()
  (let ((expected '(
"On the twelfth day of Christmas my true love gave to me: \
twelve Drummers Drumming, \
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
and a Partridge in a Pear Tree.")))
    (should (equal (recite 12 12) expected))))


(ert-deftest lyrics-recites-first-three-verses-of-the-song ()
  (let ((expected '(
"On the first day of Christmas my true love gave to me: \
a Partridge in a Pear Tree."

"On the second day of Christmas my true love gave to me: \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the third day of Christmas my true love gave to me: \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 1 3) expected))))


(ert-deftest lyrics-recites-three-verses-from-the-middle-of-the-song ()
  (let ((expected '(
"On the fourth day of Christmas my true love gave to me: \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the fifth day of Christmas my true love gave to me: \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the sixth day of Christmas my true love gave to me: \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree.")))
    (should (equal (recite 4 6) expected))))


(ert-deftest lyrics-recites-the-whole-song ()
  (let ((expected '(
"On the first day of Christmas my true love gave to me: \
a Partridge in a Pear Tree."

"On the second day of Christmas my true love gave to me: \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the third day of Christmas my true love gave to me: \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the fourth day of Christmas my true love gave to me: \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the fifth day of Christmas my true love gave to me: \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the sixth day of Christmas my true love gave to me: \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the seventh day of Christmas my true love gave to me: \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the eighth day of Christmas my true love gave to me: \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the ninth day of Christmas my true love gave to me: \
nine Ladies Dancing, \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the tenth day of Christmas my true love gave to me: \
ten Lords-a-Leaping, \
nine Ladies Dancing, \
eight Maids-a-Milking, \
seven Swans-a-Swimming, \
six Geese-a-Laying, \
five Gold Rings, \
four Calling Birds, \
three French Hens, \
two Turtle Doves, \
and a Partridge in a Pear Tree."

"On the eleventh day of Christmas my true love gave to me: \
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
and a Partridge in a Pear Tree."

"On the twelfth day of Christmas my true love gave to me: \
twelve Drummers Drumming, \
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
and a Partridge in a Pear Tree.")))
    (should (equal (recite 1 12) expected))))


(provide 'twelve-days-test)
;;; twelve-days-test.el ends here
