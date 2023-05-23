;;; rail-fence-cipher-test.el --- Rail Fence Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "rail-fence-cipher.el")
(declare-function encode "rail-fence-cipher.el" (message rails))
(declare-function decode "rail-fence-cipher.el" (message rails))


(ert-deftest encode-with-two-rails ()
  (should
   (string= (encode "XOXOXOXOXOXOXOXOXO" 2) "XXXXXXXXXOOOOOOOOO")))


(ert-deftest encode-with-three-rails ()
  (should
   (string=
    (encode "WEAREDISCOVEREDFLEEATONCE" 3)
    "WECRLTEERDSOEEFEAOCAIVDEN")))


(ert-deftest encode-with-ending-in-the-middle ()
  (should (string= (encode "EXERCISES" 4) "ESXIEECSR")))


(ert-deftest decode-with-three-rails ()
  (should
   (string=
    (decode "TEITELHDVLSNHDTISEIIEA" 3) "THEDEVILISINTHEDETAILS")))


(ert-deftest decode-with-five-rails ()
  (should
   (string= (decode "EIEXMSMESAORIWSCE" 5) "EXERCISMISAWESOME")))


(ert-deftest decode-with-six-rails ()
  (should
   (string=
    (decode
     "133714114238148966225439541018335470986172518171757571896261" 6)
    "112358132134558914423337761098715972584418167651094617711286")))


(provide 'rail-fence-cipher-test)
;;; rail-fence-cipher-test.el ends here
