


WixSharp.dll:
	cp '/c/Program Files/WixSharp.1.0.28.0/WixSharp.dll' .

readme: README.md

%.md : %.org
	docker run -v `pwd`:/source jagregory/pandoc --from=org --to=markdown --output=$@ $<
	doctoc --title '' $@
