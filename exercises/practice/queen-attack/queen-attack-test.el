;;; queen-attack-test.el --- Queen Attack (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "queen-attack.el")
(declare-function valid-position-p "queen-attack.el" (queen))
(declare-function can-attack-p "queen-attack.el"
                  (white-queen black-queen))


(ert-deftest queen-with-a-valid-position ()
  (should (valid-position-p '(2 . 2))))


(ert-deftest queen-must-have-positive-row ()
  (should (not (valid-position-p '(-2 . 2)))))


(ert-deftest queen-must-have-row-on-board ()
  (should (not (valid-position-p '(8 . 4)))))


(ert-deftest queen-must-have-positive-column ()
  (should (not (valid-position-p '(2 . -2)))))


(ert-deftest queen-must-have-column-on-board ()
  (should (not (valid-position-p '(4 . 8)))))


(ert-deftest cannot-attack ()
  (should (not (can-attack-p '(2 . 4) '(6 . 6)))))


(ert-deftest can-attack-on-same-row ()
  (should (can-attack-p '(2 . 4) '(2 . 6))))


(ert-deftest can-attack-on-same-column ()
  (should (can-attack-p '(4 . 5) '(2 . 5))))


(ert-deftest can-attack-on-first-diagonal ()
  (should (can-attack-p '(2 . 2) '(0 . 4))))


(ert-deftest can-attack-on-second-diagonal ()
  (should (can-attack-p '(2 . 2) '(3 . 1))))


(ert-deftest can-attack-on-third-diagonal ()
  (should (can-attack-p '(2 . 2) '(1 . 1))))


(ert-deftest can-attack-on-fourth-diagonal ()
  (should (can-attack-p '(1 . 7) '(0 . 6))))


(ert-deftest
    cannot-attack-if-falling-diagonals-are-only-the-same-when-reflected-across-the-longest-falling-diagonal
    ()
  (should (not (can-attack-p '(4 . 1) '(2 . 5)))))


(provide 'queen-attack-test)
;;; queen-attack-test.el ends here
