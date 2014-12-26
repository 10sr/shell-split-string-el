(require 'ert)
(require 'shell-split-string)

(defmacro ert-sss-should-equal (str result)
  "Judge if `shell-split-string' returns expected RESULT from STR."
  `(should (equal (shell-split-string ,str)
                  ,result))
  )

(ert-deftest test-shell-split-string ()
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
  (ert-sss-should-equal "\"a\\bc\""
                        '("a\\bc"))
  (ert-sss-should-equal "'a\\bc'"
                        '("a\\bc"))
  (ert-sss-should-equal "abc && def"
                        '("abc" "&&" "def"))
  )
