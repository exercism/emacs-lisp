;;; meetup-test.el --- Meetup (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "meetup.el")
(declare-function meetup "meetup.el" (year month dayofweek schedule))


(ert-deftest when-teenth-monday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 5 :monday :teenth) '(2013 5 13))))


(ert-deftest when-teenth-monday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 8 :monday :teenth) '(2013 8 19))))


(ert-deftest when-teenth-monday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 9 :monday :teenth) '(2013 9 16))))


(ert-deftest when-teenth-tuesday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 3 :tuesday :teenth) '(2013 3 19))))


(ert-deftest when-teenth-tuesday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 4 :tuesday :teenth) '(2013 4 16))))


(ert-deftest when-teenth-tuesday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 8 :tuesday :teenth) '(2013 8 13))))


(ert-deftest when-teenth-wednesday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 1 :wednesday :teenth) '(2013 1 16))))


(ert-deftest when-teenth-wednesday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 2 :wednesday :teenth) '(2013 2 13))))


(ert-deftest when-teenth-wednesday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 6 :wednesday :teenth) '(2013 6 19))))


(ert-deftest when-teenth-thursday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 5 :thursday :teenth) '(2013 5 16))))


(ert-deftest when-teenth-thursday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 6 :thursday :teenth) '(2013 6 13))))


(ert-deftest when-teenth-thursday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 9 :thursday :teenth) '(2013 9 19))))


(ert-deftest when-teenth-friday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 4 :friday :teenth) '(2013 4 19))))


(ert-deftest when-teenth-friday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 8 :friday :teenth) '(2013 8 16))))


(ert-deftest when-teenth-friday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 9 :friday :teenth) '(2013 9 13))))


(ert-deftest when-teenth-saturday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 2 :saturday :teenth) '(2013 2 16))))


(ert-deftest when-teenth-saturday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 4 :saturday :teenth) '(2013 4 13))))


(ert-deftest when-teenth-saturday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 10 :saturday :teenth) '(2013 10 19))))


(ert-deftest when-teenth-sunday-is-the-19th-the-last-day-of-the-teenth-week ()
  (should (equal (meetup 2013 5 :sunday :teenth) '(2013 5 19))))


(ert-deftest when-teenth-sunday-is-some-day-in-the-middle-of-the-teenth-week ()
  (should (equal (meetup 2013 6 :sunday :teenth) '(2013 6 16))))


(ert-deftest when-teenth-sunday-is-the-13th-the-first-day-of-the-teenth-week ()
  (should (equal (meetup 2013 10 :sunday :teenth) '(2013 10 13))))


(ert-deftest when-first-monday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 3 :monday :first) '(2013 3 4))))


(ert-deftest when-first-monday-is-the-1st-the-first-day-of-the-first-week ()
  (should (equal (meetup 2013 4 :monday :first) '(2013 4 1))))


(ert-deftest when-first-tuesday-is-the-7th-the-last-day-of-the-first-week ()
  (should (equal (meetup 2013 5 :tuesday :first) '(2013 5 7))))


(ert-deftest when-first-tuesday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 6 :tuesday :first) '(2013 6 4))))


(ert-deftest when-first-wednesday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 7 :wednesday :first) '(2013 7 3))))


(ert-deftest when-first-wednesday-is-the-7th-the-last-day-of-the-first-week ()
  (should (equal (meetup 2013 8 :wednesday :first) '(2013 8 7))))


(ert-deftest when-first-thursday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 9 :thursday :first) '(2013 9 5))))


(ert-deftest when-first-thursday-is-another-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 10 :thursday :first) '(2013 10 3))))


(ert-deftest when-first-friday-is-the-1st-the-first-day-of-the-first-week ()
  (should (equal (meetup 2013 11 :friday :first) '(2013 11 1))))


(ert-deftest when-first-friday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 12 :friday :first) '(2013 12 6))))


(ert-deftest when-first-saturday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 1 :saturday :first) '(2013 1 5))))


(ert-deftest when-first-saturday-is-another-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 2 :saturday :first) '(2013 2 2))))


(ert-deftest when-first-sunday-is-some-day-in-the-middle-of-the-first-week ()
  (should (equal (meetup 2013 3 :sunday :first) '(2013 3 3))))


(ert-deftest when-first-sunday-is-the-7th-the-last-day-of-the-first-week ()
  (should (equal (meetup 2013 4 :sunday :first) '(2013 4 7))))


(ert-deftest when-second-monday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 3 :monday :second) '(2013 3 11))))


(ert-deftest when-second-monday-is-the-8th-the-first-day-of-the-second-week ()
  (should (equal (meetup 2013 4 :monday :second) '(2013 4 8))))


(ert-deftest when-second-tuesday-is-the-14th-the-last-day-of-the-second-week ()
  (should (equal (meetup 2013 5 :tuesday :second) '(2013 5 14))))


(ert-deftest when-second-tuesday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 6 :tuesday :second) '(2013 6 11))))


(ert-deftest when-second-wednesday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 7 :wednesday :second) '(2013 7 10))))


(ert-deftest when-second-wednesday-is-the-14th-the-last-day-of-the-second-week ()
  (should (equal (meetup 2013 8 :wednesday :second) '(2013 8 14))))


(ert-deftest when-second-thursday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 9 :thursday :second) '(2013 9 12))))


(ert-deftest when-second-thursday-is-another-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 10 :thursday :second) '(2013 10 10))))


(ert-deftest when-second-friday-is-the-8th-the-first-day-of-the-second-week ()
  (should (equal (meetup 2013 11 :friday :second) '(2013 11 8))))


(ert-deftest when-second-friday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 12 :friday :second) '(2013 12 13))))


(ert-deftest when-second-saturday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 1 :saturday :second) '(2013 1 12))))


(ert-deftest when-second-saturday-is-another-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 2 :saturday :second) '(2013 2 9))))


(ert-deftest when-second-sunday-is-some-day-in-the-middle-of-the-second-week ()
  (should (equal (meetup 2013 3 :sunday :second) '(2013 3 10))))


(ert-deftest when-second-sunday-is-the-14th-the-last-day-of-the-second-week ()
  (should (equal (meetup 2013 4 :sunday :second) '(2013 4 14))))


(ert-deftest when-third-monday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 3 :monday :third) '(2013 3 18))))


(ert-deftest when-third-monday-is-the-15th-the-first-day-of-the-third-week ()
  (should (equal (meetup 2013 4 :monday :third) '(2013 4 15))))


(ert-deftest when-third-tuesday-is-the-21st-the-last-day-of-the-third-week ()
  (should (equal (meetup 2013 5 :tuesday :third) '(2013 5 21))))


(ert-deftest when-third-tuesday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 6 :tuesday :third) '(2013 6 18))))


(ert-deftest when-third-wednesday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 7 :wednesday :third) '(2013 7 17))))


(ert-deftest when-third-wednesday-is-the-21st-the-last-day-of-the-third-week ()
  (should (equal (meetup 2013 8 :wednesday :third) '(2013 8 21))))


(ert-deftest when-third-thursday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 9 :thursday :third) '(2013 9 19))))


(ert-deftest when-third-thursday-is-another-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 10 :thursday :third) '(2013 10 17))))


(ert-deftest when-third-friday-is-the-15th-the-first-day-of-the-third-week ()
  (should (equal (meetup 2013 11 :friday :third) '(2013 11 15))))


(ert-deftest when-third-friday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 12 :friday :third) '(2013 12 20))))


(ert-deftest when-third-saturday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 1 :saturday :third) '(2013 1 19))))


(ert-deftest when-third-saturday-is-another-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 2 :saturday :third) '(2013 2 16))))


(ert-deftest when-third-sunday-is-some-day-in-the-middle-of-the-third-week ()
  (should (equal (meetup 2013 3 :sunday :third) '(2013 3 17))))


(ert-deftest when-third-sunday-is-the-21st-the-last-day-of-the-third-week ()
  (should (equal (meetup 2013 4 :sunday :third) '(2013 4 21))))


(ert-deftest when-fourth-monday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 3 :monday :fourth) '(2013 3 25))))


(ert-deftest when-fourth-monday-is-the-22nd-the-first-day-of-the-fourth-week ()
  (should (equal (meetup 2013 4 :monday :fourth) '(2013 4 22))))


(ert-deftest when-fourth-tuesday-is-the-28th-the-last-day-of-the-fourth-week ()
  (should (equal (meetup 2013 5 :tuesday :fourth) '(2013 5 28))))


(ert-deftest when-fourth-tuesday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 6 :tuesday :fourth) '(2013 6 25))))


(ert-deftest when-fourth-wednesday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 7 :wednesday :fourth) '(2013 7 24))))


(ert-deftest when-fourth-wednesday-is-the-28th-the-last-day-of-the-fourth-week ()
  (should (equal (meetup 2013 8 :wednesday :fourth) '(2013 8 28))))


(ert-deftest when-fourth-thursday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 9 :thursday :fourth) '(2013 9 26))))


(ert-deftest when-fourth-thursday-is-another-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 10 :thursday :fourth) '(2013 10 24))))


(ert-deftest when-fourth-friday-is-the-22nd-the-first-day-of-the-fourth-week ()
  (should (equal (meetup 2013 11 :friday :fourth) '(2013 11 22))))


(ert-deftest when-fourth-friday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 12 :friday :fourth) '(2013 12 27))))


(ert-deftest when-fourth-saturday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 1 :saturday :fourth) '(2013 1 26))))


(ert-deftest when-fourth-saturday-is-another-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 2 :saturday :fourth) '(2013 2 23))))


(ert-deftest when-fourth-sunday-is-some-day-in-the-middle-of-the-fourth-week ()
  (should (equal (meetup 2013 3 :sunday :fourth) '(2013 3 24))))


(ert-deftest when-fourth-sunday-is-the-28th-the-last-day-of-the-fourth-week ()
  (should (equal (meetup 2013 4 :sunday :fourth) '(2013 4 28))))


(ert-deftest last-monday-in-a-month-with-four-mondays ()
  (should (equal (meetup 2013 3 :monday :last) '(2013 3 25))))


(ert-deftest last-monday-in-a-month-with-five-mondays ()
  (should (equal (meetup 2013 4 :monday :last) '(2013 4 29))))


(ert-deftest last-tuesday-in-a-month-with-four-tuesdays ()
  (should (equal (meetup 2013 5 :tuesday :last) '(2013 5 28))))


(ert-deftest last-tuesday-in-another-month-with-four-tuesdays ()
  (should (equal (meetup 2013 6 :tuesday :last) '(2013 6 25))))


(ert-deftest last-wednesday-in-a-month-with-five-wednesdays ()
  (should (equal (meetup 2013 7 :wednesday :last) '(2013 7 31))))


(ert-deftest last-wednesday-in-a-month-with-four-wednesdays ()
  (should (equal (meetup 2013 8 :wednesday :last) '(2013 8 28))))


(ert-deftest last-thursday-in-a-month-with-four-thursdays ()
  (should (equal (meetup 2013 9 :thursday :last) '(2013 9 26))))


(ert-deftest last-thursday-in-a-month-with-five-thursdays ()
  (should (equal (meetup 2013 10 :thursday :last) '(2013 10 31))))


(ert-deftest last-friday-in-a-month-with-five-fridays ()
  (should (equal (meetup 2013 11 :friday :last) '(2013 11 29))))


(ert-deftest last-friday-in-a-month-with-four-fridays ()
  (should (equal (meetup 2013 12 :friday :last) '(2013 12 27))))


(ert-deftest last-saturday-in-a-month-with-four-saturdays ()
  (should (equal (meetup 2013 1 :saturday :last) '(2013 1 26))))


(ert-deftest last-saturday-in-another-month-with-four-saturdays ()
  (should (equal (meetup 2013 2 :saturday :last) '(2013 2 23))))


(ert-deftest last-sunday-in-a-month-with-five-sundays ()
  (should (equal (meetup 2013 3 :sunday :last) '(2013 3 31))))


(ert-deftest last-sunday-in-a-month-with-four-sundays ()
  (should (equal (meetup 2013 4 :sunday :last) '(2013 4 28))))


(ert-deftest when-last-wednesday-in-february-in-a-leap-year-is-the-29th ()
  (should (equal (meetup 2012 2 :wednesday :last) '(2012 2 29))))


(ert-deftest last-wednesday-in-december-that-is-also-the-last-day-of-the-year ()
  (should (equal (meetup 2014 12 :wednesday :last) '(2014 12 31))))


(ert-deftest when-last-sunday-in-february-in-a-non-leap-year-is-not-the-29th ()
  (should (equal (meetup 2015 2 :sunday :last) '(2015 2 22))))


(ert-deftest when-first-friday-is-the-7th-the-last-day-of-the-first-week ()
  (should (equal (meetup 2012 12 :friday :first) '(2012 12 7))))


(provide 'meetup-test)
;;; meetup-test.el ends here
