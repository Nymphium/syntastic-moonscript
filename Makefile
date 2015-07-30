MKDIR = mkdir
LN = ln
LUACHECK = luacheck
ECHO = echo
BINPATH ?= $(HOME)/bin

PLUGDIR = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTAXDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = mooncheck

ERRORMSG = "ERROR: not exist 'luacheck', install it before"

all: lnk

mk_syntaxdir: luacheckcheck
	$(MKDIR) -p $(SYNTAXDIR)

lnk: mk_syntaxdir
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK).vim $(SYNTAXDIR)
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK) $(BINPATH)

luacheckcheck:
	$(LUACHECK) --version


clean:
	-rm $(SYNTAXDIR)/$(MOONCHECK).vim
	-rm $(BINPATH)/$(MOONCHECK)

