;;; hello-world-test.el --- Tests for Hello World (exercism)

;;; Commentary:

;;; Code:

(load-file "hello-world.el")

(ert-deftest no-args ()
  (should (equal (hello) "Hello, World!")))

(ert-deftest with-args ()
  (should (equal (hello "Emacs") "Hello, Emacs!"))
  (should (equal (hello "Exercism") "Hello, Exercism!")))

(provide 'hello-world-test)

;;; hello-world-test.el ends here
