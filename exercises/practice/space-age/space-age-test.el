;;; space-age-test.el --- Tests for Space Age (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "space-age.el")
(declare-function age "space-age.el" (planet seconds))


(defmacro should-approximate (expected actual)
    (list 'should (list '< (- expected 0.01) actual (+ expected 0.01))))


(ert-deftest age-on-earth ()
  (should-approximate 31.69 (age :earth 1000000000)))


(ert-deftest age-on-mercury ()
  (should-approximate 280.88 (age :mercury 2134835688)))


(ert-deftest age-on-venus ()
  (should-approximate 9.78 (age :venus 189839836)))


(ert-deftest age-on-mars ()
  (should-approximate 35.88 (age :mars 2129871239)))


(ert-deftest age-on-jupiter ()
  (should-approximate 2.41 (age :jupiter 901876382)))


(ert-deftest age-on-saturn ()
  (should-approximate 2.15 (age :saturn 2000000000)))


(ert-deftest age-on-uranus ()
  (should-approximate 0.46 (age :uranus 1210123456)))


(ert-deftest age-on-neptune ()
  (should-approximate 0.35 (age :neptune 1821023456)))


(ert-deftest invalid-planet-causes-error ()
  (should-error (age :sun 680804807)))


(provide 'space-age-test)
;;; space-age-test.el ends here
