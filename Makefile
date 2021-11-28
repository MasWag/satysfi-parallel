TANGLED := example.saty example-manual.saty parallel.satyh

all: $(TANGLED)

clean:
	$(RM) $(TANGLED)

examples: example.pdf example-manual.pdf

doc: parallel-doc.pdf parallel-doc.html

parallel-doc.pdf: parallel-doc.saty
	satysfi $<

parallel-doc.org: parallel.org
	emacs $< --batch  --eval "(require 'org)" --eval "(require 'ox-md)" --eval '(org-org-export-to-org)'
	mv $<.org $@

parallel-doc.html: parallel-doc.org
	pandoc -s --toc --template=elegant_bootstrap_menu.html $< -o $@

parallel-doc.saty: parallel-doc.org parallel-doc.template.saty ./pandoc-satysfi-template/satysfi.lua
	pandoc -t ./pandoc-satysfi-template/satysfi.lua -s $< --template ./parallel-doc.template.saty | sed 's/\([^\]\)SATySFi/\1\\SATySFi;/g;s/\([^-\]\)LaTeX/\1\\LaTeX;/g;' > $@

%.pdf: %.saty parallel.satyh
	satysfi $<

$(TANGLED): tangle

tangle: parallel.org
	emacs --batch --eval "(require 'org)" --eval '(org-babel-tangle-file "$<")'

release: package.zip package.tar.gz

package.zip: LICENSE example.saty example-manual.saty parallel.satyh Satyristes satysfi-parallel.opam parallel-doc.pdf parallel-doc.saty satysfi-parallel-doc.opam
	zip $@ $^ 

package.tar.gz: LICENSE example.saty example-manual.saty parallel.satyh Satyristes satysfi-parallel.opam parallel-doc.pdf parallel-doc.saty satysfi-parallel-doc.opam
	tar czvf $@ $^ 

.PHONY: all clean doc tangle release
