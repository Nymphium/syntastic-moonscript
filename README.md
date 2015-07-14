## Syntastic-Checker for MoonScript
As the name says, [Syntastic](https://github.com/scrooloose/syntastic)-Checker for [MoonScript](http://moonscript.org/)

### Intro
It's easy to install by using [NeoBundle](https://github.com/Shougo/NeoBundle.vim).
```Vim
...
"in vimrc

NeoBundle 'nymphium/syntastic-moonscript', {
\	'build' :  {
\		'linux' : 'make'
\		}
\	}

...

let g:syntastic_moon_checkers = ['/home/nymphiu/.vim/bundle/syntastic-mooncheck/mooncheck']
" or symlink `mooncheck' to a dir in $PATH
```

### Dependencies
- (Vim)
- (MoonScript)
- [luacheck](http://luacheck.readthedocs.org/)
- The Silver Searcher(`ag`)

### Options
same as `luacheck`, but only the argument which works independently(eg. `-g`, `-u`, ...)

### License
[WTFPL](http://www.wtfpl.net/) v2
