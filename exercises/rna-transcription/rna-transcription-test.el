;;; rna-transcription-test.el --- Tests for RNA Transcription (exercism)

;;; Commentary:


;;; Code:

(require 'cl)

(load-file "rna-transcription.el")

(ert-deftest transcribes-cytosine-to-guanine ()
  (should (string= "G" (to-rna "C"))))

(ert-deftest transcribes-guanine-to-cytosine ()
  (should (string= "C" (to-rna "G"))))

(ert-deftest transcribes-adenine-to-uracil ()
  (should (string= "U" (to-rna "A"))))

(ert-deftest transcribes-thymine-to-adenine ()
  (should (string= "A" (to-rna "T"))))

(ert-deftest it-transcribes-all-nucleotides ()
  (should (string= "UGCACCAGAAUU"
                   (to-rna "ACGTGGTCTTAA"))))

(ert-deftest it-validates-dna-strands ()
  (should-error (to-rna "XCGFGGTDTTAA")))

(provide 'rna-transcription-test)
;;; rna-transcription-test.el ends here
