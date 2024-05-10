;;; protein-translation.el --- Protein Translation (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun translate (codon)
  (pcase codon
    ("AUG" "Methionine")
    ("UUU" "Phenylalanine")
    ("UUC" "Phenylalanine")
    ("UUA" "Leucine")
    ("UUG" "Leucine")
    ("UCU" "Serine")
    ("UCC" "Serine")
    ("UCA" "Serine")
    ("UCG" "Serine")
    ("UAU" "Tyrosine")
    ("UAC" "Tyrosine")
    ("UGU" "Cysteine")
    ("UGC" "Cysteine")
    ("UGG" "Tryptophan")
    ("UAA" nil)
    ("UAG" nil)
    ("UGA" nil)
    (otherwise (error "Invalid codon"))))

(defun proteins (strand)
  (let* ((len (length strand))
         (stop (- len (% len 3))))
    (cl-labels
      ((recur (index)
        (if (= index stop)
          (unless (= index len) (error "Invalid codon"))
          (let* ((next (+ index 3))
                 (protein (translate (substring strand index next))))
            (when protein (cons protein (recur next)))))))
      (recur 0))))

(provide 'protein-translation)
;;; protein-translation.el ends here

