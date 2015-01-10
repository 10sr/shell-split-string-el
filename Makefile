emacs ?= emacs24

tests_el = $(wildcard test/*.el)

.PHONY: all test

all:

test: $(tests_el)
	$(emacs) -batch -Q -L . \
		--eval "(require 'ert)" \
		--eval "(add-hook 'command-line-functions (lambda () (load-file argi) (or command-line-args-left (ert-run-tests-batch-and-exit))))" \
		$^
