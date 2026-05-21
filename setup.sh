#!/usr/bin/env bash
# =============================================================================
# Setup development environment for esphome-devices repo
# =============================================================================
set -euo pipefail

echo "WildSystems ESPHome Devices - Development Setup"
echo "================================================"
echo

# 1. Install pre-commit hook
if [ -f hooks/pre-commit ]; then
  echo "Installing pre-commit hook..."
  cp hooks/pre-commit .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
  echo "  ✓ Pre-commit hook installed"
else
  echo "  ⚠️  hooks/pre-commit not found"
fi

# 2. Check for esphome
echo
echo "Checking for ESPHome..."
if command -v esphome &> /dev/null; then
  VERSION=$(esphome version 2>&1 | head -1)
  echo "  ✓ ESPHome installed: $VERSION"
else
  echo "  ✗ ESPHome not found"
  echo
  echo "Install ESPHome:"
  echo "  pip install esphome"
  echo "  or"
  echo "  python3 -m venv .venv && source .venv/bin/activate && pip install esphome"
fi

echo
echo "Setup complete!"
echo
echo "Next steps:"
echo "  1. Install ESPHome if not already installed"
echo "  2. Run './validate-all.sh' to test validation"
echo "  3. Make changes to device configs"
echo "  4. Commit (pre-commit hook will validate automatically)"
