;;; grains-test.el --- Test for Grains (exercism)

;;; Commentary:

;;; Code:

(load-file "grains.el")

(ert-deftest square-1 ()
  (should (= 1 (square 1))))

(ert-deftest square-2 ()
  (should (= 2 (square 2))))

(ert-deftest square-3 ()
  (should (= 4 (square 3))))

(ert-deftest square-4 ()
  (should (= 8 (square 4))))

(ert-deftest square-16 ()
  (should (= 32768
             (square 16))))

(ert-deftest square-32 ()
  (should (= 2147483648
             (square 32))))

(ert-deftest square-64 ()
  (should (= 9223372036854775808
             (square 64))))

(ert-deftest total-grains ()
  (should (= 18446744073709551615
             (total))))

(provide 'grains-test.el)
;;; grains-test.el ends here.
