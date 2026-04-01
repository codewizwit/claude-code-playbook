#!/bin/bash
set -e

echo ""
echo "  Claude Code Playbook — Quick Install"
echo "  ======================================"
echo ""

# Detect OS
OS="$(uname -s)"
ARCH="$(uname -m)"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
DIM='\033[0;90m'
NC='\033[0m'

ok() { echo -e "  ${GREEN}✓${NC} $1"; }
warn() { echo -e "  ${YELLOW}!${NC} $1"; }
fail() { echo -e "  ${RED}✗${NC} $1"; exit 1; }
step() { echo -e "\n  ${DIM}$1${NC}"; }

# --- Node.js ---
step "Checking Node.js..."

if command -v node &>/dev/null; then
  NODE_VERSION=$(node --version)
  NODE_MAJOR=$(echo "$NODE_VERSION" | sed 's/v//' | cut -d. -f1)
  if [ "$NODE_MAJOR" -ge 18 ]; then
    ok "Node.js $NODE_VERSION"
  else
    warn "Node.js $NODE_VERSION is outdated (need 18+)"
    NEED_NODE=1
  fi
else
  warn "Node.js not found"
  NEED_NODE=1
fi

if [ "${NEED_NODE:-0}" = "1" ]; then
  step "Installing Node.js..."
  if [ "$OS" = "Darwin" ]; then
    if command -v brew &>/dev/null; then
      brew install node
      ok "Node.js installed via Homebrew"
    else
      echo ""
      echo "  Install Node.js from: https://nodejs.org"
      echo "  Or install Homebrew first: https://brew.sh"
      fail "Cannot auto-install Node.js without Homebrew"
    fi
  elif [ "$OS" = "Linux" ]; then
    if command -v apt-get &>/dev/null; then
      curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
      sudo apt-get install -y nodejs
      ok "Node.js installed via apt"
    elif command -v dnf &>/dev/null; then
      sudo dnf install -y nodejs
      ok "Node.js installed via dnf"
    else
      echo ""
      echo "  Install Node.js from: https://nodejs.org"
      fail "Cannot auto-install Node.js on this Linux distribution"
    fi
  else
    echo ""
    echo "  Install Node.js from: https://nodejs.org"
    fail "Cannot auto-install Node.js on $OS"
  fi
fi

# --- Claude Code ---
step "Checking Claude Code..."

if command -v claude &>/dev/null; then
  ok "Claude Code already installed"
else
  step "Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
  if command -v claude &>/dev/null; then
    ok "Claude Code installed"
  else
    fail "Claude Code install failed — try: npm install -g @anthropic-ai/claude-code"
  fi
fi

# --- Clone playbook (if not already in it) ---
step "Checking playbook..."

if [ -f "./astro.config.mjs" ] && grep -q "claude-code-playbook" ./package.json 2>/dev/null; then
  ok "Already in the playbook repo"
else
  if [ -d "claude-code-playbook" ]; then
    ok "Playbook directory exists"
    cd claude-code-playbook
  else
    step "Cloning playbook..."
    git clone https://github.com/codewizwit/claude-code-playbook.git
    cd claude-code-playbook
    ok "Playbook cloned"
  fi
fi

# --- Done ---
echo ""
echo -e "  ${GREEN}All set.${NC} Run the setup wizard:"
echo ""
echo "    cd claude-code-playbook"
echo "    claude"
echo "    /setup"
echo ""
echo "  The wizard will walk you through picking agents,"
echo "  skills, and a starter config."
echo ""
