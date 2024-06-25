;;; strain.el --- Strain (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun keep (predicate list)
  "Return a list of elements in COLLECTION for which PREDICATE returns true."
  (let (result)
    (dolist (element list (nreverse result))
      (when (funcall predicate element)
        (push element result)))))

(defun discard (predicate list)
  "Return a list of elements in COLLECTION for which PREDICATE returns false."
  (let (result)
    (dolist (element list (nreverse result))
      (unless (funcall predicate element)
        (push element result)))))


(provide 'strain)
;;; strain.el ends here
