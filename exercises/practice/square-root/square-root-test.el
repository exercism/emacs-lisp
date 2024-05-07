;;; square-root-test.el --- Tests for Square Root (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(load-file "square-root.el")
(declare-function square-root "square-root.el" (radicand))


(ert-deftest root-of-1 ()
  (should (= 1 (square-root 1))))


(ert-deftest root-of-4 ()
  (should (= 2 (square-root 4))))


(ert-deftest root-of-25 ()
  (should (= 5 (square-root 25))))


(ert-deftest root-of-81 ()
  (should (= 9 (square-root 81))))


(ert-deftest root-of-196 ()
  (should (= 14 (square-root 196))))


(ert-deftest root-of-65025 ()
  (should (= 255 (square-root 65025))))


(provide 'square-root-test)
;;; square-root-test.el ends here
