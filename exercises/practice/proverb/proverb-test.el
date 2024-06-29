;;; proverb-test.el --- Proverb (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "proverb.el")
(declare-function recite "proverb.el" (strings))


(ert-deftest zero-pieces ()
  (should (equal (recite '()) '())))


(ert-deftest one-piece ()
  (should (equal (recite '("nail")) '("And all for the want of a nail."))))


(ert-deftest two-pieces ()
  (should (equal (recite '("nail" "shoe")) '("For want of a nail the shoe was lost." "And all for the want of a nail."))))


(ert-deftest three-pieces ()
  (should (equal (recite '("nail" "shoe" "horse")) '("For want of a nail the shoe was lost." "For want of a shoe the horse was lost." "And all for the want of a nail."))))


(ert-deftest full-proverb ()
  (should (equal (recite '("nail" "shoe" "horse" "rider" "message" "battle" "kingdom"))
                 '("For want of a nail the shoe was lost."
                   "For want of a shoe the horse was lost."
                   "For want of a horse the rider was lost."
                   "For want of a rider the message was lost."
                   "For want of a message the battle was lost."
                   "For want of a battle the kingdom was lost."
                   "And all for the want of a nail."))))


(ert-deftest four-pieces-modernized ()
  (should (equal (recite '("pin" "gun" "soldier" "battle"))
                 '("For want of a pin the gun was lost."
                   "For want of a gun the soldier was lost."
                   "For want of a soldier the battle was lost."
                   "And all for the want of a pin."))))


(provide 'proverb-test)
;;; proverb-test.el ends here
