;;; connect.el --- Connect (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun winner (board)
  (let* ((rows (length board))
         (columns (/ (1+ (length (aref board 0)))
                     2))
         (n (+ (* rows columns)
               4))
         (top (- n 4))
         (bottom (- n 3))
         (left (- n 2))
         (right (- n 1))

         ;; used by Union Find
         (parent (vconcat (number-sequence 0 (1- n))))
         (size (make-vector n 1)))
    (cl-labels ((find (element)
                  ;; path splitting
                  (cl-loop for next = (aref parent element)
                    until (= element next)
                    do (aset parent element (aref parent next))
                    do (setq element next)
                    finally return element))
                (reparent (child new-parent)
                  (aset parent child new-parent)
                  (aset size new-parent (+ (aref size new-parent) (aref size child))))
                (union (a b)
                  (let ((a (find a))
                        (b (find b)))
                    (unless (= a b)
                      (if (< (aref size a) (aref size b))
                        (reparent a b)
                        (reparent b a)))))
                (index (r c)
                  (+ (* columns r) c))
                (occupant (r c)
                  (aref (aref board r) (+ r (* 2 c))))
                (adjacent (r1 c1 r2 c2)
                  (let ((ch (occupant r1 c1)))
                    (when (and (/= ?. ch) (= ch (occupant r2 c2)))
                      (union (index r1 c1) (index r2 c2))))))

      ;; O edges
      (cl-loop for c from 0 below columns
        when (= ?O (occupant 0 c))
        do (union top (index 0 c))
        when (= ?O (occupant (1- rows) c))
        do (union bottom (index (1- rows) c)))

      ;; X edges
      (cl-loop for r from 0 below rows
        when (= ?X (occupant r 0))
        do (union left (index r 0))
        when (= ?X (occupant r (1- columns)))
        do (union right (index r (1- columns))))

      ;; horizontal -
      (cl-loop for r from 0 below rows
        do (cl-loop for c below (1- columns)
             do (adjacent r c r (1+ c))))

      ;; diagonal \
      (cl-loop for r from 0 below (1- rows)
        do (cl-loop for c below columns
             do (adjacent r c (1+ r) c)))

      ;; diagonal /
      (cl-loop for r from 0 below (1- rows)
        do (cl-loop for c below (1- columns)
             do (adjacent r (1+ c) (1+ r) c)))

      (cond
        ((= (find top) (find bottom)) "O")
        ((= (find left) (find right)) "X")
        (t "")))))


(provide 'connect)
;;; connect.el ends here

