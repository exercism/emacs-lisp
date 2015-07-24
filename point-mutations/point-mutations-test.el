;;; point-mutations-test.el --- Tests for point-mutations (exercism)

;;; Commentary:

;;; Code:

(load-file "point-mutations.el")

(ert-deftest no-difference-between-empty-strands ()
  (should (= 0 (hamming-distance "" ""))))

(ert-deftest no-difference-between-identical-strands ()
  (should (= 0 (hamming-distance "GATTACA" "GATTACA"))))

(ert-deftest complete-hamming-distance-in-small-strand ()
  (should (= 3 (hamming-distance "ACT" "GGA"))))

(ert-deftest small-hamming-distance-in-middle-somwhere ()
  (should (= 1 (hamming-distance "GGACG" "GGTCG"))))

(ert-deftest larger-distance ()
  (should (= 2 (hamming-distance "ACCAGGG" "ACTATGG"))))

(ert-deftest invalid-to-get-distance-for-different-length-strings ()
  (should-error (hamming-distance "AGACAACAGCCAGCCGCCGGATT" "AGGCAA"))
  (should-error (hamming-distance
                 "AGACAACAGCCAGCCGCCGGATT" "AGACATCTTTCAGCCGCCGGATTAGGCAA"))
  (should-error (hamming-distance "AGG" "CATCATCATCATCATGAT")))


(provide 'point-mutations-test)
;;; point-mutations-test.el ends here
