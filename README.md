# zshrc-9191

Mi terminal: **zsh + Oh My Zsh + Oh My Posh** con el tema `montys-r`.

Prompt en dos líneas: sistema + host · ruta · rama de git · versión de node · tiempo del
último comando · hora · si falló; y debajo `⚡usuario ❯❯`.

| Fichero | Va a |
|---|---|
| `zsh/zshrc` | `~/.zshrc` |
| `oh-my-posh/montys-r.omp.json` | `~/.poshthemes/montys-r.omp.json` |

## Instalación

1. **zsh**: `sudo apt install zsh` (Debian/Ubuntu) · `sudo dnf install zsh` (Fedora) ·
   en Bazzite, si no viene, `rpm-ostree install zsh` y reiniciar.
2. **Oh My Zsh** (pregunta si poner zsh como shell por defecto: sí):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
   Si no tienes `chsh` (Fedora/Bazzite): `sudo usermod -s "$(which zsh)" "$USER"` y volver a entrar.
3. **Oh My Posh** (en `~/.local/bin`, sin sudo):
   ```bash
   curl -s https://ohmyposh.dev/install.sh | bash -s
   ```
4. **Este repo**, siempre **después** de Oh My Zsh (su instalador reescribe `~/.zshrc`):
   ```bash
   git clone https://github.com/Robert91911/zshrc-9191.git ~/zshrc-9191
   ~/zshrc-9191/install.sh
   exec zsh
   ```
   `install.sh` crea enlaces simbólicos; si ya había un `~/.zshrc` de verdad, lo guarda como
   `~/.zshrc.bak.<fecha>`. Para actualizar: `git -C ~/zshrc-9191 pull`.

## Fuente

El tema usa iconos de [Nerd Fonts](https://www.nerdfonts.com/). La fuente va en el equipo **desde
el que miras** (no en el servidor al que te conectas por SSH):

```bash
oh-my-posh font install meslo
```

y elegir *MesloLGM Nerd Font* en la terminal.

Cuatro iconos del tema (U+F7DB, U+F553, U+FBAB, U+F525) son del rango antiguo de Material Design
que Nerd Fonts v3 retiró; con una fuente nueva pueden salir como un cuadrado.

## Lo propio de cada máquina

Alias, variables o tokens que no deben subirse van en `~/.zshrc.local`: el `zshrc` lo carga al
final si existe, y no está en el repo.

## Créditos

`montys-r` está basado en el tema `montys` de [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh).
