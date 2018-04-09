;;; hamming-test.el --- Tests for hamming (exercism)

;;; Commentary:
;; Common test data version: 2.0.1 f79dfd7

;;; Code:

(load-file "hamming.el")

(declare-function hamming-distance "hamming.el")

(ert-deftest empty-strands ()
  (should (= 0 (hamming-distance "" ""))))

(ert-deftest identical-strands ()
  (should (= 0 (hamming-distance "A" "A"))))

(ert-deftest long-identical-strands ()
  (should (= 0 (hamming-distance "GGACTGA" "GGACTGA"))))

(ert-deftest complete-distance-in-single-nucleotide-strands ()
  (should (= 1 (hamming-distance "A" "G"))))

(ert-deftest complete-distance-in-small-strands ()
  (should (= 2 (hamming-distance "AG" "CT"))))

(ert-deftest small-distance-in-small-strands ()
  (should (= 1 (hamming-distance "AT" "CT"))))

(ert-deftest small-distance ()
  (should (= 1 (hamming-distance "GGACG" "GGTCG"))))

(ert-deftest small-distance-in-long-strands ()
  (should (= 2 (hamming-distance "ACCAGGG" "ACTATGG"))))

(ert-deftest non-unique-character-in-first-strand ()
  (should (= 1 (hamming-distance "AAA" "AAG"))))

(ert-deftest same-nucleotides-in-different-positions ()
  (should (= 2 (hamming-distance "TAG" "GAT"))))

(ert-deftest large-distance ()
  (should (= 4 (hamming-distance "GATACA" "GCATAA"))))

(ert-deftest large-distance-in-off-by-one-strand ()
  (should (= 9 (hamming-distance "GGACGGATTCTG" "AGGACGGATTCT"))))

(ert-deftest disallow-first-strand-longer ()
  (should-error (hamming-distance "AATG" "AAA")))

(ert-deftest disallow-second-strand-longer ()
  (should-error (hamming-distance "ATA" "AGTG")))

(provide 'hamming-test)
;;; hamming-test.el ends here
