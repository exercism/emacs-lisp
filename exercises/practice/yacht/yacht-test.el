;;; yacht-test.el --- Yacht (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "yacht.el")
(declare-function score "yacht.el" (scores category))


(ert-deftest yacht ()
  (should (equal (score '(5 5 5 5 5) :yacht) 50)))


(ert-deftest not-yacht ()
  (should (equal (score '(1 3 3 2 5) :yacht) 0)))


(ert-deftest ones ()
  (should (equal (score '(1 1 1 3 5) :ones) 3)))


(ert-deftest ones-out-of-order ()
  (should (equal (score '(3 1 1 5 1) :ones) 3)))


(ert-deftest no-ones ()
  (should (equal (score '(4 3 6 5 5) :ones) 0)))


(ert-deftest twos ()
  (should (equal (score '(2 3 4 5 6) :twos) 2)))


(ert-deftest fours ()
  (should (equal (score '(1 4 1 4 1) :fours) 8)))


(ert-deftest yacht-counted-as-threes ()
  (should (equal (score '(3 3 3 3 3) :threes) 15)))


(ert-deftest yacht-of-3s-counted-as-fives ()
  (should (equal (score '(3 3 3 3 3) :fives) 0)))


(ert-deftest fives ()
  (should (equal (score '(1 5 3 5 3) :fives) 10)))


(ert-deftest sixes ()
  (should (equal (score '(2 3 4 5 6) :sixes) 6)))


(ert-deftest full-house-two-small-three-big ()
  (should (equal (score '(2 2 4 4 4) :full-house) 16)))


(ert-deftest full-house-three-small-two-big ()
  (should (equal (score '(5 3 3 5 3) :full-house) 19)))


(ert-deftest two-pair-is-not-a-full-house ()
  (should (equal (score '(2 2 4 4 5) :full-house) 0)))


(ert-deftest four-of-a-kind-is-not-a-full-house ()
  (should (equal (score '(1 4 4 4 4) :full-house) 0)))


(ert-deftest yacht-is-not-a-full-house ()
  (should (equal (score '(2 2 2 2 2) :full-house) 0)))


(ert-deftest four-of-a-kind ()
  (should (equal (score '(6 6 4 6 6) :four-of-a-kind) 24)))


(ert-deftest yacht-can-be-scored-as-four-of-a-kind ()
  (should (equal (score '(3 3 3 3 3 ) :four-of-a-kind) 12)))


(ert-deftest full-house-is-not-four-of-a-kind ()
  (should (equal (score '(3 3 3 5 5) :four-of-a-kind) 0)))


(ert-deftest little-straight ()
  (should (equal (score '(3 5 4 1 2) :little-straight) 30)))


(ert-deftest little-straight-as-big-straight ()
  (should (equal (score '(1 2 3 4 5) :big-straight) 0)))


(ert-deftest four-in-order-but-not-a-little-straight ()
  (should (equal (score '(1 1 2 3 4) :little-straight) 0)))


(ert-deftest no-pairs-but-not-a-little-straight ()
  (should (equal (score '(1 2 3 4 6) :little-straight) 0)))


(ert-deftest minimum-is-1-maximum-is-5-but-not-a-little-straight ()
  (should (equal (score '(1 1 3 4 5) :little-straight) 0)))


(ert-deftest big-straight ()
  (should (equal (score '(4 6 2 5 3) :big-straight) 30)))


(ert-deftest big-straight-as-little-straight ()
  (should (equal (score '(6 5 4 3 2) :little-straight) 0)))


(ert-deftest no-pairs-but-not-a-big-straight ()
  (should (equal (score '(6 5 4 3 1) :big-straight) 0)))


(ert-deftest choice ()
  (should (equal (score '(3 3 5 6 6) :choice) 23)))


(ert-deftest yacht-as-choice ()
  (should (equal (score '(2 2 2 2 2) :choice) 10)))


(provide 'yacht-test)
;;; yacht-test.el ends here
