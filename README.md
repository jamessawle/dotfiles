# dotfiles

Project to manage the setup of applications and configuration across multiple machines.

This is the successor to my [previous attempt](https://github.com/jamessawle/device-configuration) with a focus on being able to support both Mac OS and Arch Linux installs from a single install.

## Installation Steps

### Mac OS pre-requisite setup

* Install [Homebrew](https://brew.sh/)
* Install git and [yadm](https://yadm.io/) - `brew install git yadm`

### Generic steps

* Clone the repo with yadm - `yadm clone <url>`

## Commands

### Generic

Commands installed on all devices

- `yu` - Updates dotfiles using YADM
- `gcm` - Checkout main branch in current folder
- `gcd` - Checkout develop branch in current folder
### MacOS

Commands only installed on MacOS

- `brewfileCreate` - Create Brewfile in `$XDG_DATA_HOME/homebrew` 
- `bbi` - Install dependencies using `brew bundle`
- `bbc` - Cleanup brew install to only include things defined in either `$XDG_CONFIG_HOME/homebrew/Brewfile` or `$HOME/Brewfile`

## Customisation

The setup can be customised by adding any parts of the following folder structure to `$XDG_CONFIG_HOME/custom`.

```
    alias.zsh           - Extra aliases
    Brewfile            - Addition brew files to install on Mac OS
    bootstrap
        fileToProcess   - Files to process to customise the system, run in alphabetical order
```
