# zshrc-9191

My terminal setup: **zsh + Oh My Zsh + Oh My Posh** with the `montys-r` theme.

Two-line prompt: OS + host · path · git branch · node version · last command duration ·
time · exit status; and below it `⚡user ❯❯`.

| File | Goes to |
|---|---|
| `zsh/zshrc` | `~/.zshrc` |
| `oh-my-posh/montys-r.omp.json` | `~/.poshthemes/montys-r.omp.json` |

## Installation

1. **zsh**: `sudo apt install zsh` (Debian/Ubuntu) · `sudo dnf install zsh` (Fedora) ·
   on Bazzite, if it is not already there, `rpm-ostree install zsh` and reboot.
2. **Oh My Zsh** (it asks whether to make zsh your default shell: say yes):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
   If `chsh` is not available (Fedora/Bazzite): `sudo usermod -s "$(which zsh)" "$USER"` and log in again.
3. **Oh My Posh** (installs to `~/.local/bin`, no sudo):
   ```bash
   curl -s https://ohmyposh.dev/install.sh | bash -s
   ```
4. **This repo**, always **after** Oh My Zsh (its installer rewrites `~/.zshrc`):
   ```bash
   git clone https://github.com/Robert91911/zshrc-9191.git ~/zshrc-9191
   ~/zshrc-9191/install.sh
   exec zsh
   ```
   `install.sh` creates symlinks; if there was already a real `~/.zshrc`, it is kept as
   `~/.zshrc.bak.<date>`. To update: `git -C ~/zshrc-9191 pull`.

## Font

The theme uses [Nerd Fonts](https://www.nerdfonts.com/) icons. The font goes on the machine
**you are looking from** (not on the server you SSH into):

```bash
oh-my-posh font install meslo
```

then pick *MesloLGM Nerd Font* in your terminal.

Four icons in the theme (U+F7DB, U+F553, U+FBAB, U+F525) come from the old Material Design
range that Nerd Fonts v3 removed; with a recent font they may show up as a box.

## Machine-specific settings

Aliases, variables or tokens that must not be committed go in `~/.zshrc.local`: `zshrc`
sources it at the end if it exists, and it is not in the repo.

## Credits

`montys-r` is based on the `montys` theme from [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh).
