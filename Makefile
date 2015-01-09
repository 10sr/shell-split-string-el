EMACS ?= emacs24

TESTS_EL = $(wildcard test/*.el)

.PHONY: all test

all:

test: $(TESTS_EL)
	$(EMACS) -batch -Q -L . \
		--eval "(add-to-list 'command-line-functions (lambda () (load-file argi) (or command-line-args-left (ert-run-tests-batch-and-exit))))" \
		$(TESTS_EL)
