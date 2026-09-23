;;; rectangles-test.el --- Tests for Rectangles (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "rectangles.el")
(declare-function rectangles "rectangles.el" (strings))


(ert-deftest no-rows ()
  (should (= 0
             (rectangles '()))))


(ert-deftest no-columns ()
  (should (= 0
             (rectangles '("")))))


(ert-deftest no-rectangles ()
  (should (= 0
             (rectangles '(" ")))))


(ert-deftest one-rectangle ()
  (should (= 1
             (rectangles '("+-+"
                           "| |"
                           "+-+")))))


(ert-deftest two-rectangles-without-shared-parts ()
  (should (= 2
             (rectangles '("  +-+"
                           "  | |"
                           "+-+-+"
                           "| |  "
                           "+-+  ")))))


(ert-deftest five-rectangles-with-shared-parts ()
  (should (= 5
             (rectangles '("  +-+"
                           "  | |"
                           "+-+-+"
                           "| | |"
                           "+-+-+")))))


(ert-deftest rectangle-of-height-1-is-counted ()
  (should (= 1
             (rectangles '("+--+"
                           "+--+")))))


(ert-deftest rectangle-of-width-1-is-counted ()
  (should (= 1
             (rectangles '("++"
                           "||"
                           "++")))))


(ert-deftest 1x1-square-is-counted ()
  (should (= 1
             (rectangles '("++"
                           "++")))))


(ert-deftest only-complete-rectangles-are-counted ()
  (should (= 1
             (rectangles '("  +-+"
                           "    |"
                           "+-+-+"
                           "| | -"
                           "+-+-+")))))


(ert-deftest rectangles-can-be-of-different-sizes ()
  (should (= 3
             (rectangles '("+------+----+"
                           "|      |    |"
                           "+---+--+    |"
                           "|   |       |"
                           "+---+-------+")))))


(ert-deftest corner-is-required-for-a-rectangle-to-be-complete ()
  (should (= 2
             (rectangles '("+------+----+"
                           "|      |    |"
                           "+------+    |"
                           "|   |       |"
                           "+---+-------+")))))


(ert-deftest large-input-with-many-rectangles ()
  (should (= 60
             (rectangles '("+---+--+----+"
                           "|   +--+----+"
                           "+---+--+    |"
                           "|   +--+----+"
                           "+---+--+--+-+"
                           "+---+--+--+-+"
                           "+------+  | |"
                           "          +-+")))))


(ert-deftest rectangles-must-have-four-sides ()
  (should (= 5
             (rectangles '("+-+ +-+"
                           "| | | |"
                           "+-+-+-+"
                           "  | |  "
                           "+-+-+-+"
                           "| | | |"
                           "+-+ +-+")))))


(ert-deftest very-large-input ()
  (should (= 2063
             (rectangles '("      +-----+--------+    +-----+ "
                           "++---++-----+--------+---++-----++"
                           "||+--++-----+-+-++   |   ||     ||"
                           "|||  ||     +-+-++-+ |   ||     ||"
                           "|||  ||     | | || | |   ||     ||"
                           "||| +++-----+-+-++-+-+---++-+   ||"
                           "||| |||     | | || | |+--++-+-+ ||"
                           "||| +++---+-+-+-++-+-++--++-+ | ||"
                           "||| |||+--+-+-+-+| | |+--++---+ ||"
                           "||| ||||  | | | || | |+-+||     ||"
                           "||+-++++--+-+++-++-+-++-+++---++||"
                           "||  |+++--+-+++-+--+-+| |||   ||||"
                           "+++-+++++---++--+-++-++-+++---+|||"
                           " |+-+++++---++--+ || || |||   ||||"
                           " |  +++++---++--+-++-++-++++  ||||"
                           " |   ||||   |+----++-++-++++--+++|"
                           " |   |+++---+|    || || ||    || |"
                           "+++  |||+---++----+| || ||    || |"
                           "|||  +++----++----++-++-++----++-+"
                           "+++---++----++-----+-++-++----++  "
                           "                      +-+         ")))))


(provide 'rectangles-test)
;;; rectangles-test.el ends here
