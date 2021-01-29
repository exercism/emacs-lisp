;;; run-length-encoding-test.el --- Tests for run-length-encoding (exercism)

;;; Commentary:

;;; Code:

(load-file "run-length-encoding.el")

(ert-deftest encode-empty-string ()
  "encode an empty string"
  (should (string= (run-length-encode "") "")))

(ert-deftest encode-single-characters-without-count ()
  "encode single characters without count"
  (should (string= (run-length-encode "XYZ") "XYZ")))

(ert-deftest encode-string-with-no-single-characters ()
  "encode string with no single characters"
  (should (string= (run-length-encode "AABBBCCCC") "2A3B4C")))

(ert-deftest encode-string-with-single-and-mixed-characters ()
  "encode string with single and mixed characters"
  (should (string= (run-length-encode "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") "12WB12W3B24WB")))

(ert-deftest encode-multiple-whitespace ()
  "encode string with whitespace characters mixed in it"
  (should (string= (run-length-encode "  hsqq qww  ") "2 hs2q q2w2 ")))

(ert-deftest encode-lowercase ()
  "encode string with lowercase characters"
  (should (string= (run-length-encode "aabbbcccc") "2a3b4c")))

(ert-deftest decode-empty-string ()
  "decode empty string"
  (should (string= (run-length-decode "") "")))

(ert-deftest decode-single-characters ()
  "decode string with single characters only"
  (should (string= (run-length-decode "XYZ") "XYZ")))

(ert-deftest decode-no-single-characters ()
  "decode string with no single characters"
  (should (string= (run-length-decode "2A3B4C") "AABBBCCCC")))

(ert-deftest decode-single-and-repeated-characters ()
  "decode string with single and repeated characters"
  (should (string= (run-length-decode "12WB12W3B24WB") "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")))

(ert-deftest decode-lowercase ()
  "decode string with lowercase characters"
  (should (string= (run-length-decode "2a3b4c") "aabbbcccc")))

(ert-deftest decode-mixed-whitespace ()
  "decode string with mixed whitespace characters in it"
  (should (string= (run-length-decode "2 hs2q q2w2 ") "  hsqq qww  ")))

(ert-deftest consistency ()
  "Encode a string and then decode it. Should return the same one."
  (should (string= (run-length-decode (run-length-encode "zzz ZZ  zZ")) "zzz ZZ  zZ")))

;;; run-length-encoding-test.el ends here
