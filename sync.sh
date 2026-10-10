#!/usr/bin/env bash
# 全局指令备份一键同步：用户主目录三个指令文件 → 仓库（含可选脱敏）→ commit + push
# 用法：在仓库根目录 bash sync.sh
# 脱敏规则放本地 redact.sed（gitignored，逐行 sed 表达式；模板 redact.sed.example）
set -euo pipefail
cd "$(dirname "$0")"

FILES=".zcode/AGENTS.md .claude/CLAUDE.md .codex/AGENTS.md"

for f in $FILES; do
  if [ -f "$HOME/$f" ]; then
    mkdir -p "$(dirname "$f")"
    cp "$HOME/$f" "$f"
  else
    echo "提示：$HOME/$f 不存在，跳过"
  fi
done

if [ -f redact.sed ]; then
  find . -path ./.git -prune -o -type f -name "*.md" -print | xargs -r sed -i -f redact.sed
fi

git add -A
if git diff --cached --quiet; then
  echo "无变化，不需要提交"
else
  git commit -m "sync: global instructions $(date +%F)"
  git push || {
    if netstat -ano | grep "LISTENING" | grep -q ":7897"; then
      echo "直连失败，走本地 7897 代理重推"
      HTTPS_PROXY=http://127.0.0.1:7897 git push
    else
      echo "推送失败且无本地代理在跑，稍后手动 git push" >&2
      exit 1
    fi
  }
  echo "已提交并推送"
fi
