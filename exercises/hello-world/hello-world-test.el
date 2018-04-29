;;; hello-world-test.el --- Tests for Hello World (exercism)

;;; Commentary:
;; Common test data version: 1.1.0 be3ae66

;;; Code:

(load-file "hello-world.el")

(ert-deftest hello-world-test ()
  (should (equal (hello) "Hello, World!")))

(provide 'hello-world-test)

;;; hello-world-test.el ends here
