MKDIR = mkdir
LN = ln
PLUGDIR = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTAXDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = moonckeck.vim

all: lnk

mk_syntaxdir:
	$(MKDIR) -p $(SYNTAXDIR)

lnk: mk_syntaxdir
	$(LN) -sf $(PLUGDIR)/$(MOONCHECK) $(SYNTAXDIR)

clean:
	rm $(SYNTAXDIR)/$(MOONCHECK) || :

