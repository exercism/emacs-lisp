;;; allergies-test.el --- Tests for Allergies (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "allergies.el")
(declare-function allergen-list "allergies.el" (score))
(declare-function allergic-to-p "allergies.el" (score allergen))


(ert-deftest eggs-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "eggs")))


(ert-deftest eggs-allergic-only-to-eggs ()
  (should (allergic-to-p 1 "eggs")))


(ert-deftest eggs-allergic-to-eggs-and-something-else ()
  (should (allergic-to-p 3 "eggs")))


(ert-deftest eggs-allergic-to-something-but-not-eggs ()
  (should-not (allergic-to-p 2 "eggs")))


(ert-deftest eggs-allergic-to-everything ()
  (should (allergic-to-p 255 "eggs")))


(ert-deftest peanuts-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "peanuts")))


(ert-deftest peanuts-allergic-only-to-peanuts ()
  (should (allergic-to-p 2 "peanuts")))


(ert-deftest peanuts-allergic-to-peanuts-and-something-else ()
  (should (allergic-to-p 7 "peanuts")))


(ert-deftest peanuts-allergic-to-something-but-not-peanuts ()
  (should-not (allergic-to-p 5 "peanuts")))


(ert-deftest peanuts-allergic-to-everything ()
  (should (allergic-to-p 255 "peanuts")))


(ert-deftest shellfish-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "shellfish")))


(ert-deftest shellfish-allergic-only-to-shellfish ()
  (should (allergic-to-p 4 "shellfish")))


(ert-deftest shellfish-allergic-to-shellfish-and-something-else ()
  (should (allergic-to-p 14 "shellfish")))


(ert-deftest shellfish-allergic-to-something-but-not-shellfish ()
  (should-not (allergic-to-p 10 "shellfish")))


(ert-deftest shellfish-allergic-to-everything ()
  (should (allergic-to-p 255 "shellfish")))


(ert-deftest strawberries-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "strawberries")))


(ert-deftest strawberries-allergic-only-to-strawberries ()
  (should (allergic-to-p 8 "strawberries")))


(ert-deftest strawberries-allergic-to-strawberries-and-something-else ()
  (should (allergic-to-p 28 "strawberries")))


(ert-deftest strawberries-allergic-to-something-but-not-strawberries ()
  (should-not (allergic-to-p 20 "strawberries")))


(ert-deftest strawberries-allergic-to-everything ()
  (should (allergic-to-p 255 "strawberries")))


(ert-deftest tomatoes-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "tomatoes")))


(ert-deftest tomatoes-allergic-only-to-tomatoes ()
  (should (allergic-to-p 16 "tomatoes")))


(ert-deftest tomatoes-allergic-to-tomatoes-and-something-else ()
  (should (allergic-to-p 56 "tomatoes")))


(ert-deftest tomatoes-allergic-to-something-but-not-tomatoes ()
  (should-not (allergic-to-p 40 "tomatoes")))


(ert-deftest tomatoes-allergic-to-everything ()
  (should (allergic-to-p 255 "tomatoes")))


(ert-deftest chocolate-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "chocolate")))


(ert-deftest chocolate-allergic-only-to-chocolate ()
  (should (allergic-to-p 32 "chocolate")))


(ert-deftest chocolate-allergic-to-chocolate-and-something-else ()
  (should (allergic-to-p 112 "chocolate")))


(ert-deftest chocolate-allergic-to-something-but-not-chocolate ()
  (should-not (allergic-to-p 80 "chocolate")))


(ert-deftest chocolate-allergic-to-everything ()
  (should (allergic-to-p 255 "chocolate")))


(ert-deftest pollen-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "pollen")))


(ert-deftest pollen-allergic-only-to-pollen ()
  (should (allergic-to-p 64 "pollen")))


(ert-deftest pollen-allergic-to-pollen-and-something-else ()
  (should (allergic-to-p 224 "pollen")))


(ert-deftest pollen-allergic-to-something-but-not-pollen ()
  (should-not (allergic-to-p 160 "pollen")))


(ert-deftest pollen-allergic-to-everything ()
  (should (allergic-to-p 255 "pollen")))


(ert-deftest cats-not-allergic-to-anything ()
  (should-not (allergic-to-p 0 "cats")))


(ert-deftest cats-allergic-only-to-cats ()
  (should (allergic-to-p 128 "cats")))


(ert-deftest cats-allergic-to-cats-and-something-else ()
  (should (allergic-to-p 192 "cats")))


(ert-deftest cats-allergic-to-something-but-not-cats ()
  (should-not (allergic-to-p 64 "cats")))


(ert-deftest cats-allergic-to-everything ()
  (should (allergic-to-p 255 "cats")))


(ert-deftest list-when-no-allergies-at-all ()
  (should (equal (allergen-list 0) '())))


(ert-deftest list-when-allergic-to-just-eggs ()
  (should (equal (allergen-list 1) '("eggs"))))


(ert-deftest list-when-allergic-to-just-peanuts ()
  (should (equal (allergen-list 2) '("peanuts"))))


(ert-deftest list-when-allergic-to-just-strawberries ()
  (should (equal (allergen-list 8) '("strawberries"))))


(ert-deftest list-when-allergic-to-eggs-and-peanuts ()
  (should (equal (allergen-list 3) '("eggs" "peanuts"))))


(ert-deftest list-when-allergic-to-more-than-eggs-but-not-peanuts ()
  (should (equal (allergen-list 5) '("eggs" "shellfish"))))


(ert-deftest list-when-allergic-to-lots-of-stuff ()
  (should (equal (allergen-list 248)
                 '("strawberries" "tomatoes" "chocolate" "pollen" "cats"))))


(ert-deftest list-when-allergic-to-everything ()
  (should (equal (allergen-list 255)
                 '("eggs"
                   "peanuts"
                   "shellfish"
                   "strawberries"
                   "tomatoes"
                   "chocolate"
                   "pollen"
                   "cats"))))


(ert-deftest ignore-non-allergen-score-parts ()
  (should (equal (allergen-list 509)
                 '("eggs" 
                   "shellfish"
                   "strawberries"
                   "tomatoes"
                   "chocolate"
                   "pollen"
                   "cats"))))


(ert-deftest list-when-no-allergen-score-parts-without-highest-valid-score ()
  (should (equal (allergen-list 257) '("eggs"))))


(provide 'allergies-tests)
;;; allergies-test.el ends here
