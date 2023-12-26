# Dotfiles for Linux
---

**by y-not-u**

- OS: ArchLinux
- Compositor: Hyprland
- Terminal Emulator: Wezterm
- Status Bar: waybar
- App Launcher: Rofi
- Notification Daemon: SwayNotificationCenter
- Shell: zsh
- Browser: Firefox
- Font: Hack Nerd Font

## Prepared
### go
```bash
# set go proxy
export GOPROXY=https://goproxy.io,direct
```

### rust

```bash
# set cargo proxy and insall rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
```

```bash
curl --proto '=https' --tlsv1.2 -sSf https://rsproxy.cn/rustup-init.sh | sh
```

### yay


## Dependencies
`gnome-keyring wlroots python-pip go rust waybar-hyprland otf-font-awesome gvfs-smb bind`

## Apps
`firefox mpv dbeaver-ce wezterm kdeconnect swaync eog freeoffice wlogout swayosd gnome-calculator whitesur-gtk-theme lxappearance nautilus`

## CLI
`neofetch lsd cmatrix neovim git mpvpaper ranger telnet btop grim slurp ripgrep fzf lazygit tldr speedtest-rs ncdu`

## Adition
- xremap // keymap

## Fonts
- noto-fonts-emoji // Emoji
- ttf-hack-nerd // Hack Nerd Font
- adobe-source-han-sans-cn-fonts // Chinese font

## Web Developing
- node
- npm / pnpm
- bun

![](screenshots/desktop.png)
