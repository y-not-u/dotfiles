# Dotfiles for Linux
---

**by y-not-u**

- OS: ArchLinux
- Compositor: Hyprland
- Terminal Emulator: Wezterm / Alacritty
- Status Bar: waybar / gBar
- App Launcher: Rofi
- Notification Daemon: SwayNotificationCenter
- Shell: zsh
- Browser: Firefox
- Font: Hack Nerd Font

![desktop](screenshots/desktop.png)

## Prepared

### Git
```bash
pacman -S git
```

### Stow
```bash
pacman -S stow
```

### Proxy/Mirror
#### go
```bash
# set go proxy
export GOPROXY=https://goproxy.io,direct
```

#### rust

```bash
# set cargo proxy
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
```

```bash
# install rust
curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh
```

### yay
[yay repo](https://github.com/Jguer/yay)
```bash
# installation
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Dependencies
`gnome-keyring wlroots python-pip go rust otf-font-awesome gvfs-smb bind`

## CLI
`neofetch lsd cmatrix neovim git mpvpaper ranger telnet btop grim slurp ripgrep fzf lazygit tldr speedtest-rs ncdu wl-clipboard`

## Adition

### Status Bar
- eww

### Browser
- Firefox
- Chromium

### Terminal
- Alacritty

### Files
- fzf
- ripgrep
- ranger

### Media
- mpv
- Spotify

### Keymap
- [keyd](https://github.com/rvaiya/keyd)
  > [VIM style](https://github.com/rvaiya/keyd/blob/master/examples/capslock-escape-with-vim-mode.conf)
  > CapsLock -> Super
  > Super -> CapsLock

### Clipboard
- wl-clipboard
- [chiphist](https://github.com/sentriz/cliphist)
> wl-paste --watch cliphist store // listen for clipboard changes

### Notification
- swaync // sway notification center

### Locker
- Hypridle
- [Swaylock-effects](https://github.com/mortie/swaylock-effects)

### Fonts
- noto-fonts-emoji // Emoji
- ttf-firacode-nerd // FiraCode Nerd Font
- adobe-source-han-sans-cn-fonts // Chinese font

### System
- [polkit-gnome](https://wiki.archlinux.org/title/Polkit)
> an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes

### Input Methods

> Chinese pinyin input method

```bash
pacman -Rs $(pacman -Qsq fcitx) # remove fcitx
pacman -S fcitx5 fcitx5-gtk fcitx5-qt
pacman -S fcitx5-chinese-addons

fcitx5-configtool # add pinyin into input methods

# set environment variables to /etc/environment
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

## Web Developing
- neovim # Editor
- ranger # File explorer
- node
- npm / pnpm
- bun # Run node fastly (only in development)
- lazygit # Git TUI
- zellij # like tmux
