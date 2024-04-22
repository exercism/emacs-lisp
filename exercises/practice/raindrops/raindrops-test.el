;;; raindrops-test.el --- Tests for Raindrops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "raindrops.el")
(declare-function convert "raindrops.el" (n))


(ert-deftest the-sound-for-1-is-1 ()
  (should (string= "1" (convert 1))))


(ert-deftest the-sound-for-3-is-Pling ()
  (should (string= "Pling" (convert 3))))


(ert-deftest the-sound-for-5-is-Plang ()
  (should (string= "Plang" (convert 5))))


(ert-deftest the-sound-for-7-is-Plong ()
  (should (string= "Plong" (convert 7))))


(ert-deftest the-sound-for-6-is-Pling ()
  (should (string= "Pling" (convert 6))))


(ert-deftest the-sound-for-8-is-8 ()
  (should (string= "8" (convert 8))))


(ert-deftest the-sound-for-9-is-Pling ()
  (should (string= "Pling" (convert 9))))


(ert-deftest the-sound-for-10-is-Plang ()
  (should (string= "Plang" (convert 10))))


(ert-deftest the-sound-for-14-is-Plong ()
  (should (string= "Plong" (convert 14))))


(ert-deftest the-sound-for-15-is-PlingPlong ()
  (should (string= "PlingPlang" (convert 15))))


(ert-deftest the-sound-for-21-is-PlingPlong ()
  (should (string= "PlingPlong" (convert 21))))


(ert-deftest the-sound-for-25-is-Plang ()
  (should (string= "Plang" (convert 25))))


(ert-deftest the-sound-for-27-is-Pling ()
  (should (string= "Pling" (convert 27))))


(ert-deftest the-sound-for-35-is-PlangPlong ()
  (should (string= "PlangPlong" (convert 35))))


(ert-deftest the-sound-for-49-is-Plong ()
  (should (string= "Plong" (convert 49))))


(ert-deftest the-sound-for-52-is-52 ()
  (should (string= "52" (convert 52))))


(ert-deftest the-sound-for-105-is-PlingPlangPlong ()
  (should (string= "PlingPlangPlong" (convert 105))))


(ert-deftest the-sound-for-3125-is-Plang ()
  (should (string= "Plang" (convert 3125))))


(provide 'raindrops-test)
;;; raindrops-test.el ends here
