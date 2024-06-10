;;; pig-latin-test.el --- Pig Latin (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "pig-latin.el")
(declare-function translate "pig-latin.el" (phrase))


(ert-deftest word-beginning-with-a ()
  ;; Function under test: translate
  ;; Input: {"phrase":"apple"}
  ;; Expected: "appleay"
  (should (equal (translate "apple") "appleay")))


(ert-deftest word-beginning-with-e ()
  ;; Function under test: translate
  ;; Input: {"phrase":"ear"}
  ;; Expected: "earay"
  (should (equal (translate "ear") "earay")))


(ert-deftest word-beginning-with-i ()
  ;; Function under test: translate
  ;; Input: {"phrase":"igloo"}
  ;; Expected: "iglooay"
  (should (equal (translate "igloo") "iglooay")))


(ert-deftest word-beginning-with-o ()
  ;; Function under test: translate
  ;; Input: {"phrase":"object"}
  ;; Expected: "objectay"
  (should (equal (translate "object") "objectay")))


(ert-deftest word-beginning-with-u ()
  ;; Function under test: translate
  ;; Input: {"phrase":"under"}
  ;; Expected: "underay"
  (should (equal (translate "under") "underay")))


(ert-deftest word-beginning-with-a-vowel-and-followed-by-a-qu ()
  ;; Function under test: translate
  ;; Input: {"phrase":"equal"}
  ;; Expected: "equalay"
  (should (equal (translate "equal") "equalay")))


(ert-deftest word-beginning-with-p ()
  ;; Function under test: translate
  ;; Input: {"phrase":"pig"}
  ;; Expected: "igpay"
  (should (equal (translate "pig") "igpay")))


(ert-deftest word-beginning-with-k ()
  ;; Function under test: translate
  ;; Input: {"phrase":"koala"}
  ;; Expected: "oalakay"
  (should (equal (translate "koala") "oalakay")))


(ert-deftest word-beginning-with-x ()
  ;; Function under test: translate
  ;; Input: {"phrase":"xenon"}
  ;; Expected: "enonxay"
  (should (equal (translate "xenon") "enonxay")))


(ert-deftest word-beginning-with-q-without-a-following-u ()
  ;; Function under test: translate
  ;; Input: {"phrase":"qat"}
  ;; Expected: "atqay"
  (should (equal (translate "qat") "atqay")))


(ert-deftest word-beginning-with-ch ()
  ;; Function under test: translate
  ;; Input: {"phrase":"chair"}
  ;; Expected: "airchay"
  (should (equal (translate "chair") "airchay")))


(ert-deftest word-beginning-with-qu ()
  ;; Function under test: translate
  ;; Input: {"phrase":"queen"}
  ;; Expected: "eenquay"
  (should (equal (translate "queen") "eenquay")))


(ert-deftest word-beginning-with-qu-and-a-preceding-consonant ()
  ;; Function under test: translate
  ;; Input: {"phrase":"square"}
  ;; Expected: "aresquay"
  (should (equal (translate "square") "aresquay")))


(ert-deftest word-beginning-with-th ()
  ;; Function under test: translate
  ;; Input: {"phrase":"therapy"}
  ;; Expected: "erapythay"
  (should (equal (translate "therapy") "erapythay")))


(ert-deftest word-beginning-with-thr ()
  ;; Function under test: translate
  ;; Input: {"phrase":"thrush"}
  ;; Expected: "ushthray"
  (should (equal (translate "thrush") "ushthray")))


(ert-deftest word-beginning-with-sch ()
  ;; Function under test: translate
  ;; Input: {"phrase":"school"}
  ;; Expected: "oolschay"
  (should (equal (translate "school") "oolschay")))


(ert-deftest word-beginning-with-yt ()
  ;; Function under test: translate
  ;; Input: {"phrase":"yttria"}
  ;; Expected: "yttriaay"
  (should (equal (translate "yttria") "yttriaay")))


(ert-deftest word-beginning-with-xr ()
  ;; Function under test: translate
  ;; Input: {"phrase":"xray"}
  ;; Expected: "xrayay"
  (should (equal (translate "xray") "xrayay")))


(ert-deftest y-is-treated-like-a-consonant-at-the-beginning-of-a-word ()
  ;; Function under test: translate
  ;; Input: {"phrase":"yellow"}
  ;; Expected: "ellowyay"
  (should (equal (translate "yellow") "ellowyay")))


(ert-deftest y-is-treated-like-a-vowel-at-the-end-of-a-consonant-cluster ()
  ;; Function under test: translate
  ;; Input: {"phrase":"rhythm"}
  ;; Expected: "ythmrhay"
  (should (equal (translate "rhythm") "ythmrhay")))


(ert-deftest y-as-second-letter-in-two-letter-word ()
  ;; Function under test: translate
  ;; Input: {"phrase":"my"}
  ;; Expected: "ymay"
  (should (equal (translate "my") "ymay")))


(ert-deftest a-whole-phrase ()
  ;; Function under test: translate
  ;; Input: {"phrase":"quick fast run"}
  ;; Expected: "ickquay astfay unray"
  (should (equal (translate "quick fast run") "ickquay astfay unray")))


(provide 'pig-latin-test)
;;; pig-latin-test.el ends here

