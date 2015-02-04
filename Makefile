emacs ?= emacs

tests_el = $(wildcard test/*.el)

.PHONY: all test

all:

test: $(tests_el)
	$(emacs) -batch -Q -L . --eval "(require 'ert)" $(^:%=-l "%") \
		-f ert-run-tests-batch-and-exit
