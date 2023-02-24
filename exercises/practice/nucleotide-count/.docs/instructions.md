# Instructions

Each of us inherits from our biological parents a set of chemical instructions known as DNA that influence how our bodies are constructed.
All known life depends on DNA!

> Note: You do not need to understand anything about nucleotides or DNA to complete this exercise.

DNA is a long chain of other chemicals and the most important are the four nucleotides, adenine, cytosine, guanine and thymine.
A single DNA chain can contain billions of these four nucleotides and the order in which they occur is important!
We call the order of these nucleotides in a bit of DNA a "DNA sequence".

We represent a DNA sequence as an ordered collection of these four nucleotides and a common way to do that is with a string of characters such as "ATTACG" for a DNA sequence of 6 nucleotides.
'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' for thymine.

Given a string representing a DNA sequence, count how many of each nucleotide is present.
If the string contains characters that aren't A, C, G, or T then it is invalid and you should signal an error.

For example:

```text
"GATTACA" -> '((?A . 3) (?C . 1) (?G . 1) (?T . 2))
"INVALID" -> error
```

Hints:

1. The `?A` is the Emacs Lisp way to represent a character. You can find more information in the documentation: [link](https://www.gnu.org/software/emacs/manual/html_node/elisp/Basic-Char-Syntax.html).
2. The structure mentioned in the correct example is called `Association List`, or `alist`. You can find more information about it in this [link](https://www.gnu.org/software/emacs/manual/html_node/elisp/Association-Lists.html).