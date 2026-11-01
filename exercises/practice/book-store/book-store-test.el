;;; book-store-test.el --- Tests for Book Store (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "book-store.el")
(declare-function total "book-store.el" (basket))


(ert-deftest only-a-single-book ()
  (should (= 800 (total '(1)))))


(ert-deftest two-of-the-same-book ()
  (should (= 1600 (total '(2 2)))))


(ert-deftest empty-basket ()
  (should (= 0 (total '()))))


(ert-deftest two-different-books ()
  (should (= 1520 (total '(1 2)))))


(ert-deftest three-different-books ()
  (should (= 2160 (total '(1 2 3)))))


(ert-deftest four-different-books ()
  (should (= 2560 (total '(1 2 3 4)))))


(ert-deftest five-different-books ()
  (should (= 3000 (total '(1 2 3 4 5)))))


(ert-deftest two-groups-of-four-is-cheaper-than-group-of-five-plus-group-of-three ()
  (should (= 5120 (total '(1 1 2 2 3 3 4 5)))))


(ert-deftest two-groups-of-four-is-cheaper-than-groups-of-five-and-three ()
  (should (= 5120 (total '(1 1 2 3 4 4 5 5)))))


(ert-deftest group-of-four-plus-group-of-two-is-cheaper-than-two-groups-of-three ()
  (should (= 4080 (total '(1 1 2 2 3 4)))))


(ert-deftest two-each-of-first-four-books-and-one-copy-each-of-rest ()
  (should (= 5560 (total '(1 1 2 2 3 3 4 4 5)))))


(ert-deftest two-copies-of-each-book ()
  (should (= 6000 (total '(1 1 2 2 3 3 4 4 5 5)))))


(ert-deftest three-copies-of-first-book-and-two-each-of-remaining ()
  (should (= 6800 (total '(1 1 2 2 3 3 4 4 5 5 1)))))


(ert-deftest three-each-of-first-two-books-and-two-each-of-remaining-books ()
  (should (= 7520 (total '(1 1 2 2 3 3 4 4 5 5 1 2)))))


(ert-deftest four-groups-of-four-are-cheaper-than-two-groups-each-of-five-and-three ()
  (should (= 10240 (total '(1 1 2 2 3 3 4 5 1 1 2 2 3 3 4 5)))))


(ert-deftest
    check-that-groups-of-four-are-created-properly-even-when-there-are-more-groups-of-three-than-groups-of-five
    ()
  (should (= 14560 (total '(1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3 3 4 4 5 5)))))


(ert-deftest one-group-of-one-and-four-is-cheaper-than-one-group-of-two-and-three ()
  (should (= 3360 (total '(1 1 2 3 4)))))


(ert-deftest
    one-group-of-one-and-two-plus-three-groups-of-four-is-cheaper-than-one-group-of-each-size
    ()
  (should (= 10000 (total '(1 2 2 3 3 3 4 4 4 4 5 5 5 5 5)))))


(provide 'book-store-test)
;;; book-store-test.el ends here
