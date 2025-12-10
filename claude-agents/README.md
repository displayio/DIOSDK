# DIO SDK Claude Agents

AI-powered agents for automated DIO SDK integration using [Claude Code](https://claude.ai/code).

## Available Agents

| Agent | Platform | Description |
|-------|----------|-------------|
| `dio-android-integrator.md` | Android | Full SDK integration with waterfall support |
| `dio-ios-integrator.md` | iOS | Coming soon |

## Quick Install

```bash
# In your project directory
bash <(curl -fsSL https://raw.githubusercontent.com/displayio/DIOSDK/main/claude-agents/install.sh)
```

## Manual Install

1. Download the agent file for your platform
2. Place it in: `~/.claude/agents/` (global) or `.claude/agents/` (project)
3. Launch Claude Code: `claude`
4. Use the agent: `Use dio-android-integrator.md to integrate DIO SDK`

## Usage

```bash
cd /path/to/your/android/project
claude
```

Then type:
```
Use @dio-android-integrator to integrate DIO SDK.

Config:
- App ID: YOUR_APP_ID
- Placements:
  - Interstitial: PLACEMENT_ID
  - Banner: PLACEMENT_ID
  - InFeed: PLACEMENT_ID
  - Interscroller: PLACEMENT_ID
  - Inline: PLACEMENT_ID

Strategy: DIO SDK as primary, fallback to existing SDKs.
```

## What the Agent Does

1. 🔍 Analyzes your project structure
2. 📦 Detects existing ad SDKs (AdMob, AppLovin, etc.)
3. ⬇️ Fetches latest DIO SDK version
4. 📝 Adds dependencies & configuration
5. 🔄 Implements waterfall (DIO first → fallback)
6. 🏗️ Builds and auto-fixes errors
7. ✅ Validates successful integration

## Requirements

- [Claude Code CLI](https://claude.ai/code) installed
- Android project with Gradle, minSdk ≥ 24
- DIO dashboard credentials (App ID + Placement IDs)

## Links

- [DIO SDK Documentation](https://docs.display.io)
- [DIO Dashboard](https://dashboard.display.io)
- [Claude Code](https://claude.ai/code)
