;;; bob-test.el --- ERT tests for Bob (exercism)

;;; Commentary:

;;; Code:

(load-file "bob.el")


(ert-deftest responds-to-something ()
  (should (string= "Whatever." (response-for "Tom-ay-to, tom-aaaah-to."))))

(ert-deftest responds-to-shouts ()
  (should
   (string= "Whoa, chill out!" (response-for "WATCH OUT!"))))

(ert-deftest responds-to-questions ()
  (should
   (string= "Sure." (response-for "Does this cryogenic chamber make me look fat?"))))

(ert-deftest responds-to-forceful-talking ()
  (should
   (string= "Whatever." (response-for "Let's go make out behind the gym!"))))

(ert-deftest responds-to-acronyms ()
  (should
   (string= "Whatever." (response-for "It's OK if you don't want to go to the DMV."))))

(ert-deftest responds-to-forceful-questions ()
  (should
   (string= "Whoa, chill out!" (response-for "WHAT THE HELL WERE YOU THINKING?"))))

(ert-deftest responds-to-shouting-with-special-chars ()
  (should
   (string= "Whoa, chill out!" (response-for "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))))

(ert-deftest responds-to-shouting-numbers ()
  (should
   (string= "Whoa, chill out!" (response-for "1, 2, 3, GO!"))))

(ert-deftest responds-to-shouting-with-no-exclamation-mark ()
  (should
   (string= "Whoa, chill out!" (response-for "I HATE YOU"))))

(ert-deftest responds-to-statement-containing-question-mark ()
  (should
   (string= "Whatever." (response-for "Ending with ? means a question."))))

(ert-deftest responds-to-silence ()
  (should
   (string= "Fine. Be that way!" (response-for ""))))

(ert-deftest responds-to-prolonged-silence ()
  (should
   (string= "Fine. Be that way!" (response-for "    "))))

(ert-deftest responds-to-only-numbers ()
  (should
   (string= "Whatever." (response-for "1, 2, 3"))))

(ert-deftest responds-to-number-questions ()
  (should
   (string= "Sure." (response-for "4?"))))

(provide 'bob-test)
;;;bob-test.el ends here
