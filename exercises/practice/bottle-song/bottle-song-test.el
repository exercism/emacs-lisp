;;; bottle-song-test.el --- Bottle Song (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "bottle-song.el")
(declare-function recite "bottle-song.el" (start-bottles take-down))


(ert-deftest first-generic-verse ()
  (let ((expected '("Ten green bottles hanging on the wall,"
                    "Ten green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be nine green bottles hanging on the wall.")))
    (should (equal (recite 10 1) expected))))


(ert-deftest last-generic-verse ()
  (let ((expected '("Three green bottles hanging on the wall,"
                    "Three green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be two green bottles hanging on the wall.")))
    (should (equal (recite 3 1) expected))))


(ert-deftest verse-with-2-bottles ()
  (let ((expected '("Two green bottles hanging on the wall,"
                    "Two green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be one green bottle hanging on the wall.")))
    (should (equal (recite 2 1) expected))))


(ert-deftest verse-with-1-bottle ()
  (let ((expected '("One green bottle hanging on the wall,"
                    "One green bottle hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be no green bottles hanging on the wall.")))
    (should (equal (recite 1 1) expected))))


(ert-deftest first-two-verses ()
  (let ((expected '("Ten green bottles hanging on the wall,"
                    "Ten green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be nine green bottles hanging on the wall."
                    ""
                    "Nine green bottles hanging on the wall,"
                    "Nine green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be eight green bottles hanging on the wall.")))
    (should (equal (recite 10 2) expected))))


(ert-deftest last-three-verses ()
  (let ((expected '("Three green bottles hanging on the wall,"
                    "Three green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be two green bottles hanging on the wall."
                    ""
                    "Two green bottles hanging on the wall,"
                    "Two green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be one green bottle hanging on the wall."
                    ""
                    "One green bottle hanging on the wall,"
                    "One green bottle hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be no green bottles hanging on the wall.")))
    (should (equal (recite 3 3) expected))))


(ert-deftest all-verses ()
  (let ((expected '("Ten green bottles hanging on the wall,"
                    "Ten green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be nine green bottles hanging on the wall."
                    ""
                    "Nine green bottles hanging on the wall,"
                    "Nine green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be eight green bottles hanging on the wall."
                    ""
                    "Eight green bottles hanging on the wall,"
                    "Eight green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be seven green bottles hanging on the wall."
                    ""
                    "Seven green bottles hanging on the wall,"
                    "Seven green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be six green bottles hanging on the wall."
                    ""
                    "Six green bottles hanging on the wall,"
                    "Six green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be five green bottles hanging on the wall."
                    ""
                    "Five green bottles hanging on the wall,"
                    "Five green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be four green bottles hanging on the wall."
                    ""
                    "Four green bottles hanging on the wall,"
                    "Four green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be three green bottles hanging on the wall."
                    ""
                    "Three green bottles hanging on the wall,"
                    "Three green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be two green bottles hanging on the wall."
                    ""
                    "Two green bottles hanging on the wall,"
                    "Two green bottles hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be one green bottle hanging on the wall."
                    ""
                    "One green bottle hanging on the wall,"
                    "One green bottle hanging on the wall,"
                    "And if one green bottle should accidentally fall,"
                    "There'll be no green bottles hanging on the wall.")))
    (should (equal (recite 10 10) expected))))


(provide 'bottle-song-test)
;;; bottle-song-test.el ends here
