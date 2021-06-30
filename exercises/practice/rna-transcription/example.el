;;; rna-transcription.el -- RNA Transcription (exercism)

;;; Commentary:
;;
;; Example derived pretty directly from xlisp example:
;; https://github.com/exercism/xlisp/blob/master/rna-transcription/example.lisp
;;

;;; Code:

(require 'cl-lib)

(defun validate-strand (strand)
  "Check to see if RNA STRAND is valid."
  (or (cl-every (lambda (c) (cl-find c "ATCGU")) (cl-coerce strand 'list))
      (error "Bad strand")))

(defvar dna->rna
  '((?C . ?G) (?G . ?C) (?A . ?U) (?T . ?A)))

(defun to-rna (strand)
  "Convert STRAND of DNA to RNA."
  (validate-strand strand)
  (cl-concatenate 'string
                  (mapcar (lambda (c) (cdr (assoc c dna->rna)))
                          (cl-coerce strand 'list))))


(provide 'rna-transcription)
;;; rna-transcription.el ends here
