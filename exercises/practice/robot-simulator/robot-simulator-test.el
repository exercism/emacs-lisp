;;; robot-simulator-test.el --- Tests for robot-simulator (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(load-file "robot-simulator.el")
(declare-function create-robot "robot-simulator.el" (x y direction))
(declare-function move "robot-simulator.el" (robot instructions))


(ert-deftest create-robot-at-origin-facing-north ()
    (should (equal #s(robot 0 0 north)
                   (create-robot 0 0 'north))))


(ert-deftest create-robot-at-negative-position-facing-south ()
    (should (equal #s(robot -1 -1 south)
                   (create-robot -1 -1 'south))))


(ert-deftest rotating-clockwise-changes-north-to-east ()
    (should (equal #s(robot 0 0 east)
                   (move (create-robot 0 0 'north) "R"))))


(ert-deftest rotating-clockwise-changes-east-to-south ()
    (should (equal #s(robot 0 0 south)
                   (move (create-robot 0 0 'east) "R"))))


(ert-deftest rotating-clockwise-changes-south-to-west ()
    (should (equal #s(robot 0 0 west)
                   (move (create-robot 0 0 'south) "R"))))


(ert-deftest rotating-clockwise-changes-west-to-north ()
    (should (equal #s(robot 0 0 north)
                   (move (create-robot 0 0 'west) "R"))))


(ert-deftest rotating-counter-clockwise-changes-north-to-west ()
    (should (equal #s(robot 0 0 west)
                   (move (create-robot 0 0 'north) "L"))))


(ert-deftest rotating-counter-clockwise-changes-west-to-south ()
    (should (equal #s(robot 0 0 south)
                   (move (create-robot 0 0 'west) "L"))))


(ert-deftest rotating-counter-clockwise-changes-south-to-east ()
    (should (equal #s(robot 0 0 east)
                   (move (create-robot 0 0 'south) "L"))))


(ert-deftest rotating-counter-clockwise-changes-east-to-north ()
    (should (equal #s(robot 0 0 north)
                   (move (create-robot 0 0 'east) "L"))))


(ert-deftest moving-forward-one-facing-north-increments-y ()
    (should (equal #s(robot 0 1 north)
                   (move (create-robot 0 0 'north) "A"))))


(ert-deftest moving-forward-one-facing-south-decrements-y ()
    (should (equal #s(robot 0 -1 south)
                   (move (create-robot 0 0 'south) "A"))))


(ert-deftest moving-forward-one-facing-east-increments-x ()
    (should (equal #s(robot 1 0 east)
                   (move (create-robot 0 0 'east) "A"))))


(ert-deftest moving-forward-one-facing-west-decrements-x ()
    (should (equal #s(robot -1 0 west)
                   (move (create-robot 0 0 'west) "A"))))


(ert-deftest follow-series-of-instructions-moving-east-and-north-from-README ()
    (should (equal #s(robot 9 4 west)
                   (move (create-robot 7 3 'north) "RAALAL"))))


(ert-deftest follow-series-of-instructions-moving-west-and-north ()
    (should (equal #s(robot -4 1 west)
                   (move (create-robot 0 0 'north) "LAAARALA"))))


(ert-deftest follow-series-of-instructions-moving-west-and-south ()
    (should (equal #s(robot -3 -8 south)
                   (move (create-robot 2 -7 'east) "RRAAAAALA"))))


(ert-deftest follow-series-of-instructions-moving-east-and-north ()
    (should (equal #s(robot 11 5 north)
                   (move (create-robot 8 4 'south) "LAAARRRALLLL"))))


(provide 'robot-simulator-test)
;;; robot-simulator-test.el ends here
