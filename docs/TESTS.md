# Running tests

Elisp tests are run using [ERT](http://www.emacswiki.org/emacs/ErtTestLibrary), an Emacs Lisp library for regression/unit
testing. Tests can be run several ways.

To run the tests interactively from within Emacs:

1. Open test file, `M-x eval-buffer RET`
2. Interactively and individually, with `M-x ert RET test-name RET`
3. Interactively and all at once, with `M-x ert RET t RET`
   Note that this will run all tests currently loaded into Emacs!
4. Rerun `M-x eval-buffer RET` before testing whenever you've made changes

To only execute the tests in the current buffer you can add this to your `.emacs` or `init.el`:

```elisp
(defun my-eval-and-run-all-tests-in-buffer ()
  "Delete all loaded tests from the runtime, evaluate the current buffer and run all loaded tests with ert."
  (interactive)
  (ert-delete-all-tests)
  (eval-buffer)
  (ert 't))
```

After restarting Emacs:

1. Open test file
2. `M-x my-eval-and-run-all-tests-in-buffer RET`

Interactive testing is great while you're working on an exercise, but batch mode
testing is preferable for when you want to check that an exercise is ready for
submission.

To run run all tests from the terminal, in batch mode, execute `emacs -batch -l ert -l *-test.el -f ert-run-tests-batch-and-exit`

The above command is a bit unwieldy, so if you like:

1. Create a file on your `$PATH` (probably in `~/bin`) called `ert-run`
2. The contents of the file should be as follows:
   ```sh
   #!/usr/bin/env sh
   emacs -batch -l ert -l $1 -f ert-run-tests-batch-and-exit
   ```
3. Make the file executable with `chmod +x ert-run`

You should be able to simply call `ert-run *-test.el` and run the tests
in batch mode.

Other options can be found in the docs, `C-h i m ert RET`.

## Working on exercises
Since Emacs is, itself, an elisp interpreter, your working code is always in its
native execution environment. You can evaluate any form by pressing `C-x e` at
the end of the form, or a selection with `M-x eval-region` or the whole buffer
with `M-x eval-buffer`. This can be extremely useful for quickly debugging your
code.

## Suggestions
Since both your code and tests are valid elisp, it is suggested to work with
your exercise code in a buffer pane side-by side with its test, like so:

![](/docs/img/dual-pane.png)

Split the frame vertically with `C-x 3`, switch to the new window with `C-x o`,
and open the file with `C-x C-f /path/to/file`.
