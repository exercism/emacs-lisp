# Tests

Tests can be run several ways.

## Interactively from within Emacs

1. Open test file, `M-x eval-buffer RET`
2. Interactively and individually, with `M-x ert RET test-name RET`
3. Interactively and all at once, with `M-x ert RET t RET`
   Note that this will run all tests currently loaded into Emacs!
4. Rerun `M-x eval-buffer RET` before testing whenever you've made changes

To only execute the tests in the current buffer you can add this to your `.emacs` or `init.el`:

```elisp
(defun my-eval-and-run-all-tests-in-buffer ()
  "Deletes all loaded tests from the runtime, evaluates the current buffer and runs all loaded tests with ert."
  (interactive)
  (ert-delete-all-tests)
  (eval-buffer)
  (ert 't))
```

After restarting Emacs:

1. Open test file
2. `M-x my-eval-and-run-all-tests-in-buffer RET`

## From the terminal

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

## Other options

Other options can be found in the docs, `C-h i m ert RET`.
