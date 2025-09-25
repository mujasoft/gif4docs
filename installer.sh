#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/mujasoft/gif4docs.git"
INSTALL_DIR="/usr/local/bin"
TARGET="$INSTALL_DIR/gif4docs"

echo "👉 Installing gif4docs..."

# Check dependencies
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "⚠️  ffmpeg not found!"
  echo "Please install ffmpeg first:"
  echo "  - macOS: brew install ffmpeg"
  echo "  - Ubuntu/Debian: sudo apt-get install ffmpeg"
  exit 1
fi

# Clone repo into temp dir
TMP_DIR=$(mktemp -d)
git clone --depth 1 "$REPO_URL" "$TMP_DIR"

# Copy to /usr/local/bin
sudo cp "$TMP_DIR/gif4docs" "$TARGET"

# Clean up
rm -rf "$TMP_DIR"

echo "✅ gif4docs installed!"

