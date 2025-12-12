#!/bin/bash
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

REPO_BASE="https://raw.githubusercontent.com/displayio/DIOSDK/main/claude-agents"

# Default: global installation
INSTALL_MODE="global"
PLATFORM="all"

# Parse arguments
for arg in "$@"; do
    case $arg in
        --local|-l)
            INSTALL_MODE="local"
            ;;
        --global|-g)
            INSTALL_MODE="global"
            ;;
        --platform=*)
            PLATFORM="${arg#*=}"
            ;;
        --help|-h)
            echo "Usage: bash install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --global, -g          Install to ~/.claude/agents/ (default)"
            echo "  --local, -l           Install to ./.claude/agents/ (current project)"
            echo "  --platform=PLATFORM   android, ios, or all (default: all)"
            echo "  --help, -h            Show this help"
            exit 0
            ;;
    esac
done

# Set agents directory
if [ "$INSTALL_MODE" = "global" ]; then
    AGENTS_DIR="$HOME/.claude/agents"
else
    AGENTS_DIR=".claude/agents"
fi

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     DIO SDK Agent Installer            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "  Install mode: ${GREEN}${INSTALL_MODE}${NC}"
echo -e "  Directory: ${GREEN}${AGENTS_DIR}${NC}"
echo ""

# Check for curl
if ! command -v curl &> /dev/null; then
    echo -e "${RED}✗ curl is required but not installed${NC}"
    exit 1
fi
echo -e "${GREEN}✓${NC} curl detected"

# Check for Claude Code
if command -v claude &> /dev/null; then
    echo -e "${GREEN}✓${NC} Claude Code CLI detected"
elif [ -d "$HOME/.claude" ]; then
    echo -e "${GREEN}✓${NC} Claude Code directory detected"
else
    echo -e "${RED}✗ Claude Code not found${NC}"
    echo ""
    echo "  Install Claude Code first:"
    echo "  brew install --cask claude-code"
    echo "  or visit: https://claude.ai/code"
    exit 1
fi

echo ""

# Create agents directory
echo -e "📁 Creating ${AGENTS_DIR}/"
mkdir -p "$AGENTS_DIR"

# Download agents based on platform
download_agent() {
    local agent=$1
    echo -e "⬇️  Downloading ${agent}..."
    if curl -fsSL "$REPO_BASE/$agent" -o "$AGENTS_DIR/$agent" 2>/dev/null; then
        echo -e "${GREEN}✓${NC} Downloaded ${agent}"
        return 0
    else
        echo -e "${RED}✗${NC} Failed to download ${agent}"
        return 1
    fi
}

case $PLATFORM in
    android)
        download_agent "dio-android-integrator.md"
        ;;
    ios)
        download_agent "dio-ios-integrator.md"
        ;;
    all)
        download_agent "dio-android-integrator.md"
        download_agent "dio-ios-integrator.md"
        ;;
    *)
        echo -e "${RED}✗ Unknown platform: ${PLATFORM}${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║       Installation Complete!           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo "📦 Installed agents:"
ls -1 "$AGENTS_DIR"/*.md 2>/dev/null | xargs -n1 basename | sed 's/^/   • /'
echo ""
echo "🚀 Usage:"
echo ""
echo "   1. Navigate to your project:"
echo -e "      ${BLUE}cd /path/to/your/project${NC}"
echo ""
echo "   2. Launch Claude Code:"
echo -e "      ${BLUE}claude${NC}"
echo ""
echo "   3. Integrate DIO SDK:"
echo -e "      ${YELLOW}Use dio-android-integrator to integrate DIO SDK (Android)${NC}"
echo -e "      ${YELLOW}Use dio-ios-integrator to integrate DIO SDK (iOS)${NC}"
echo -e "      ${YELLOW}App ID: YOUR_APP_ID${NC}"
echo -e "      ${YELLOW}Placements: Interstitial: XXX, Banner: XXX${NC}"
echo ""
echo "📚 Documentation: https://docs.display.io"
echo ""
