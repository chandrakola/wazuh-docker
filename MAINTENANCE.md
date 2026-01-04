# How to Update Your Wazuh Fork

This guide explains how to keep your fork in sync with the official `wazuh/wazuh-docker` repository while preserving your custom changes.

## Prerequisites
- You must be in the `wazuh-docker` directory.
- `upstream` remote must be configured (we already did this).

## Procedure

### 1. Update your local 'main'
First, pull the latest changes from the official repo into your local `main` branch. This ensures your `main` is always an exact mirror of the official code.

```bash
git checkout main
git pull upstream main
git push origin main
```

### 2. Update your feature branch
Now, replay your custom changes (the `agent/` folder, etc.) on top of the new code.

```bash
git checkout deployment
git rebase main
```

### 3. Resolve Conflicts (If any)
If Wazuh changed files that you also changed (like `single-node/docker-compose.yml`), git will pause.
- Open the conflict files and fix them.
- Run `git add <file>`
- Run `git rebase --continue`

### 4. Push your updated branch
Since we used `rebase`, history changed, so we must force push to your fork.

```bash
git push --force-with-lease origin deployment
```
