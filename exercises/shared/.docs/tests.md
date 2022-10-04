# Tests

Tests can be run several ways:

1. Open test file, `M-x eval-buffer RET`
2. Interactively and individually, with `M-x ert RET test-name RET`
3. Interactively and all at once, with `M-x ert RET t RET`
4. From the terminal, in batch mode, with `emacs -batch -l ert -l my-test.el -f ert-run-tests-batch-and-exit`
5. Other options can be found in the docs, `C-h i m ert RET`
