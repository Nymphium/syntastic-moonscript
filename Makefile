MKDIR = mkdir
LN = ln
LUACHECK = luacheck
ECHO = echo

PLUGDIR = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTAXDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = moonckeck.vim

ERRORMSG = "ERROR: not exist 'luacheck', install it before"

all: lnk

mk_syntaxdir: luacheckcheck
	$(MKDIR) -p $(SYNTAXDIR)

lnk: mk_syntaxdir
	$(LN) -sf $(PLUGDIR)/$(MOONCHECK) $(SYNTAXDIR)

luacheckcheck:
	$(LUACHECK) --version


clean:
	-rm $(SYNTAXDIR)/$(MOONCHECK)

