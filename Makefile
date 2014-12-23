EMACS ?= emacs24

TESTS_EL = $(wildcard test/*.el)
TESTS = $(TESTS_EL:test/%.el=%.el)
TESTS_RUN = $(TESTS:%.el=%.run)

.PHONY: all test

all:

test: $(TESTS_RUN)

$(TESTS_RUN): %.run: test/%.el %.el
	$(EMACS) -batch -Q -L . -l $< -f ert-run-tests-batch-and-exit
