;;; isbn-verifier-test.el --- Tests for Isbn Verifier (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "isbn-verifier.el")
(declare-function validp "isbn-verifier.el" (isbn))


(ert-deftest valid-isbn ()
  (should (validp "3-598-21508-8")))


(ert-deftest invalid-isbn-check-digit ()
  (should-not (validp "3-598-21508-9")))


(ert-deftest valid-isbn-with-a-check-digit-of-10 ()
  (should (validp "3-598-21507-X")))


(ert-deftest check-digit-is-a-character-other-than-x ()
  (should-not (validp "3-598-21507-A")))


(ert-deftest invalid-check-digit-in-isbn-is-not-treated-as-zero ()
  (should-not (validp "4-598-21507-B")))


(ert-deftest invalid-character-in-isbn-is-not-treated-as-zero ()
  (should-not (validp "3-598-P1581-X")))


(ert-deftest x-is-only-valid-as-a-check-digit ()
  (should-not (validp "3-598-2X507-9")))


(ert-deftest valid-isbn-without-separating-dashes ()
  (should (validp "3598215088")))


(ert-deftest isbn-without-separating-dashes-and-x-as-check-digit ()
  (should (validp "359821507X")))


(ert-deftest isbn-without-check-digit-and-dashes ()
  (should-not (validp "359821507")))


(ert-deftest too-long-isbn-and-no-dashes ()
  (should-not (validp "3598215078X")))


(ert-deftest too-short-isbn ()
  (should-not (validp "00")))


(ert-deftest isbn-without-check-digit ()
  (should-not (validp "3-598-21507")))


(ert-deftest check-digit-of-x-should-not-be-used-for-0 ()
  (should-not (validp "3-598-21515-X")))


(ert-deftest empty-isbn ()
  (should-not (validp "")))


(ert-deftest input-is-9-characters ()
  (should-not (validp "134456729")))


(ert-deftest invalid-characters-are-not-ignored-after-checking-length ()
  (should-not (validp "3132P34035")))


(ert-deftest invalid-characters-are-not-ignored-before-checking-length ()
  (should-not (validp "3598P215088")))


(ert-deftest input-is-too-long-but-contains-a-valid-isbn ()
  (should-not (validp "98245726788")))


(provide 'isbn-verifier-test)
;;; isbn-verifier-test.el ends here
