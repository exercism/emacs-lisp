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

(ert-deftest total-3 ()
  (should (= 4294967295
             (total 7))))

(ert-deftest total-32 ()
  (should (= 4294967295
             (total 32))))

(provide 'grains-test.el)
;;; grains-test.el ends here.
