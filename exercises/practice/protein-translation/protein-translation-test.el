;;; protein-translation-test.el --- Tests for Protein Translation (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "protein-translation.el")
(declare-function proteins "protein-translation.el" (strand))


(ert-deftest empty-rna-sequence-results-in-no-proteins ()
  (should (equal '()
            (proteins ""))))


(ert-deftest methionine-rna-sequence ()
  (should (equal '("Methionine")
            (proteins "AUG"))))


(ert-deftest phenylalanine-rna-sequence-1 ()
  (should (equal '("Phenylalanine")
            (proteins "UUU"))))


(ert-deftest phenylalanine-rna-sequence-2 ()
  (should (equal '("Phenylalanine")
            (proteins "UUC"))))


(ert-deftest leucine-rna-sequence-1 ()
  (should (equal '("Leucine")
            (proteins "UUA"))))


(ert-deftest leucine-rna-sequence-2 ()
  (should (equal '("Leucine")
            (proteins "UUG"))))


(ert-deftest serine-rna-sequence-1 ()
  (should (equal '("Serine")
            (proteins "UCU"))))


(ert-deftest serine-rna-sequence-2 ()
  (should (equal '("Serine")
            (proteins "UCC"))))


(ert-deftest serine-rna-sequence-3 ()
  (should (equal '("Serine")
            (proteins "UCA"))))


(ert-deftest serine-rna-sequence-4 ()
  (should (equal '("Serine")
            (proteins "UCG"))))


(ert-deftest tyrosine-rna-sequence-1 ()
  (should (equal '("Tyrosine")
            (proteins "UAU"))))


(ert-deftest tyrosine-rna-sequence-2 ()
  (should (equal '("Tyrosine")
            (proteins "UAC"))))


(ert-deftest cysteine-rna-sequence-1 ()
  (should (equal '("Cysteine")
            (proteins "UGU"))))


(ert-deftest cysteine-rna-sequence-2 ()
  (should (equal '("Cysteine")
            (proteins "UGC"))))


(ert-deftest tryptophan-rna-sequence ()
  (should (equal '("Tryptophan")
            (proteins "UGG"))))


(ert-deftest stop-codon-rna-sequence-1 ()
  (should (equal '()
            (proteins "UAA"))))


(ert-deftest stop-codon-rna-sequence-2 ()
  (should (equal '()
            (proteins "UAG"))))


(ert-deftest stop-codon-rna-sequence-3 ()
  (should (equal '()
            (proteins "UGA"))))


(ert-deftest sequence-of-two-protein-codons-translates-into-proteins ()
  (should (equal '("Phenylalanine" "Phenylalanine")
            (proteins "UUUUUU"))))


(ert-deftest sequence-of-two-different-protein-codons-translates-into-proteins ()
  (should (equal '("Leucine" "Leucine")
            (proteins "UUAUUG"))))


(ert-deftest translate-rna-strand-into-correct-protein-list ()
  (should (equal '("Methionine" "Phenylalanine" "Tryptophan")
            (proteins "AUGUUUUGG"))))


(ert-deftest translation-stops-if-stop-codon-at-beginning-of-sequence ()
  (should (equal '()
            (proteins "UAGUGG"))))


(ert-deftest translation-stops-if-stop-codon-at-end-of-two-codon-sequence ()
  (should (equal '("Tryptophan")
            (proteins "UGGUAG"))))


(ert-deftest translation-stops-if-stop-codon-at-end-of-three-codon-sequence ()
  (should (equal '("Methionine" "Phenylalanine")
            (proteins "AUGUUUUAA"))))


(ert-deftest translation-stops-if-stop-codon-in-middle-of-three-codon-sequence ()
  (should (equal '("Tryptophan")
            (proteins "UGGUAGUGG"))))


(ert-deftest translation-stops-if-stop-codon-in-middle-of-six-codon-sequence ()
  (should (equal '("Tryptophan" "Cysteine" "Tyrosine")
            (proteins "UGGUGUUAUUAAUGGUUU"))))


(ert-deftest unknown-amino-acids-not-part-of-a-codon-cant-translate ()
  (should-error (proteins "XYZ")))


(ert-deftest incomplete-rna-sequence-cant-translate ()
  (should-error (proteins "AUGU")))


(ert-deftest incomplete-rna-sequence-can-translate-if-valid-until-a-stop-codon ()
  (should (equal '("Phenylalanine" "Phenylalanine")
            (proteins "UUCUUCUAAUGGU"))))


(provide 'protein-translation-test)
;;; protein-translation-test.el ends here
