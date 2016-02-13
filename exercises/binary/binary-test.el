;;; binary-test.el --- Tests for Binary exercise (exercism)

;;; Commentary:

;;; Code:

(load-file "binary.el")

(ert-deftest binary-1-is-decimal-1 ()
  (should (= 1 (to-decimal "1"))))

(ert-deftest binary-10-is-decimal-2 ()
  (should (= 2 (to-decimal "10"))))

(ert-deftest binary-11-is-decimal-3 ()
  (should (= 3 (to-decimal "11"))))

(ert-deftest binary-100-is-decimal-4 ()
  (should (= 4 (to-decimal "100"))))

(ert-deftest binary-1001-is-decimal-9 ()
  (should (= 9 (to-decimal "1001"))))

(ert-deftest binary-11010-is-decimal-26 ()
  (should (= 26 (to-decimal "11010"))))

(ert-deftest binary-10001101000-is-decimal-1128 ()
  (should (= 1128 (to-decimal "10001101000"))))

(ert-deftest invalid-binary-is-decimal-0 ()
  (should (= 0 (to-decimal "carrot"))))

(provide 'binary-test)
;;; binary-test.el ends here
