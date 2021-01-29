;;; bob-test.el --- ERT tests for Bob (exercism)

;;; Commentary:
;; Common test data version: 1.2.0 6dc2014

;;; Code:

(load-file "bob.el")


(ert-deftest responds-to-stating-something ()
  (should (string= "Whatever." (response-for "Tom-ay-to, tom-aaaah-to."))))

(ert-deftest responds-to-shouting ()
  (should
   (string= "Whoa, chill out!" (response-for "WATCH OUT!"))))

(ert-deftest responds-to-shouting-gibberish ()
  (should
   (string= "Whoa, chill out!" (response-for "FCECDFCAAB"))))

(ert-deftest responds-to-asking-a-question ()
  (should
   (string= "Sure." (response-for "Does this cryogenic chamber make me look fat?"))))

(ert-deftest responds-to-asking-a-numeric-question ()
  (should
   (string= "Sure." (response-for "You are, what, like 15?"))))

(ert-deftest responds-to-asking-gibberish ()
  (should
   (string= "Sure." (response-for "fffbbcbeab?"))))

(ert-deftest responds-to-talking-forcefully ()
  (should
   (string= "Whatever." (response-for "Let's go make out behind the gym!"))))

(ert-deftest responds-to-using-acronyms-in-regular-speech ()
  (should
   (string= "Whatever." (response-for "It's OK if you don't want to go to the DMV."))))

(ert-deftest responds-to-forceful-question ()
  (should
   (string= "Calm down, I know what I'm doing!" (response-for "WHAT THE HELL WERE YOU THINKING?"))))

(ert-deftest responds-to-shouting-numbers ()
  (should
   (string= "Whoa, chill out!" (response-for "1, 2, 3, GO!"))))

(ert-deftest responds-to-only-numbers ()
  (should
   (string= "Whatever." (response-for "1, 2, 3"))))

(ert-deftest responds-to-questions-with-only-numbers ()
  (should
   (string= "Sure." (response-for "4?"))))

(ert-deftest responds-to-shouting-with-special-chars ()
  (should
   (string= "Whoa, chill out!" (response-for "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))))

(ert-deftest responds-to-shouting-with-no-exclamation-mark ()
  (should
   (string= "Whoa, chill out!" (response-for "I HATE YOU"))))

(ert-deftest responds-to-statement-containing-question-mark ()
  (should
   (string= "Whatever." (response-for "Ending with ? means a question."))))

(ert-deftest responds-to-non-letters-with-question ()
  (should
   (string= "Sure." (response-for ":) ?"))))

(ert-deftest responds-to-prattling-on ()
  (should
   (string= "Sure." (response-for "Wait! Hang on. Are you going to be OK?"))))

(ert-deftest responds-to-silence ()
  (should
   (string= "Fine. Be that way!" (response-for ""))))

(ert-deftest responds-to-prolonged-silence ()
  (should
   (string= "Fine. Be that way!" (response-for "    "))))

(ert-deftest responds-to-alternate-silence ()
  (should
   (string= "Fine. Be that way!" (response-for "\t\t\t\t\t\t\t\t\t\t"))))

(ert-deftest responds-to-multiple-line-question ()
  (should
   (string= "Whatever." (response-for "\nDoes this cryogenic chamber make me look fat?\nno"))))

(ert-deftest responds-to-starting-with-whitespace ()
  (should
   (string= "Whatever." (response-for "         hmmmmmmm..."))))

(ert-deftest responds-to-ending-with-whitespace ()
  (should
   (string= "Sure." (response-for "Okay if like my  spacebar  quite a bit?   "))))

(ert-deftest responds-to-other-whitespace ()
  (should
   (string= "Fine. Be that way!" (response-for "\n\r \t"))))

(ert-deftest responds-to-non-question-ending-with-whitespace ()
  (should
   (string= "Whatever." (response-for "This is a statement ending with whitespace      "))))

(provide 'bob-test)
;;;bob-test.el ends here
