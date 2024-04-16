# stupid-dotfiles

The stupid dotfiles manager for symbolically linking dotfiles from the current working directory to
the home directory only if that file does not already exist in the home directory. It also creates
a directory if the file is in a subdirectory.

## Getting Started

### Operating System Compatibility

| OS             | Status  |
| :------------- | :-----: |
| Linux          |   ✅    |
| macOS          |   ✅    |
| Windows (WSL2) |   ✅    |

### Basic Installation

First, download the main script file to the `~/.local/bin` directory:

| Method    | Command                                                                                                   |
| :-------- | :-------------------------------------------------------------------------------------------------------- |
| **curl**  | `mkdir -p ~/.local/bin && curl https://raw.githubusercontent.com/sidthidet-k/stupid-dotfiles/main/stupid-dotfiles.sh -o ~/.local/bin/stupid-dotfiles` |
| **wget**  | `mkdir -p ~/.local/bin && wget https://raw.githubusercontent.com/sidthidet-k/stupid-dotfiles/main/stupid-dotfiles.sh -O ~/.local/bin/stupid-dotfiles` |
| **fetch** | `mkdir -p ~/.local/bin && fetch https://raw.githubusercontent.com/sidthidet-k/stupid-dotfiles/main/stupid-dotfiles.sh -o ~/.local/bin/stupid-dotfiles`|

If `~/.local/bin` is not in the PATH environment variable, add the following command to `~/.bashrc` file for Bash:

```sh
PATH=$PATH:~/.local/bin
```

or to `~/.zshrc` file for Zsh:

```sh
path+=(~/.local/bin)
```

## Using stupid-dotfiles

First, mark any directory for stupid-dotfiles by creating a `.stupid-dotfiles-ignore` file to specify files
to ignore (stupid-dotfiles will error if `.stupid-dotfiles-ignore` file does not exist):

```sh
touch .stupid-dotfiles-ignore
```

By default, the following files are ignored:
* .stupid-dotfiles-ignore
* .git/*
* .gitignore
* README.md

Now you can create dotfiles:

```sh
touch .vimrc
```

Run the stupid-dotfiles command:

```sh
stupid-dotfiles
```

Alternatively, you can use stupid-dotfiles without installing it because it is only a single bash script file:

| Method    | Command                                                                                                   |
| :-------- | :-------------------------------------------------------------------------------------------------------- |
| **curl**  | `sh -c "$(curl -fsSL https://raw.githubusercontent.com/sidthidet-k/stupid-dotfiles/main/stupid-dotfiles.sh)"` |
| **wget**  | `sh -c "$(wget -O- https://raw.githubusercontent.com/sidthidet-k/stupid-dotfiles/main/stupid-dotfiles.sh)"`   |
| **fetch** | `sh -c "$(fetch -o - https://raw.githubusercontent.com/sidthidet-k/stupid-dotfiles/main/stupid-dotfiles.sh)"` |

Then it symbolically links `.vimrc` from the current directory to the home directory.

## Example

In the dotfiles directory:

* .stupid-dotfiles-ignore
* .git/
* .gitignore
* README.md
* .vimrc
* .config/nvim/init.vim

In the home directory:

* .vimrc (symbolic link)
* .config/nvim/init.vim (symbolic link)
