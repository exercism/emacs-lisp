# Learning

## Starting out with Emacs

So you've installed Emacs. Now what?

Well, you can start the tutoral by pressing `C-h t`, and that's not a bad place
to start. The tutorial will teach you the basics of editing, searching, and navigating in Emacs.

If you're completely new to Emacs, it can make sense to grab a starter kit,
which comes with a set of configurations and packages already set up.

The [Emacs Prelude](http://batsov.com/prelude/) package offers a
nice set of sensible defaults and packages.

To install Emacs Prelude run the following in a terminal:

```
curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
```

and make sure to check out the [installation guide](https://prelude.emacsredux.com/en/latest/installation/) for further instructions.


If you are familiar with vim you might be interested in the [Doom Emacs](https://github.com/doomemacs/doomemacs) starter kit, which integrates vim emulation powered by [evil-mode](https://github.com/emacs-evil/evil).

To install Doom Emacs run the following in a terminal:

```
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

and make sure to check the [installation guide](https://github.com/doomemacs/doomemacs#install) for further instructions.

## Setting up syntax checking and linting

Setting up syntax checking and linting with [Flycheck](https://www.flycheck.org/en/latest/) is recommended.

If you don't already have added the [MELPA](https://melpa.org/) repository to your Emacs, do this by adding the following to your [init file](https://www.flycheck.org/en/latest/glossary.html#term-init-file)

```elisp
(require 'package)

(add-to-list 'package-archives
             '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
```

Installation and setup of Flycheck without [use-package](https://github.com/jwiegley/use-package) is done by adding the following to your [init file](https://www.flycheck.org/en/latest/glossary.html#term-init-file)

```elisp
(package-install 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
```

Installation and setup of Flycheck with [use-package](https://github.com/jwiegley/use-package) is done by adding the following to your [init file](https://www.flycheck.org/en/latest/glossary.html#term-init-file)

```elisp
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
```

For further information and trouble shooting please check the [Flycheck documentation](https://www.flycheck.org/en/latest/user/troubleshooting.html).

## Learning Emacs Lisp

The best documentation on Emacs Lisp is... shipped with Emacs itself!
to access the
[Emacs Lisp Reference](https://www.gnu.org/software/emacs/manual/elisp.html),
type `C-h i` and find the Elisp entry, or select Help &rarr; More Manuals
&rarr; Emacs Lisp Reference.  Note that the manual may be missing in some
distributions, in which case you can find
it [online](https://www.gnu.org/software/emacs/manual/elisp.html).

If you are brand new to Elisp, you can read the
[Introduction to Emacs Lisp](http://www.emacswiki.org/emacs/EmacsLispIntro),
which is opened the same way.

## Emacs Lisp best practices and conventions

The Emacs Manual contains a section on Emacs Lisp [Coding Conventions](https://www.gnu.org/software/emacs/manual/html_node/elisp/Coding-Conventions.html).
There is also a community driven [Style Guide](https://github.com/bbatsov/emacs-lisp-style-guide) maintained on GitHub.
