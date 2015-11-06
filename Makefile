MKDIR = mkdir
LN = ln
ECHO = echo
MAKE = make
CP = cp
RM = rm
LUACHECK = luacheck
BINPATH ?= $(HOME)/bin
INIT = ftplugin/init.vim

PLUGDIR = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTASTICDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = mooncheck
MOONC = moonc
MOONCLINT = moonclint

ERRORMSG = "ERROR: not exist 'luacheck', install it before"

.PHONY: all neobundle mk_syntaxdir lnk luacheckcheck clean

all: lnk
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK) $(BINPATH)
	-$(LN) -s $(PLUGDIR)/$(MOONC) $(BINPATH)

neobundle: lnk
	$(ECHO) 'let g:syntastic_moon_mooncheck_exec = "$(PLUGDIR)/$(MOONCHECK)"' >> $(INIT)
	$(ECHO) 'let g:syntastic_moon_moonc_exec = "$(PLUGDIR)/$(MOONCLINT)"' >> $(INIT)

mk_syntaxdir: luacheckcheck
	$(MKDIR) -p $(SYNTASTICDIR)

lnk: mk_syntaxdir
	-$(CP) $(PLUGDIR)/$(MOONCHECK).vim $(SYNTASTICDIR)
	-$(CP) $(PLUGDIR)/$(MOONC).vim $(SYNTASTICDIR)

luacheckcheck: clean
	$(LUACHECK) --version


clean:
	-$(RM) $(SYNTASTICDIR)/$(MOONCHECK).vim
	-$(RM) $(SYNTASTICDIR)/$(MOONC).vim
	-$(RM) $(BINPATH)/$(MOONCHECK)
	-$(RM) $(BINPATH)/$(MOONCLINT)

