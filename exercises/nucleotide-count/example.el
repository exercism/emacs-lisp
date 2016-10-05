;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:


(defun nucleotide-count (sequence)
  (let ((counts (copy-alist '((?A . 0) (?C . 0) (?G . 0) (?T . 0)))))
    (dolist (i (append sequence nil))
      (let ((n (assoc i counts)))
        (if n
            (setcdr n (1+ (cdr n)))
          (error "Invalid nucleotide '%c'" i))))
    counts))


(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
