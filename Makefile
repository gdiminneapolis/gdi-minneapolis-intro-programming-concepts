DEST = _dist
SOURCES = index.html index2.html images reveal
ORIGIN = `cd .. && git remote -v | grep origin | head -1 | cut -f 2 | cut -d \  -f 1`

pusblish: $(DEST)
	cp -r $(SOURCES) $(DEST)
	rm -rf $(DEST)/reveal/.git
	(cd $(DEST) && git add --all && git commit -m "yolo" && git push -fu origin gh-pages)


$(DEST):
	mkdir -p $(DEST)
	(cd $(DEST) && git init . && git remote add origin $(ORIGIN) && git checkout --orphan gh-pages)

clean:
	rm -rf $(DEST)
