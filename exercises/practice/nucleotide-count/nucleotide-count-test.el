;;; nucleotide-count-test.el --- Tests for nucleotide-count (exercism)

;;; Commentary:

;;; Code:

(load-file "nucleotide-count.el")


(defun sort-pairs (lst fn)
  (sort lst (lambda (a b) (funcall fn (car a) (car b)))))


(ert-deftest empty-dna-strand-has-no-nucleotides-test ()
  (should (equal (sort-pairs (nucleotide-count "") #'<)
                 '((?A . 0) (?C . 0) (?G . 0) (?T . 0)))))


(ert-deftest repetitive-sequence-has-only-guanine-test ()
  (should (equal (sort-pairs (nucleotide-count "GGGGGGGG") #'<)
                 '((?A . 0) (?C . 0) (?G . 8) (?T . 0)))))


(ert-deftest count-all-nucleotides-test ()
  (should (equal (sort-pairs (nucleotide-count "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC") #'<)
                 '((?A . 20) (?C . 12) (?G . 17) (?T . 21)))))


(ert-deftest invalid-nucleotide-test ()
  (should-error (nucleotide-count "AGGTCCXGA")))


(provide 'nucleotide-count)
;;; nucleotide-count-test.el ends here
