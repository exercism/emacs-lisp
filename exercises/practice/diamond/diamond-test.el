;;; diamond-test.el --- Tests for Diamond (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "diamond.el")
(declare-function rows "diamond.el" (letter))


(ert-deftest degenerate-case-with-a-single-a-row ()
  (should (equal ["A"] (rows ?A))))


(ert-deftest degenerate-case-with-no-row-containing-3-distinct-groups-of-spaces ()
  (should (equal [" A "
                  "B B"
                  " A "] (rows ?B))))


(ert-deftest smallest-non-degenerate-case-with-odd-diamond-side-length ()
  (should (equal ["  A  "
                  " B B "
                  "C   C"
                  " B B "
                  "  A  "] (rows ?C))))


(ert-deftest smallest-non-degenerate-case-with-even-diamond-side-length ()
  (should (equal ["   A   "
                  "  B B  "
                  " C   C "
                  "D     D"
                  " C   C "
                  "  B B  "
                  "   A   "] (rows ?D))))


(ert-deftest largest-possible-diamond ()
  (should (equal ["                         A                         "
                  "                        B B                        "
                  "                       C   C                       "
                  "                      D     D                      "
                  "                     E       E                     "
                  "                    F         F                    "
                  "                   G           G                   "
                  "                  H             H                  "
                  "                 I               I                 "
                  "                J                 J                "
                  "               K                   K               "
                  "              L                     L              "
                  "             M                       M             "
                  "            N                         N            "
                  "           O                           O           "
                  "          P                             P          "
                  "         Q                               Q         "
                  "        R                                 R        "
                  "       S                                   S       "
                  "      T                                     T      "
                  "     U                                       U     "
                  "    V                                         V    "
                  "   W                                           W   "
                  "  X                                             X  "
                  " Y                                               Y "
                  "Z                                                 Z"
                  " Y                                               Y "
                  "  X                                             X  "
                  "   W                                           W   "
                  "    V                                         V    "
                  "     U                                       U     "
                  "      T                                     T      "
                  "       S                                   S       "
                  "        R                                 R        "
                  "         Q                               Q         "
                  "          P                             P          "
                  "           O                           O           "
                  "            N                         N            "
                  "             M                       M             "
                  "              L                     L              "
                  "               K                   K               "
                  "                J                 J                "
                  "                 I               I                 "
                  "                  H             H                  "
                  "                   G           G                   "
                  "                    F         F                    "
                  "                     E       E                     "
                  "                      D     D                      "
                  "                       C   C                       "
                  "                        B B                        "
                  "                         A                         "] (rows ?Z))))


(provide 'diamond-test)
;;; diamond-test.el ends here
