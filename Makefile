publish:
	-rmdir npm-prepublishOnlyLOCKED
	pnpm publish --access=public --no-git-checks

test-all: test

test:
	$(BROWSER) *.html

prettier:
	prettier --parser html --use-tabs --tab-width 2 --write images/*.svg
	prettier --single-quote --trailing-comma all --use-tabs --tab-width 4 --write *.html $(SRC) $(TESTS)

depends:
	pnpm ls
	@echo ""
	pnpm run check

.PHONY: publish

.PHONY: test

.PHONY: test-all

.PHONY: prettier

.PHONY: depends
