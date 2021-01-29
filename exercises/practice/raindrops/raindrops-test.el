;;; raindrops-test.el --- Tests for Raindrops (exercism)

;;; Commentary:

;;; Code:

(load-file "raindrops.el")

(ert-deftest test-1 ()
  (should (equal "1"
                 (convert 1))))

(ert-deftest test-3 ()
  (should (equal "Pling"
                 (convert 3))))

(ert-deftest test-5 ()
  (should (equal "Plang"
                 (convert 5))))

(ert-deftest test-7 ()
  (should (equal "Plong"
                 (convert 7))))

(ert-deftest test-6 ()
  (should (equal "Pling"
                 (convert 6))))

(ert-deftest test-9 ()
  (should (equal "Pling"
                 (convert 9))))

(ert-deftest test-10 ()
  (should (equal "Plang"
                 (convert 10))))

(ert-deftest test-15 ()
  (should (equal "PlingPlang"
                 (convert 15))))

(ert-deftest test-21 ()
  (should (equal "PlingPlong"
                 (convert 21))))

(ert-deftest test-25 ()
  (should (equal "Plang"
                 (convert 25))))

(ert-deftest test-35 ()
  (should (equal "PlangPlong"
                 (convert 35))))

(ert-deftest test-49 ()
  (should (equal "Plong"
                 (convert 49))))

(ert-deftest test-52 ()
  (should (equal "52"
                 (convert 52))))

(ert-deftest test-105 ()
  (should (equal "PlingPlangPlong"
                 (convert 105))))

(ert-deftest test-12121 ()
  (should (equal "12121"
                 (convert 12121))))

(provide 'raindrops-test)
;;; raindrops-test.el ends here
