# global-instructions — 个人 AI 工具全局指令备份

Claude Code / ZCode / Codex 的用户级全局指令文件备份。换机或新开虚拟机时直接 clone 本仓库恢复，skill 配置配套用 [skills 仓库](https://github.com/xuzhili835/skills)。

## 文件与恢复位置

| 仓库内路径 | 恢复到（用户主目录下） | 读它的工具 |
|---|---|---|
| `.zcode/AGENTS.md` | `~/.zcode/AGENTS.md` | ZCode |
| `.claude/CLAUDE.md` | `~/.claude/CLAUDE.md` | Claude Code |
| `.codex/AGENTS.md` | `~/.codex/AGENTS.md` | Codex |

三份内容是同一套全局规则在三个工具里的语义等价变体（不是逐字拷贝，各工具格式与侧重略有差异），改任何一份后按"配置同步"纪律把改动落到其余几份，再跑 `bash sync.sh` 入库。

## 换机恢复步骤

```bash
git clone https://github.com/xuzhili835/global-instructions.git
git clone https://github.com/xuzhili835/skills.git

# 1) 全局指令：按上表把三个文件拷回用户主目录对应位置
# 2) skills：把 skills 仓库的 skills/ 下各目录拷进 ~/.zcode/skills/，
#    再按需同步到 ~/.claude/skills/、~/.agents/skills/、~/.codex/skills/
# 3) 项目级 AGENTS.md 不在备份范围（跟随各项目工作区走）
```

## 更新流程

在任一工具里改完全局指令并完成各工具间同步后：

```bash
bash sync.sh
```

脚本重新从用户主目录快照三个文件 → 可选脱敏（`redact.sed`，gitignored，模板 `redact.sed.example`）→ 有差异才 commit + push（推送失败自动探测本地 7897 代理重试）。

## 范围说明

- 只备份**全局指令文件**；skills（`~/.claude、~/.zcode、~/.agents、~/.codex` 四处镜像）在 [skills 仓库](https://github.com/xuzhili835/skills)；工具自身配置（`config.toml`、`auth.json`、密钥、会话历史、auto-memory 等）一律不入库。
- 未附开源许可证（个人配置，保留所有权利）。
