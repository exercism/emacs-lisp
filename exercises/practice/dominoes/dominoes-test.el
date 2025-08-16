;;; dominoes-test.el --- Tests for Dominoes (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "dominoes.el")
(declare-function can-chain "dominoes.el" (dominoes))


(ert-deftest empty-input-=-empty-output ()
  (should (can-chain [])))


(ert-deftest singleton-input-=-singleton-output ()
  (should (can-chain [(1 . 1)])))


(ert-deftest singleton-that-cant-be-chained ()
  (should-not (can-chain [(1 . 2)])))


(ert-deftest three-elements ()
  (should (can-chain [(1 . 2) (3 . 1) (2 . 3)])))


(ert-deftest can-reverse-dominoes ()
  (should (can-chain [(1 . 2) (1 . 3) (2 . 3)])))


(ert-deftest cant-be-chained ()
  (should-not (can-chain [(1 . 2) (4 . 1) (2 . 3)])))


(ert-deftest disconnected---simple ()
  (should-not (can-chain [(1 . 1) (2 . 2)])))


(ert-deftest disconnected---double-loop ()
  (should-not (can-chain [(1 . 2) (2 . 1) (3 . 4) (4 . 3)])))


(ert-deftest disconnected---single-isolated ()
  (should-not (can-chain [(1 . 2) (2 . 3) (3 . 1) (4 . 4)])))


(ert-deftest need-backtrack ()
  (should (can-chain [(1 . 2) (2 . 3) (3 . 1) (2 . 4) (2 . 4)])))


(ert-deftest separate-loops ()
  (should (can-chain [(1 . 2) (2 . 3) (3 . 1) (1 . 1) (2 . 2) (3 . 3)])))


(ert-deftest nine-elements ()
  (should (can-chain [(1 . 2) (5 . 3) (3 . 1) (1 . 2) (2 . 4) (1 . 6) (2 . 3) (3 . 4) (5 . 6)])))


(ert-deftest separate-three-domino-loops ()
  (should-not (can-chain [(1 . 2) (2 . 3) (3 . 1) (4 . 5) (5 . 6) (6 . 4)])))


(provide 'dominoes-test)
;;; dominoes-test.el ends here
