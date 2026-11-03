#!/usr/bin/env bash
# Install wjord by linking bin/wjord onto your PATH.
set -eu

here="$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
chmod +x "$here/bin/wjord"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "wjord needs pandoc."
  if command -v brew >/dev/null 2>&1; then
    echo "Installing it with Homebrew..."
    brew install pandoc
  else
    echo "Get it from https://pandoc.org/installing.html, then run this again."
    exit 1
  fi
fi

if [ -w /usr/local/bin ]; then
  dest=/usr/local/bin
elif [ -d /opt/homebrew/bin ] && [ -w /opt/homebrew/bin ]; then
  dest=/opt/homebrew/bin
else
  dest="$HOME/.local/bin"
  mkdir -p "$dest"
fi

ln -sf "$here/bin/wjord" "$dest/wjord"
echo "Linked wjord into $dest"

case ":$PATH:" in
  *":$dest:"*) echo "Done. Try: wjord help" ;;
  *) echo "Add this line to ~/.zshrc, then open a new Terminal window:"
     echo "  export PATH=\"$dest:\$PATH\"" ;;
esac
