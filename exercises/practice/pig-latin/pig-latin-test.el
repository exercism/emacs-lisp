;;; pig-latin-test.el --- Pig Latin (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "pig-latin.el")
(declare-function translate "pig-latin.el" (phrase))


(ert-deftest word-beginning-with-a ()
  (should (string= (translate "apple") "appleay")))


(ert-deftest word-beginning-with-e ()
  (should (string= (translate "ear") "earay")))


(ert-deftest word-beginning-with-i ()
  (should (string= (translate "igloo") "iglooay")))


(ert-deftest word-beginning-with-o ()
  (should (string= (translate "object") "objectay")))


(ert-deftest word-beginning-with-u ()
  (should (string= (translate "under") "underay")))


(ert-deftest word-beginning-with-a-vowel-and-followed-by-a-qu ()
  (should (string= (translate "equal") "equalay")))


(ert-deftest word-beginning-with-p ()
  (should (string= (translate "pig") "igpay")))


(ert-deftest word-beginning-with-k ()
   (should (string= (translate "koala") "oalakay")))


(ert-deftest word-beginning-with-x ()
   (should (string= (translate "xenon") "enonxay")))


(ert-deftest word-beginning-with-q-without-a-following-u ()
   (should (string= (translate "qat") "atqay")))


(ert-deftest word-beginning-with-ch ()
  (should (string= (translate "chair") "airchay")))


(ert-deftest word-beginning-with-qu ()
  (should (string= (translate "queen") "eenquay")))


(ert-deftest word-beginning-with-qu-and-a-preceding-consonant ()
  (should (string= (translate "square") "aresquay")))


(ert-deftest word-beginning-with-th ()
  (should (string= (translate "therapy") "erapythay")))


(ert-deftest word-beginning-with-thr ()
  (should (string= (translate "thrush") "ushthray")))


(ert-deftest word-beginning-with-sch ()
  (should (string= (translate "school") "oolschay")))


(ert-deftest word-beginning-with-yt ()
   (should (string= (translate "yttria") "yttriaay")))


(ert-deftest word-beginning-with-xr ()
  (should (string= (translate "xray") "xrayay")))


(ert-deftest y-is-treated-like-a-consonant-at-the-beginning-of-a-word ()
   (should (string= (translate "yellow") "ellowyay")))


(ert-deftest y-is-treated-like-a-vowel-at-the-end-of-a-consonant-cluster ()
   (should (string= (translate "rhythm") "ythmrhay")))


(ert-deftest y-as-second-letter-in-two-letter-word ()
   (should (string= (translate "my") "ymay")))


(ert-deftest a-whole-phrase ()
   (should (string= (translate "quick fast run") "ickquay astfay unray")))


(provide 'pig-latin-test)
;;; pig-latin-test.el ends here

