# VIM Setting
Primarily forked from [https://github.com/amix/vimrc](https://github.com/amix/vimrc).

I currently use the `vimrcs/basic.vim` with neovim (see comments at the bottom of that file).

The `.vimrc` file is as follows to enable config `basic.vim`.

```
set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/vimrcs/basic.vim
```


Also, have to remap some keybindings in iTerm2 for some plugins to work
- tpope/commentary.vim: Use `cmd + /` to comment out code. Add `Cmd/` as `send hex codes: 0x67 0x63`. 
- coc-explorer: use `cmd + b` to open the file explorer. Add `cmd b` as `send: ":CocCommand explore\n"` (send with vim special characters)
- also use `option + up/down arrow` to move code around



For coc, we need to install `node` and `npm`.  (on linux, use `sudo apt-get install npm`)

At google, in order to avoid indexing the large codebase, have to
- remove vim-rooter to make sure telescope only search locally.
- Put `"coc.preferences.rootPatterns": []` in CocConfig.

Have to also install ctags for plugin 'preservim/tagbar' to work.

mosh (faster ssh) doesn't have truecolor, so will need to add `set notermguicolors` to the config when using mosh.
