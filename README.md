# setup-my-pc
Easy installation of things on the fresh pc (or not)

## Notes
- **Setup my pc** is a _Command Line Tool_ that makes easier to set up and to install some softwares.
- Limit to my tools the I use every day (feel free to fork and adapt to your interests)
- Tested only on distribution based on Ubuntu

## Installing

```bash
$ git clone https://github.com/carsonh4te/setup-my-pc.git
$ cd setup-my-pc
$ ./install.sh
```

## Usage

With a fresh pc, I recommend follow this steps:

```bash
# step 1
$ setuphelper install basic
# step 2
$ setuphelper install personal
# step 3
$ setuphelper install dev
```

## Available options

- basic: install all basic tools
- WIP - personal: install all personal tools
- WIP - dev: install all development tools

### Basic

- zsh
- git
- neofetch
- alacritty
- ohmyzsh

### Personal

- WIP

### Dev

- apache2
- mysql

Project inspired by [MEOU](https://github.com/DavidCardoso/my-env-on-ubuntu)
