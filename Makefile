


readme: README.md

%.md : %.org
	docker run -v `pwd`:/source jagregory/pandoc --from=org --to=markdown --output=$@ $<
	doctoc --title '' $@
