;;; secret-handshake-test.el --- Tests for Secret Handshake (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "secret-handshake.el")
(declare-function commands "secret-handshake.el" (number))


(ert-deftest wink-for-1 ()
  (should (equal '("wink") (commands 1))))


(ert-deftest double-blink-for-10 ()
  (should (equal '("double blink") (commands 2))))


(ert-deftest close-your-eyes-for-100 ()
  (should (equal '("close your eyes") (commands 4))))


(ert-deftest jump-for-1000 ()
  (should (equal '("jump") (commands 8))))


(ert-deftest combine-two-actions ()
  (should (equal '("wink" "double blink") (commands 3))))


(ert-deftest reverse-two-actions ()
  (should (equal '("double blink" "wink") (commands 19))))


(ert-deftest reversing-one-action-gives-the-same-action ()
  (should (equal '("jump") (commands 24))))


(ert-deftest reversing-no-actions-still-gives-no-actions ()
  (should (equal '() (commands 16))))


(ert-deftest all-possible-actions ()
  (should (equal '("wink" "double blink" "close your eyes" "jump") (commands 15))))


(ert-deftest reverse-all-possible-actions ()
  (should (equal '("jump" "close your eyes" "double blink" "wink") (commands 31))))


(ert-deftest do-nothing-for-zero ()
  (should (equal '() (commands 0))))


(provide 'secret-handshake-test)
;;; secret-handshake-test.el ends here
