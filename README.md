# [Demas'](https://github.com/amdemas) dotfiles

## Setup

To setup the dotfiles just run one of the following snippets in the terminal:

| OS | Snippet |
|:---:|:---|
| OS X | `bash -c "$(curl -LsS https://raw.github.com/amdemas/dotfiles/master/dotfiles)"` |
| Ubuntu | `bash -c "$(wget -qO - https://raw.github.com/amdemas/dotfiles/master/dotfiles)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will suggest
  `~/projects/dotfiles`)
* Create some additional [directories](os/create_directories.sh)
* [Copy](os/copy_files.sh) / [Symlink](os/create_symbolic_links.sh) the
  [git](git),
  [shell](shell), and
  [vim](vim) files
* Install applications / command-line tools for
  [OS X](os/os_x/install_applications.sh) /
  [Ubuntu](os/ubuntu/install_applications.sh)
* Set custom
  [OS X](os/os_x/set_preferences.sh) /
  [Ubuntu](os/ubuntu/set_preferences.sh) preferences
* Install [vim plugins](vim/vim/plugins)


## Customize

### Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

If the `~/.bash.local` file exist, it will be automatically sourced
after all the other [bash related
files](https://github.com/amdemas/dotfiles/tree/master/shell), thus,
allowing its content to add to or overwrite the existing aliases,
settings, PATH, etc.


## Update

To update the dotfiles, just run the [`dotfiles`](dotfiles) script.

```bash
$ ./dotfiles
```

The update process will do basically the same things as [setup](#setup),
but instead of downloading the dotfiles, it will just fetch the
latest changes.


## Acknowledgements

Inspiration and code was taken from many sources, including:

* [Mathias Bynens'](https://github.com/mathiasbynens)
  [dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Nicolas Gallagher's](https://github.com/necolas)
  [dotfiles](https://github.com/necolas/dotfiles)
* [Cătălin](https://github.com/alrra)
  [dotfiles](https://github.com/alrra/dotfiles)

## License

The code is available under the [MIT license](LICENSE.md).
