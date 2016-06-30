MKDIR = mkdir
LN = ln
ECHO = echo
MAKE = make
CP = cp
RM = rm
LUACHECK = luacheck
BINPATH ?= $(HOME)/bin
FTPLUGIN = ftplugin/moon.vim

PLUGDIR_ = $(HOME)/.vim/bundle/syntastic-moonscript
SYNTASTICDIR = $(HOME)/.vim/syntax_checkers/moon
MOONCHECK = mooncheck
MOONC = moonc
MOONCLINT = moonclint

BRANCH = $(shell ./git_current_branch.sh)

ifneq ($(BRANCH),master)
	PLUGDIR = $(PLUGDIR_)_$(BRANCH)
else
	PLUGDIR = $(PLUGDIR_)
endif


ERRORMSG = "ERROR: not exist 'luacheck', install it before"

.PHONY: all neobundle mk_syntaxdir lnk luacheckcheck clean

all: lnk
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK) $(BINPATH)
	-$(LN) -s $(PLUGDIR)/$(MOONCLINT) $(BINPATH)

neobundle: lnk
	$(ECHO) 'let g:syntastic_moon_mooncheck_exec = "$(PLUGDIR)/$(MOONCHECK)"' > $(FTPLUGIN)
	$(ECHO) 'let g:syntastic_moon_moonc_exec = "$(PLUGDIR)/$(MOONCLINT)"' >> $(FTPLUGIN)

mk_syntaxdir: luacheckcheck
	$(MKDIR) -p $(SYNTASTICDIR)

lnk: mk_syntaxdir
	-$(CP) $(PLUGDIR_)/$(MOONCHECK).vim $(SYNTASTICDIR)
	-$(CP) $(PLUGDIR_)/$(MOONC).vim $(SYNTASTICDIR)

luacheckcheck: clean
	$(LUACHECK) --version


clean:
	-$(RM) $(SYNTASTICDIR)/$(MOONCHECK).vim
	-$(RM) $(SYNTASTICDIR)/$(MOONC).vim
	-$(RM) $(BINPATH)/$(MOONCHECK)
	-$(RM) $(BINPATH)/$(MOONCLINT)
	-$(RM) $(FTPLUGIN)

