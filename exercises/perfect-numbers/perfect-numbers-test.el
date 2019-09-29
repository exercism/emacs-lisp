;;; perfect-numbers-test.el --- Tests for perfect-numbers (exercism)

;;; Commentary:

;;; Code:

(load-file "perfect-numbers.el")

;;; Perfect Numbers
(ert-deftest smallest-perfect-number ()
    (should (equal (classify 6) 'perfect)))

(ert-deftest medium-perfect-number ()
  (should (equal (classify 28) 'perfect)))

(ert-deftest large-perfect-number ()
  (should (equal (classify 33550336) 'perfect)))

;;; Abundant Numbers
(ert-deftest smallest-abundant-number ()
  (should (equal (classify 12) 'abundant)))

(ert-deftest medium-abundant-number ()
  (should (equal (classify 30) 'abundant)))

(ert-deftest large-abundant-number ()
  (should (equal (classify 33550335) 'abundant)))

;;; Deficient Numbers
(ert-deftest smallest-deficient-number ()
  (should (equal (classify 2) 'deficient)))

(ert-deftest smallest-non-prime-deficient-number ()
  (should (equal (classify 4) 'deficient)))

(ert-deftest medium-deficient-number ()
  (should (equal (classify 32) 'deficient)))

(ert-deftest large-deficient-number ()
  (should (equal (classify 33550337) 'deficient)))

(ert-deftest edge-case-no-factors-other-than-self ()
  (should (equal (classify 1) 'deficient)))

;;; Invalid Inputs
(ert-deftest zero-is-rejected ()
  (should
   (equal
    (should-error (classify -1))
    '(error . ("Classification is only possible for natural numbers")))))

(ert-deftest negative-integer-is-rejected ()
  (should
   (equal
    (should-error (classify -1))
    '(error . ("Classification is only possible for natural numbers")))))

(provide 'perfect-numbers)
;;; perfect-numbers-test.el ends here
