;;; allergies.el --- Allergies Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defvar *allergens-scores*
  '(("eggs" 1)
    ("peanuts" 2)
    ("shellfish" 4)
    ("strawberries" 8)
    ("tomatoes" 16)
    ("chocolate" 32)
    ("pollen" 64)
    ("cats" 128)))

(defun allergen (allergen-and-score)
  "Return allergen from ALLERGEN-AND-SCORE."
  (cl-first allergen-and-score))

(defun score (allergen-and-score)
  "Return score from ALLERGEN-AND-SCORE."
  (cl-second allergen-and-score))

(defun score-matches (allergen-and-score score)
  "Determine if ALLERGEN-AND-SCORE entry match SCORE."
  (not (zerop (logand (score allergen-and-score) score))))

(defun find-all (check seq)
  "Find each match for CHECK in SEQ."
  (cl-remove-if-not check seq))

(defun allergen-list (score)
  "List all allergens with a given SCORE."
  (mapcar #'allergen
          (find-all
           (lambda (as) (score-matches as score))
           *allergens-scores*)))

(defun allergic-to-p (score allergen)
  "Allergic-to predicate based on SCORE and ALLERGEN."
  (score-matches (cl-assoc allergen *allergens-scores* :test #'string=)
                 score))


(let ((score 1))
  (find-all
   (lambda (as) (score-matches as score)) *allergens-scores*))

(provide 'allergies)
;;; allergies.el ends here
