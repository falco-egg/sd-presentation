# --- Makefile ---
TEX=pdflatex -extra-mem-top=50000000 -extra-mem-bot=10000000 -main-memory=90000000
BIB=biber

.PHONY: open-handout open-presentation clean

all: handout.pdf presentation.pdf clean

open-presentation: presentation.pdf
	@if pgrep xpdf > /dev/null ; then\
		echo "FOUND XPDF INSTANCE, SENDING RELOAD";\
		xpdf -remote latexviewer reload;\
	else \
		echo "STARTING XPDF";\
		xpdf -remote latexviewer "openFile($<)"&\
	fi

open-handout: handout.pdf
	@if pgrep xpdf > /dev/null ; then\
		echo "FOUND XPDF INSTANCE, SENDING RELOAD";\
		xpdf -remote latexviewer reload;\
	else \
		echo "STARTING XPDF";\
		xpdf -remote latexviewer "openFile($<)"&\
	fi

handout.pdf: handout.tex
	$(TEX) $< -draftmode
	$(BIB) handout
	$(TEX) $< -jobname=$@

presentation.pdf: presentation.tex
	$(TEX) $< -draftmode
	$(BIB) presentation
	$(TEX) $< -draftmode
	$(TEX) $< -jobname=$@

clean:
	rm -f handout.aux handout.bbl handout.bcf handout.blg handout.log handout.out handout.run.xml
	rm -f presentation.aux presentation.bbl presentation.bcf presentation.blg presentation.log presentation.nav presentation.out presentation.run.xml presentation.snm presentation.toc presentation.vrb
