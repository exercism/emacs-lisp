;;; series-test.el --- Tests for Series (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "series.el")
(declare-function slices "series.el" (series slice-length))


(ert-deftest slices-of-one-from-one ()
  (should (equal '("1") (slices "1" 1))))


(ert-deftest slices-of-one-from-two ()
  (should (equal '("1" "2") (slices "12" 1))))


(ert-deftest slices-of-two ()
  (should (equal '("35") (slices "35" 2))))


(ert-deftest slices-of-two-overlap ()
  (should (equal '("91" "14" "42") (slices "9142" 2))))


(ert-deftest slices-can-include-duplicates ()
  (should (equal '("777" "777" "777" "777") (slices "777777" 3))))


(ert-deftest slices-of-a-long-series ()
  (should (equal '("91849"
                   "18493"
                   "84939"
                   "49390"
                   "93904"
                   "39042"
                   "90424"
                   "04243")
                 (slices "918493904243" 5))))


(ert-deftest slice-length-is-too-large ()
  (should-error (slices "12345" 6)))


(ert-deftest slice-length-is-way-too-large ()
  (should-error (slices "12345" 42)))


(ert-deftest slice-length-cannot-be-zero ()
  (should-error (slices "12345" 0)))


(ert-deftest slice-length-cannot-be-negative ()
  (should-error (slices "123" -1)))


(ert-deftest empty-series-is-invalid ()
  (should-error (slices "" 1)))


(provide 'series-test)
;;; series-test.el ends here
