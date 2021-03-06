## Syntastic-Checker for MoonScript
As the name says, [Syntastic](https://github.com/scrooloose/syntastic)-Checker for [MoonScript](http://moonscript.org/)

### Intro
It's easy to install by using [NeoBundle](https://github.com/Shougo/NeoBundle.vim).
```Vim
...
"in vimrc

NeoBundle 'nymphium/syntastic-moonscript', {
\	'depends' : ['scrooloose/syntastic'],
\	'build' :  {
\		'linux' : 'make neobundle'
\		}
\	}

" `make' provides symlink 'mooncheck' to '$HOME/bin'
" or add directorypath to `make':
"...
" \	'build' :  {
" \		'linux' : 'make link BINPATH=path/to/bin'
" \		}
"...

" if you use Neovim then pass a variable `VIM=nvim`
"...
\	'build' :  {
\		'linux' : 'make neobundle VIM=nvim'
\		}
"...

let g:syntastic_moon_checkers = [..., 'moonc', 'mooncheck', ...]
let g:syntastic_moon_mooncheck_args = [.....]
```

or make
```bash
$ git clone https://github.com/Nymphium/syntastic-moonscript
$ cd syntastic-moonscript
$ make
```

### Dependencies
- (Vim)
- (MoonScript)
- [luacheck](http://luacheck.readthedocs.org/)

### Options
same as `luacheck`

### Neovim
If you use [Neovim](http://github.com/neovim/neovim), please symlink `~/.vim/syntax_checkers` to `~/.config/nvim`.

### License
[WTFPL](http://www.wtfpl.net/) v2
