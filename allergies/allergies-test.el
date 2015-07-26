;;; allergies-test.el --- Tests for Allergies (exercism)

;;; Commentary:

;;; Code:

(load-file "allergies.el")

(ert-deftest no-allergies-at-all ()
  (should (equal '() (allergen-list 0))))

(ert-deftest allergic-to-just-eggs ()
  (should (equal '("eggs") (allergen-list 1))))

(ert-deftest allergic-to-just-peanuts ()
  (should (equal '("peanuts") (allergen-list 2))))

(ert-deftest allergic-to-just-strawberries ()
  (should (equal '("strawberries") (allergen-list 8))))

(ert-deftest allergic-to-eggs-and-peanuts ()
  (should (equal '("eggs" "peanuts") (allergen-list 3))))

(ert-deftest allergic-to-more-than-eggs-but-not-peanuts ()
  (should (equal '("eggs" "shellfish") (allergen-list 5))))

(ert-deftest allergic-to-lots-of-stuff ()
  (should (equal '("strawberries" "tomatoes" "chocolate" "pollen" "cats")
                 (allergen-list 248))))

(ert-deftest allergic-to-everything ()
  (should (equal '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes"
                   "chocolate" "pollen" "cats")
                 (allergen-list 255))))

(ert-deftest no-allergies-means-not-allergic ()
  (should-not (allergic-to-p 0 "peanuts"))
  (should-not (allergic-to-p 0 "cats"))
  (should-not (allergic-to-p 0 "strawberries")))

(ert-deftest is-allergic-to-eggs ()
  (should (allergic-to-p 1 "eggs")))

(ert-deftest allergic-to-eggs-and-other-stuff ()
  (should (allergic-to-p 5 "eggs")))

(ert-deftest ignore-non-allergen-score-parts ()
  (should (equal '("eggs" "shellfish" "strawberries" "tomatoes"
                   "chocolate" "pollen" "cats")
                 (allergen-list 509))))

(provide 'allergies)
;;; allergies-test.el ends here
