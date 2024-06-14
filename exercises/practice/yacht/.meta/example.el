;;; yacht.el --- Yacht (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun hash-values (ht)
  (let (vals)
    (maphash (lambda (_ v) (push v vals)) ht)
    (reverse vals)))

(defun frequencies (sequence)
  (let ((occurrences (make-hash-table :test 'equal)))
    (dolist (n sequence)
      (puthash n (1+ (gethash n occurrences 0)) occurrences))
    occurrences))

(defun full-house (occurrences)
  (let ((vals (sort (hash-values occurrences) #'<)))
    (equal vals '(2 3))))

(defun four-of-a-kind-dice (occurrences)
  (let (pair)
    (maphash (lambda (key val)
               (when (>= val 4)
                 (setq pair key)))
             occurrences)
    pair))

(defun score (scores category)
  (pcase category
    (:ones (cl-count 1 scores))
    (:twos (* 2 (cl-count 2 scores)))
    (:threes (* 3 (cl-count 3 scores)))
    (:fours (* 4 (cl-count 4 scores)))
    (:fives (* 5 (cl-count 5 scores)))
    (:sixes (* 6 (cl-count 6 scores)))
    (:full-house (if (full-house (frequencies scores))
                     (cl-reduce '+ scores)
                   0))
    (:four-of-a-kind (let ((dice (four-of-a-kind-dice (frequencies scores))))
                       (if dice (* 4 dice) 0)))
    (:little-straight (if (equal '(1 2 3 4 5) (sort scores #'<))
                          30
                        0))
    (:big-straight (if (equal '(2 3 4 5 6) (sort scores #'<))
                       30
                     0))
    (:choice (cl-reduce '+ scores))
    (:yacht (if (= 1 (hash-table-count (frequencies scores)))
                50
              0))
    (_ 0)))


(provide 'yacht)
;;; yacht.el ends here
