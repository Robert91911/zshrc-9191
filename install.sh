#!/usr/bin/env bash
# Links the repo files into $HOME. Run it after installing Oh My Zsh.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    local bak="$dst.bak.$(date +%Y%m%d-%H%M%S)"
    mv "$dst" "$bak"
    echo "backup: $bak"
  fi
  ln -sfn "$src" "$dst"
  echo "$dst -> $src"
}

link "$DIR/zsh/zshrc" "$HOME/.zshrc"
link "$DIR/oh-my-posh/montys-r.omp.json" "$HOME/.poshthemes/montys-r.omp.json"

missing=0
command -v zsh >/dev/null || { echo "missing: zsh"; missing=1; }
[ -d "$HOME/.oh-my-zsh" ] || { echo "missing: Oh My Zsh"; missing=1; }
command -v oh-my-posh >/dev/null || [ -x "$HOME/.local/bin/oh-my-posh" ] || { echo "missing: oh-my-posh"; missing=1; }
[ "$missing" -eq 0 ] || exit 1
echo "done: run 'exec zsh'"
