;;; hamming-test.el --- Hamming (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "hamming.el")
(declare-function hamming-distance "hamming.el" (dna1 dna2))


(ert-deftest empty-strands ()
  (should (= 0 (hamming-distance "" ""))))


(ert-deftest single-letter-identical-strands ()
  (should (= 0 (hamming-distance "A" "A"))))


(ert-deftest single-letter-different-strands ()
  (should (= 1 (hamming-distance "G" "T"))))


(ert-deftest long-identical-strands ()
  (should (= 0 (hamming-distance "GGACTGAAATCTG" "GGACTGAAATCTG"))))

(ert-deftest long-different-strands ()
  (should (= 9 (hamming-distance "GGACGGATTCTG" "AGGACGGATTCT"))))


(ert-deftest disallow-first-strand-longer ()
  (should-error (hamming-distance "AATG" "AAA")))


(ert-deftest disallow-second-strand-longer ()
  (should-error (hamming-distance "ATA" "AGTG")))


(ert-deftest disallow-empty-first-strand ()
  (should-error (hamming-distance "" "G")))



(ert-deftest disallow-empty-second-strand ()
  (should-error (hamming-distance "G" "")))


(provide 'hamming-test)
;;; hamming-test.el ends here

