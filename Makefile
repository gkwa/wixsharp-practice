7Z = 7z

FILES =
FILES += dist/Processing.NDI.Lib.x86.dll
FILES += dist/channels.xml
FILES += dist/sb-hd-bmp.bmp
FILES += dist/sbxconfig.exe
FILES += dist/sbxlogo.raw
FILES += dist/sbxnetcam.exe

dist: $(FILES)
$(FILES): sbxcam_ndi.7z
	$(7Z) x -odist -y $^ >/dev/null

sbxcam_ndi.7z:
	curl -LO https://www.dropbox.com/s/38qylc77urezoem/sbxcam_ndi.7z

doc: 'Streambox add-on for Tricaster Quick Start Guide 1.pdf'
'Streambox add-on for Tricaster Quick Start Guide 1.pdf':
	curl -LO 'http://dl.dropbox.com/u/9140609/sb/ephemeral/Streambox add-on for Tricaster Quick Start Guide 1.pdf'

readme: README.md

%.md : %.org
	docker run -v `pwd`:/source jagregory/pandoc --from=org --to=markdown --output=$@ $<
	doctoc --title '' $@

clean:
	rm -f MyProduct.msi
	rm -rf dist/
	rm -f sbxcam_ndi.7z
	rm -f sbxcam_ndi.msi

distclean:
	$(MAKE) clean
	rm -rf .vs/
	rm -f WixSharp.dll
	rm -rf bin/
	rm -f cscs.exe
	rm -rf obj/
	rm -rf wix/
