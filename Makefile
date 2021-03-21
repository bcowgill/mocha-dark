test-all: test

test:
	$(BROWSER) *.html

prettier:
	prettier --single-quote --trailing-comma all --use-tabs --tab-width 4 --write *.html $(SRC) $(TESTS)

depends:
	pnpm ls
	@echo ""
	pnpm run check

.PHONY: test

.PHONY: test-all

.PHONY: prettier

.PHONY: depends
