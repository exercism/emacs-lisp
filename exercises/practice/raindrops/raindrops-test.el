;;; raindrops-test.el --- Tests for Raindrops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "raindrops.el")
(declare-function convert "raindrops.el" (n))


(ert-deftest the-sound-for-1-is-1 ()
  (should (string= (convert 1) "1")))


(ert-deftest the-sound-for-3-is-Pling ()
  (should (string= (convert 3) "Pling")))


(ert-deftest the-sound-for-5-is-Plang ()
  (should (string= (convert 5) "Plang")))


(ert-deftest the-sound-for-7-is-Plong ()
  (should (string= (convert 7) "Plong")))


(ert-deftest the-sound-for-6-is-Pling ()
  (should (string= (convert 6) "Pling" )))


(ert-deftest the-sound-for-8-is-8 ()
  (should (string= (convert 8) "8")))


(ert-deftest the-sound-for-9-is-Pling ()
  (should (string= (convert 9) "Pling" )))


(ert-deftest the-sound-for-10-is-Plang ()
  (should (string= (convert 10) "Plang")))


(ert-deftest the-sound-for-14-is-Plong ()
  (should (string= (convert 14) "Plong")))


(ert-deftest the-sound-for-15-is-PlingPlong ()
  (should (string= (convert 15) "PlingPlang")))


(ert-deftest the-sound-for-21-is-PlingPlong ()
  (should (string= (convert 21) "PlingPlong")))


(ert-deftest the-sound-for-25-is-Plang ()
  (should (string= (convert 25) "Plang")))


(ert-deftest the-sound-for-27-is-Pling ()
  (should (string= (convert 27) "Pling")))


(ert-deftest the-sound-for-35-is-PlangPlong ()
  (should (string= (convert 35) "PlangPlong")))


(ert-deftest the-sound-for-49-is-Plong ()
  (should (string= (convert 49) "Plong")))


(ert-deftest the-sound-for-52-is-52 ()
  (should (string= (convert 52) "52")))


(ert-deftest the-sound-for-105-is-PlingPlangPlong ()
  (should (string= (convert 105) "PlingPlangPlong")))


(ert-deftest the-sound-for-3125-is-Plang ()
  (should (string= (convert 3125) "Plang")))


(provide 'raindrops-test)
;;; raindrops-test.el ends here
