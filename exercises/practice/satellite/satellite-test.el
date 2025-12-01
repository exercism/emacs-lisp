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


(ert-deftest a-degenerate-binary-tree ()
  (should (equal '((:v . "a")
                   (:l . ((:v . "b")
                          (:l . ((:v . "c")
                                 (:l . ((:v . "d")
                                        (:l . nil)
                                        (:r . nil)))
                                 (:r . nil)))
                          (:r . nil)))
                   (:r . nil))
            (tree-from-traversals '("a" "b" "c" "d") '("d" "c" "b" "a")))))


(ert-deftest another-degenerate-binary-tree ()
  (should (equal '((:v . "a")
                   (:l . nil)
                   (:r . ((:v . "b")
                          (:l . nil)
                          (:r . ((:v . "c")
                                 (:l . nil)
                                 (:r . ((:v . "d")
                                        (:l . nil)
                                        (:r . nil))))))))
            (tree-from-traversals '("a" "b" "c" "d") '("a" "b" "c" "d")))))


(ert-deftest tree-with-many-more-items ()
  (should (equal '((:v . "a")
                   (:l . ((:v . "b")
                          (:l . ((:v . "d")
                                 (:l . ((:v . "g")
                                        (:l . nil)
                                        (:r . nil)))
                                 (:r . ((:v . "h")
                                        (:l . nil)
                                        (:r . nil)))))
                          (:r . nil)))
                   (:r . ((:v . "c")
                          (:l . ((:v . "e")
                                 (:l . nil)
                                 (:r . nil)))
                          (:r . ((:v . "f")
                                 (:l . ((:v . "i")
                                        (:l . nil)
                                        (:r . nil)))
                                 (:r . nil))))))
            (tree-from-traversals '("a" "b" "d" "g" "h" "c" "e" "f" "i") '("g" "d" "h" "b" "a" "e" "c" "i" "f")))))


(provide 'satellite-test)
;;; satellite-test.el ends here
