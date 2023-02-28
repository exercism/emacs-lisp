# Hints

## General

- The expected result is an `Association List` data structure (also called `alist`), not an string, or something else. You can find more information about it in this [link](https://www.gnu.org/software/emacs/manual/html_node/elisp/Association-Lists.html). So, for the correct example, the right output would be:

  ```text
  "GATTACA" -> '((?A . 3) (?C . 1) (?G . 1) (?T . 2))
  ```

- The `?A` is the Emacs Lisp way to represent a character. You can find more information in the documentation: [link](https://www.gnu.org/software/emacs/manual/html_node/elisp/Basic-Char-Syntax.html).
