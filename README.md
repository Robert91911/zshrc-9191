# zshrc-9191

My terminal setup: **zsh + Oh My Zsh + Oh My Posh** with the `montys-r` theme.

Two-line prompt: OS + host · path · git branch · node version · last command duration ·
time · exit status; and below it `⚡user ❯❯`.

| File | Goes to |
|---|---|
| `zsh/zshrc` | `~/.zshrc` |
| `oh-my-posh/montys-r.omp.json` | `~/.poshthemes/montys-r.omp.json` |

## Installation

On Bazzite (or any immutable Fedora: Kinoite, Silverblue…) steps 1, 2 and the font are
different: see [Bazzite](#bazzite) first.

1. **zsh**: `sudo apt install zsh` (Debian/Ubuntu) · `sudo dnf install zsh` (Fedora).
2. **Oh My Zsh** (it asks whether to make zsh your default shell: say yes):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
   If `chsh` is not available: `sudo usermod -s "$(which zsh)" "$USER"` and log in again.
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

## Bazzite

Everything except zsh itself goes in your home directory, so the immutable system is not a
problem. What changes:

1. **zsh is not included.** Layer it:
   ```bash
   rpm-ostree install zsh
   ```
   It only becomes available after a reboot. Save your work and reboot whenever it suits
   you; then `which zsh` should print `/usr/bin/zsh`.
2. **Do not change your login shell.** Install Oh My Zsh without prompts and without touching
   the shell:
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
   ```
3. Steps 3 and 4 as above, plus the font (needed here, since this is the machine you look
   from).
4. **Konsole profile** (checked on Konsole 26.08):
   - Show the menu bar with **Ctrl+Shift+M** if it is hidden.
   - **Settings → Create New Profile…** (with Konsole's built-in default profile there is no
     *Edit Current Profile…*, because that profile is read-only).
   - **General:** name it `zsh`, tick **Default profile**, **Command** `/usr/bin/zsh`.
   - **Appearance → Font:** *MesloLGM Nerd Font*.
   - **OK** and open a new tab.

   Only Konsole runs zsh; login and Game Mode stay on bash. If zsh ever breaks (e.g. an update
   drops the layer), the system still boots and you just switch back to the default profile.

The git segment of the prompt runs on every prompt: inside repos on network mounts (sshfs),
the prompt can feel slow. The `docker-compose` plugin is harmless without Docker.

## Machine-specific settings

Aliases, variables or tokens that must not be committed go in `~/.zshrc.local`: `zshrc`
sources it at the end if it exists, and it is not in the repo.

## Credits

`montys-r` is based on the `montys` theme from [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh).
