;;; perfect-numbers-test.el --- Tests for perfect-numbers (exercism)

;;; Commentary:

;;; Code:

(load-file "perfect-numbers.el")


(ert-deftest no-perfect-numbers-in-1-to-5 ()
    (should (equal (perfect-numbers 5) '())))

(ert-deftest return-one-perfect-number-for-range-1-to-6 ()
    (should (equal (perfect-numbers 6) '(6))))

(ert-deftest return-3-perfect-numbers-for-range-1-to-1000 ()
    (should (equal (perfect-numbers 1000) '(6 28 496))))

(ert-deftest return-4-perfect-numbers-for-range-1-to-10000 ()
    (should (equal (perfect-numbers 10000) '(6 28 496 8128))))


(provide 'perfect-numbers)
;;; perfect-numbers-test.el ends here
