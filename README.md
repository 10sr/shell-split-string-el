[![Build Status](https://travis-ci.org/10sr/shell-split-string-el.svg?branch=master)](https://travis-ci.org/10sr/shell-split-string-el)
[![MELPA Stable](http://stable.melpa.org/packages/shell-split-string-badge.svg)](http://stable.melpa.org/#/shell-split-string)
[![MELPA](http://melpa.org/packages/shell-split-string-badge.svg)](http://melpa.org/#/shell-split-string)

shell-split-string-el
=====================

Split string using shell-like syntax.


Usage Example
-------------

`shell-split-string.el` simply provides one function: `shell-split-string`,
and it works like:

```el
(shell-split-string "abc")  ->  '("abc")
(shell-split-string "abc  def")  ->  '("abc" "def")
(shell-split-string "abc \"def ghi\"")  ->  '("abc" "def ghi")
(shell-split-string "abc 'de f'ghi") -> '("abc" "de fghi")
(shell-split-string "abc \"d\\\"ef\"") -> '("abc" "d\"ef")
```


See test cases under `test/` for more examples how this function works.


License
--------

This software is unlicensed. See `LICENSE` for more information,
