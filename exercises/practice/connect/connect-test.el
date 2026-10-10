;;; connect-test.el --- Tests for Connect (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "connect.el")
(declare-function winner "connect.el" (board))


(ert-deftest an-empty-board-has-no-winner ()
  (should (equal ""
            (winner [". . . . ."
                     " . . . . ."
                     "  . . . . ."
                     "   . . . . ."
                     "    . . . . ."]))))


(ert-deftest x-can-win-on-a-1x1-board ()
  (should (equal "X"
            (winner ["X"]))))


(ert-deftest o-can-win-on-a-1x1-board ()
  (should (equal "O"
            (winner ["O"]))))


(ert-deftest only-edges-does-not-make-a-winner ()
  (should (equal ""
            (winner ["O O O X"
                     " X . . X"
                     "  X . . X"
                     "   X O O O"]))))


(ert-deftest illegal-diagonal-does-not-make-a-winner ()
  (should (equal ""
            (winner ["X O . ."
                     " O X X X"
                     "  O X O ."
                     "   . O X ."
                     "    X X O O"]))))


(ert-deftest nobody-wins-crossing-adjacent-angles ()
  (should (equal ""
            (winner ["X . . ."
                     " . X O ."
                     "  O . X O"
                     "   . O . X"
                     "    . . O ."]))))


(ert-deftest x-wins-crossing-from-left-to-right ()
  (should (equal "X"
            (winner [". O . ."
                     " O X X X"
                     "  O X O ."
                     "   X X O X"
                     "    . O X ."]))))


(ert-deftest x-wins-with-left-hand-dead-end-fork ()
  (should (equal "X"
            (winner [". . X ."
                     " X X . ."
                     "  . X X X"
                     "   O O O O"]))))


(ert-deftest x-wins-with-right-hand-dead-end-fork ()
  (should (equal "X"
            (winner [". . X X"
                     " X X . ."
                     "  . X X ."
                     "   O O O O"]))))


(ert-deftest o-wins-crossing-from-top-to-bottom ()
  (should (equal "O"
            (winner [". O . ."
                     " O X X X"
                     "  O O O ."
                     "   X X O X"
                     "    . O X ."]))))


(ert-deftest x-wins-using-a-convoluted-path ()
  (should (equal "X"
            (winner [". X X . ."
                     " X . X . X"
                     "  . X . X ."
                     "   . X X . ."
                     "    O O O O O"]))))


(ert-deftest x-wins-using-a-spiral-path ()
  (should (equal "X"
            (winner ["O X X X X X X X X"
                     " O X O O O O O O O"
                     "  O X O X X X X X O"
                     "   O X O X O O O X O"
                     "    O X O X X X O X O"
                     "     O X O O O X O X O"
                     "      O X X X X X O X O"
                     "       O O O O O O O X O"
                     "        X X X X X X X X O"]))))


(provide 'connect-test)
;;; connect-test.el ends here
