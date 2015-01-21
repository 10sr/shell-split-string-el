(require 'shell-split-string)

(defmacro ert-sss-should-equal (str result)
  "Judge if `shell-split-string' returns expected RESULT from STR."
  `(should (equal (shell-split-string ,str)
                  ,result))
  )

(defmacro ert-sss-should-error (str)
  "Judge if `shell-split-string' throws error with arg STR."
  `(should-error (shell-split-string ,str)))

(defmacro ert-sss-inverse-check (args)
  "Check if `shell-split-string' is an inverse function of `mapconcat' and
 `shell-quote-argument' by ARGS."
  `(should (equal (shell-split-string (mapconcat 'shell-quote-argument
                                                  ,args
                                                  " "))
                  ,args)))

(ert-deftest test-shell-split-string ()
  (ert-sss-should-equal ""
                        '())
  (ert-sss-should-equal "abc"
                        '("abc"))
  (ert-sss-should-equal "abc def"
                        '("abc" "def"))
  (ert-sss-should-equal " abc def "
                        '("abc" "def"))
  (ert-sss-should-equal "abc  def"
                        '("abc" "def"))
  (ert-sss-should-equal "abc \"def\""
                        '("abc" "def"))
  (ert-sss-should-equal "abc 'def'"
                        '("abc" "def"))
  (ert-sss-should-equal "abc  \"def\""
                        '("abc" "def"))
  (ert-sss-should-equal "abc \"def  ghi\""
                        '("abc" "def  ghi"))
  (ert-sss-should-equal "abc 'def  ghi'"
                        '("abc" "def  ghi"))
  (ert-sss-should-equal "abc \"d\\\"ef\""
                        '("abc" "d\"ef"))
  (ert-sss-should-equal "abc \"d'ef\""
                        '("abc" "d'ef"))
  (ert-sss-should-equal "abc 'de f'ghi"
                        '("abc" "de fghi"))
  (ert-sss-should-equal "abc def'gh i'"
                        '("abc" "defgh i"))
  (ert-sss-should-equal "abc de'fg  h'i"
                        '("abc" "defg  hi"))
  (ert-sss-should-equal "a\\bc"
                        '("abc"))
  (ert-sss-should-equal "a\\ bc"
                        '("a bc"))
  (ert-sss-should-equal "\"a\\bc\""
                        '("a\\bc"))
  (ert-sss-should-equal "'a\\bc'"
                        '("a\\bc"))
  (ert-sss-should-equal "abc && def"
                        '("abc" "&&" "def"))
  (ert-sss-should-equal "abc あいう"
                        '("abc" "あいう"))

  (ert-sss-should-error "abc \"def")

  (ert-sss-inverse-check '("ab c" "de f"))
  (ert-sss-inverse-check '("ab\""))
  )
