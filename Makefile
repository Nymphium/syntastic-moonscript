MKDIR = mkdir
LN = ln
LUACHECK = luacheck
ECHO = echo

PLUGDIR = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTAXDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = mooncheck

ERRORMSG = "ERROR: not exist 'luacheck', install it before"

all: lnk

mk_syntaxdir: luacheckcheck
	$(MKDIR) -p $(SYNTAXDIR)

lnk: mk_syntaxdir
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK).vim $(SYNTAXDIR)
	-[ -d $(HOME)/bin ] && $(LN) -s $(PLUGDIR)/$(MOONCHECK) $(HOME)/bin

luacheckcheck:
	$(LUACHECK) --version


clean:
	-rm $(SYNTAXDIR)/$(MOONCHECK)

