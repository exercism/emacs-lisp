;;; pythagorean-triplet-test.el --- Tests for Pythagorean Triplet (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "pythagorean-triplet.el")
(declare-function triplets-with-sum "pythagorean-triplet.el" (n))


(ert-deftest triplets-whose-sum-is-12 ()
  (should (equal '((3 4 5)) (triplets-with-sum 12))))


(ert-deftest triplets-whose-sum-is-108 ()
  (should (equal '((27 36 45)) (triplets-with-sum 108))))


(ert-deftest triplets-whose-sum-is-1000 ()
  (should (equal '((200 375 425)) (triplets-with-sum 1000))))


(ert-deftest no-matching-triplets-for-1001 ()
  (should (equal '() (triplets-with-sum 1001))))


(ert-deftest returns-all-matching-triplets ()
  (should (equal '((9 40 41) (15 36 39)) (triplets-with-sum 90))))


(ert-deftest several-matching-triplets ()
  (should (equal '((40 399 401)
                   (56 390 394)
                   (105 360 375)
                   (120 350 370)
                   (140 336 364)
                   (168 315 357)
                   (210 280 350)
                   (240 252 348))
                 (triplets-with-sum 840))))


(ert-deftest triplets-for-large-number ()
  (should (equal '((1200 14375 14425)
                   (1875 14000 14125)
                   (5000 12000 13000)
                   (6000 11250 12750)
                   (7500 10000 12500))
                 (triplets-with-sum 30000))))


(provide 'pythagorean-triplet-test)
;;; pythagorean-triplet-test.el ends here
