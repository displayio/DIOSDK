#!/bin/bash
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO_BASE="https://raw.githubusercontent.com/displayio/DIOSDK/main/claude-agents"
AGENTS_DIR=".claude/agents"

echo -e "${BLUE}🚀 DIO SDK Claude Agents Installer${NC}"
echo ""

# Detect platform
if [ -f "build.gradle" ] || [ -f "build.gradle.kts" ] || [ -f "settings.gradle" ] || [ -f "settings.gradle.kts" ]; then
    PLATFORM="android"
    AGENT="dio-agent-android.md"
    echo -e "📱 Detected: ${GREEN}Android project${NC}"
elif [ -f "Package.swift" ] || [ -d "*.xcodeproj" ] || [ -d "*.xcworkspace" ]; then
    PLATFORM="ios"
    AGENT="dio-agent-ios.md"
    echo -e "🍎 Detected: ${GREEN}iOS project${NC}"
    echo -e "${YELLOW}⚠️  iOS agent coming soon!${NC}"
    exit 0
else
    echo -e "${YELLOW}⚠️  Could not detect project type.${NC}"
    echo "Please run this script from your Android or iOS project root."
    exit 1
fi

# Create agents directory
echo -e "📁 Creating ${AGENTS_DIR}/"
mkdir -p "$AGENTS_DIR"

# Download agent
echo -e "⬇️  Downloading ${AGENT}..."
curl -fsSL "$REPO_BASE/$AGENT" -o "$AGENTS_DIR/$AGENT"

echo ""
echo -e "${GREEN}✅ Installation complete!${NC}"
echo ""
echo "Installed: $AGENTS_DIR/$AGENT"
echo ""
echo -e "${BLUE}Usage:${NC}"
echo "  1. Run: claude"
echo "  2. Type: Use @dio-agent-android to integrate DIO SDK with App ID: YOUR_APP_ID"
echo ""
