;;; two-bucket.el --- Two Bucket (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(define-error 'goal-not-possible "impossible")

(cl-defstruct (bucket (:constructor make-bucket (capacity name))
                      (:copier nil))
  capacity
  (amount 0)
  name)

(defun empty (bucket)
  (setf (bucket-amount bucket) 0))

(defun fill (bucket)
  (setf (bucket-amount bucket) (bucket-capacity bucket)))

(defun fullp (bucket)
  (= (bucket-amount bucket) (bucket-capacity bucket)))

(defun overflowingp (bucket)
  (when (> (bucket-amount bucket) (bucket-capacity bucket))
    (- (bucket-amount bucket) (bucket-capacity bucket))))

(defun transfer (from-bucket to-bucket)
  (cl-incf (bucket-amount to-bucket) (bucket-amount from-bucket))
  (empty from-bucket)
  (when-let ((excess (overflowingp to-bucket)))
    (setf (bucket-amount from-bucket) excess)
    (fill to-bucket)))

(defun unsolvablep (bucket-one bucket-two goal)
  (or (cl-plusp (% goal (cl-gcd bucket-one bucket-two)))
      (and (> goal bucket-one) (> goal bucket-two))))

(defun retrieve-results (bucket-one bucket-two goal)
  (if (= goal (bucket-amount bucket-one))
      (list (bucket-name bucket-one) (bucket-amount bucket-two))
    (list (bucket-name bucket-two) (bucket-amount bucket-one))))

(defun iterate-through-puzzle (start-bucket other-bucket goal)
  (fill start-bucket)
  (cl-loop for moves from 1
           until (or (= goal (bucket-amount start-bucket))
                     (= goal (bucket-amount other-bucket)))
           do (cond
               ((= goal (bucket-capacity other-bucket)) (fill other-bucket))
               ((fullp other-bucket) (empty other-bucket))
               ((zerop (bucket-amount start-bucket)) (fill start-bucket))
               (t (transfer start-bucket other-bucket)))
           finally (return (cons moves (retrieve-results start-bucket other-bucket goal)))))

(defun measure (bucket-one bucket-two goal start-bucket)
  (if (unsolvablep bucket-one bucket-two goal)
      (signal 'goal-not-possible nil)
    (let* ((first-bucket (make-bucket bucket-one 'one))
           (second-bucket (make-bucket bucket-two 'two))
           (results (if (eq start-bucket 'one)
                        (iterate-through-puzzle first-bucket second-bucket goal)
                      (iterate-through-puzzle second-bucket first-bucket goal))))
      (cons (car results) (cdr results)))))


(provide 'two-bucket)
;;; two-bucket.el ends here
