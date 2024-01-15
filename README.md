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

![](screenshots/desktop.png)

## Prepared

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
`gnome-keyring wlroots python-pip go rust waybar-hyprland otf-font-awesome gvfs-smb bind`

## Apps
`firefox mpv dbeaver-ce wezterm kdeconnect swaync eog freeoffice wlogout swayosd gnome-calculator whitesur-gtk-theme lxappearance nautilus`

## CLI
`neofetch lsd cmatrix neovim git mpvpaper ranger telnet btop grim slurp ripgrep fzf lazygit tldr speedtest-rs ncdu wl-clipboard`

## Adition
### Keymap
- [xremap](https://github.com/k0kubun/xremap)
  > VIM Style
  > CapsLock -> Super
  > Super -> CapsLock

### Clipboard
- wl-clipboard
- [chiphist](https://github.com/sentriz/cliphist)
> wl-paste --watch cliphist store // listen for clipboard changes

### Notification
- swaync // sway notification center

### Status Bar
- waybar
- [gBar](https://github.com/scorpion-26/gBar)

### Locker
- [Swaylock-effects](https://github.com/mortie/swaylock-effects)

### Fonts
- noto-fonts-emoji // Emoji
- ttf-hack-nerd // Hack Nerd Font
- adobe-source-han-sans-cn-fonts // Chinese font

## Web Developing
- neovim # Editor
- ranger # File explorer
- node
- npm / pnpm
- bun # Run node fastly (only in development)
- lazygit # Git TUI
- zellij # like tmux

https://dausruddin.com/how-to-enable-clipboard-and-folder-sharing-in-qemu-kvm-on-windows-guest/
