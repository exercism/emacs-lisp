;;; satellite.el --- Satellite (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'seq)

(defun tree-from-traversals (preorder inorder)
  (when (/= (length preorder) (length inorder))
    (error "traversals must have the same length"))
  (when (or (/= (length preorder) (length (seq-uniq preorder)))
            (/= (length inorder) (length (seq-uniq inorder))))
    (error "traversals must contain unique items"))
  (cl-labels
    ((traverse (successor)
       (cond
         ((and successor (equal (car inorder) successor)) nil)
         ((null preorder) (error "traversals must have the same elements"))
         (t (let ((v (car preorder)))
              (setq preorder (cdr preorder))
              (let ((l (funcall #'traverse v)))
                (setq inorder (cdr inorder))
                (let ((r (and inorder (funcall #'traverse successor))))
                  (list (cons :v v) (cons :l l) (cons :r r)))))))))
    (and preorder (funcall #'traverse nil))))

(provide 'satellite)
;;; satellite.el ends here

