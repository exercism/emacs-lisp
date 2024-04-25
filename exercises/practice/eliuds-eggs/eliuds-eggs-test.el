;;; eliuds-eggs-test.el --- Eliud's Eggs (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "eliuds-eggs.el")
(declare-function egg-count "eliuds-eggs.el" (number))


(ert-deftest 0-eggs ()
  (should (= 0 (egg-count 0))))

(ert-deftest 1-egg ()
 (should (= 1 (egg-count 16))))


(ert-deftest 4-eggs ()
 (should (= 4 (egg-count 89))))


(ert-deftest 13-eggs ()
 (should (= 13 (egg-count 2000000000))))


(provide 'eliuds-eggs-test)
;;; eliuds-eggs-test.el ends here

