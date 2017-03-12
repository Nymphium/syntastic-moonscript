MKDIR=mkdir
LN=ln
ECHO=echo
CP=cp
RM=rm
LUACHECK=luacheck
BINPATH ?= $(HOME)/bin

VIM ?= nvim
NVIM_LINKDIR=$(HOME)/.config/nvim/syntax_checkers

PLUGDIR_=$(HOME)/.vim/bundle/syntastic-moonscript
SYNTAXDIR=$(HOME)/.vim/syntax_checkers
SYNTAXDIR_MOON=$(SYNTAXDIR)/moon
FTPLUGINDIR=$(PLUGDIR)/ftplugin
FTPLUGIN=$(FTPLUGINDIR)/moon.vim
MOONCHECK=mooncheck
MOONC=moonc
MOONCLINT=moonclint
BRSCRIPT=git_current_branch.sh

BRANCH=$(shell ./$(BRSCRIPT))

ifneq ($(BRANCH),master)
	PLUGDIR=$(PLUGDIR_)_$(BRANCH)
else
	PLUGDIR=$(PLUGDIR_)
endif

PLUGCONTENTS=$(addprefix $(PLUGDIR)/, $(MOONCHECK) $(MOONCLINT) $(BRSCRIPT))
SYNTAXCONTENTS=$(addprefix $(SYNTAXDIR_MOON)/, $(MOONCHECK).vim $(MOONC).vim)

ERRORMSG="ERROR: not exist 'luacheck', install it before"

.PHONY: all neobundle mkdir link luacheckcheck clean

local_neobundle: neobundle $(PLUGCONTENTS) $(SYNTAXCONTENTS)

link: luacheckcheck mkdir
	-$(LN) -s $(PLUGDIR)/$(MOONCHECK) $(BINPATH)
	-$(LN) -s $(PLUGDIR)/$(MOONCLINT) $(BINPATH)

neobundle: luacheckcheck mkdir
	$(ECHO) 'let g:syntastic_moon_$(MOONCHECK)_exec = "$(PLUGDIR)/$(MOONCHECK)"' > $(FTPLUGIN)
	$(ECHO) 'let g:syntastic_moon_$(MOONC)_exec = "$(PLUGDIR)/$(MOONCLINT)"' >> $(FTPLUGIN)

$(PLUGCONTENTS) $(SYNTAXCONTENTS):
	$(CP) $(PWD)/$(shell basename $@) $@

mkdir: $(FTPLUGINDIR) $(SYNTAXDIR_MOON) $(NVIM_LINKDIR)

$(FTPLUGINDIR) $(SYNTAXDIR_MOON):
	$(MKDIR) -p $@

luacheckcheck:
	$(LUACHECK) --version || $(ECHO) $(ERRORMSG)

$(NVIM_LINKDIR):
ifeq ($(VIM),nvim)
	$(LN) -s $(SYNTAXDIR) $@
endif

clean:
	-$(RM) $(SYNTAXCONTENTS)
	-$(RM) -r $(PLUGDIR)
	-$(RM) $(BINPATH)/$(MOONCHECK)
	-$(RM) $(BINPATH)/$(MOONCLINT)
	-$(RM) $(NVIM_LINKDIR)

