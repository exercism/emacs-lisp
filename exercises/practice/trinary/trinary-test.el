;;; trinary-test.el --- Tests for Trinary (exercism)

;;; Commentary:

;;; Code:

(load-file "trinary.el")

(ert-deftest trinary-1-is-decimal-1 ()
  (should (= 1 (trinary-to-decimal "1"))))

(ert-deftest trinary-2-is-decimal-2 ()
  (should (= 2 (trinary-to-decimal "2"))))

(ert-deftest trinary-10-is-decimal-3 ()
  (should (= 3 (trinary-to-decimal "10"))))

(ert-deftest trinary-11-is-decimal-4 ()
  (should (= 4 (trinary-to-decimal "11"))))

(ert-deftest trinary-100-is-decimal-9 ()
  (should (= 9 (trinary-to-decimal "100"))))

(ert-deftest trinary-112-is-decimal-14 ()
  (should (= 14 (trinary-to-decimal "112"))))

(ert-deftest trinary-222-is-decimal-26 ()
  (should (= 26 (trinary-to-decimal "222"))))

(ert-deftest trinary-1122000120-is-decimal-32091 ()
  (should (= 32091 (trinary-to-decimal "1122000120"))))

(ert-deftest invalid-input-is-decimal-0 ()
  (should (= 0 (trinary-to-decimal "carrot"))))

(ert-deftest invalid-input-with-digits-is-decimal-0 ()
  (should (= 0 (trinary-to-decimal "0a1b2c"))))

(provide 'trinary-test)
;;; trinary-test.el ends here
