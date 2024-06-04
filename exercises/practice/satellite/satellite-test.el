;;; satellite-test.el --- Tests for Satellite (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "satellite.el")
(declare-function tree-from-traversals "satellite.el" (preorder inorder))


(ert-deftest empty-tree ()
  (should (equal nil
            (tree-from-traversals '() '()))))


(ert-deftest tree-with-one-item ()
  (should (equal '((:v . "a")
                   (:l . nil)
                   (:r . nil))
            (tree-from-traversals '("a") '("a")))))


(ert-deftest tree-with-many-items ()
  (should (equal '((:v . "a")
                   (:l . ((:v . "i")
                          (:l . nil)
                          (:r . nil)))
                   (:r . ((:v . "x")
                          (:l . ((:v . "f")
                                 (:l . nil)
                                 (:r . nil)))
                          (:r . ((:v . "r")
                                 (:l . nil)
                                 (:r . nil))))))
            (tree-from-traversals '("a" "i" "x" "f" "r") '("i" "a" "f" "x" "r")))))


(ert-deftest reject-traversals-of-different-length ()
  (should-error (tree-from-traversals '("a" "b") '("b" "a" "r"))))


(ert-deftest reject-inconsistent-traversals-of-same-length ()
  (should-error (tree-from-traversals '("x" "y" "z") '("a" "b" "c"))))


(ert-deftest reject-traversals-with-repeated-items ()
  (should-error (tree-from-traversals '("a" "b" "a") '("b" "a" "a"))))


(provide 'satellite-test)
;;; satellite-test.el ends here
