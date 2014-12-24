[![Build Status](https://travis-ci.org/10sr/shell-split-string-el.svg?branch=master)](https://travis-ci.org/10sr/shell-split-string-el)

shell-split-string-el
=====================

Split string using shell-like syntax.


Usage Example
-------------

`shell-split-string.el` simply provides one function: `shell-split-string`,
and it works as follows:

```el
(shell-split-string "abc")  ->  '("abc")
(shell-split-string "abc  def")  ->  '("abc" "def")
(shell-split-string "abc \"def ghi\"")  ->  '("abc" "def ghi")
```


See test cases under `test/` for more examples how this function works.
