DEST = _dist
SOURCES = index.html index2.html images reveal


pusblish: $(DEST)
	cp -r $(SOURCES) $(DEST)
	rm -rf $(DEST)/reveal/.git
	(cd $(DEST) && git add --all && git commit "yolo" && git push -fu origin gh-pages)


$(DEST):
	mkdir -p $(DEST)
	(cd $(DEST) && git init . && git checkout --orphan gh-pages)
