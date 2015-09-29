MKDIR = mkdir
LN = ln
ECHO = echo
MAKE = make
CP = cp
RM = rm
LUACHECK = luacheck
BINPATH ?= $(HOME)/bin

PLUGDIR = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTASTICDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = mooncheck
MOONC = moonc

ERRORMSG = "ERROR: not exist 'luacheck', install it before"

.PHONY: all neobundle mk_syntaxdir lnk luacheckcheck clean

all: lnk
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK) $(BINPATH)
	-$(LN) -s $(PLUGDIR)/$(MOONC) $(BINPATH)

neobundle: lnk
	$(ECHO) 'let g:syntastic_moon_mooncheck_exec = "$(PLUGDIR)/mooncheck"' >> $(SYNTASTICDIR)/$(MOONCHECK).vim
	$(ECHO) 'let g:syntastic_moon_moonc_exec = "$(PLUGDIR)/mooncheck"' >> $(SYNTASTICDIR)/$(MOONC).vim

mk_syntaxdir: luacheckcheck
	$(MKDIR) -p $(SYNTASTICDIR)

lnk: mk_syntaxdir
	-$(CP) $(PLUGDIR)/$(MOONCHECK).vim $(SYNTASTICDIR)
	-$(CP) $(PLUGDIR)/$(MOONC).vim $(SYNTASTICDIR)

luacheckcheck:
	$(LUACHECK) --version


clean:
	-$(RM) $(SYNTASTICDIR)/$(MOONCHECK).vim
	-$(RM) $(SYNTASTICDIR)/$(MOONC).vim
	-$(RM) $(BINPATH)/$(MOONCHECK)
	-$(RM) $(BINPATH)/$(MOONC)

