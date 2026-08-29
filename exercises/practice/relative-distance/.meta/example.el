;;; relative-distance.el --- Relative Distance (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun degree-of-separation (family-tree person-a person-b)
  (if (string= person-a person-b)
    0
    (let ((neighbors (make-hash-table :test 'equal)))
      (cl-labels ((link (a b)
                    (push b (gethash a neighbors))
                    (push a (gethash b neighbors))))
        (cl-loop for entry in family-tree
                 for parent = (car entry)
                 do (cl-loop for children on (cdr entry)
                             for child = (car children)
                             do (link parent child)
                                (cl-loop for sibling in (cdr children)
                                         do (link child sibling)))))

      (let ((visited (make-hash-table :test 'equal))
            (current (list person-a))
            (dist 1))
        (puthash person-a t visited)
        (catch 'found
          (cl-loop while current
                   do (let ((next nil))
                        (cl-loop for person in current
                                 do (cl-loop for neighbor in (gethash person neighbors)
                                             unless (gethash neighbor visited)
                                             do (when (string= neighbor person-b)
                                                  (throw 'found dist))
                                                (puthash neighbor t visited)
                                                (push neighbor next)))
                        (setq current next)
                        (setq dist (1+ dist)))))))))

(provide 'relative-distance)
;;; relative-distance.el ends here
