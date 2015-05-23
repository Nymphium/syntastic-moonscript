## Syntastic-Checker for MoonScript
As the name says, [Syntastic](https://github.com/scrooloose/syntastic)-Checker for [MoonScript](http://moonscript.org/)


### Intro
1. `git clone git@github.com:Nymphium/syntastic-moonscript`
2. `mkdir ~/.vim/bundle/syntastic/syntax_checkers/moon`
3. `ln -s /path/to/mooncheck.vim ~/.vim/bundle/syntastic/syntax_checkers/moon`
4. `ln -s mooncheck whenever-in-the-$PATH`

*### I'll automate all this someday...*


### Dependencies
- (Vim)
- (MoonScript)
- [luacheck](http://luacheck.readthedocs.org/)
- The Silver Searcher(`ag`)


### Options
same as `luacheck`, but only the argument which works independently(eg. `-g`, `-u`, ...)


### License
[WTFPL](http://www.wtfpl.net/) v2

