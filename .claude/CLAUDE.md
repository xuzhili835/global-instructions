- 本机 Java:JDK 用 22(25 EA 会让 Lombok 编译挂);Maven `-s settings.xml`(aliyun 镜像),需联网。
- 密钥:不提交(gitignore),走本地配置文件/环境变量。
- 本机 npm/pip 下载缓存已全局重定向到 E:\dev-cache\(npm config 与 PIP_CACHE_DIR 环境变量生效),装依赖不写 C 盘,无需再手动加 --cache-dir。
- 服务器操作:nginx 先 `-t` 再 `reload`;长命令(sed/curl)写一行,改完 `grep` 验证;每条命令逐段解释。
- 浏览器自动化测试(playwright-cli):有头/无头按目标现象自行分析决定——依赖真实窗口外壳就开有头,否则无头;开有头必须显式带 `--headed` 参数:`playwright-cli open --browser=msedge --headed <url>`。
- commit:不加 Co-Authored-By;message 或将提交的文件里出现真实姓名等个人隐私时,提交前先提醒一声。
- 公开仓库(github.com/xuzhili835/*) commit message 只写变更本身,不写动机与敏感背景(脱敏、隐私、功劳类措辞);拿不准的先给用户过目。
- 详细设计文档:每完成一个模块,更新 backend 根目录的详细设计文档(无则创建);小功能不单独更新,等模块做完一起改。
- 回复结构:对提问的答复放在**最后**那条消息里(中间工具调用会刷掉前面的字),结尾别只 recap 代码、要重述答复,免得用户往上翻才找得到。
- C盘文件严禁删除；写入、下载等操作必须先经用户明确授权；工作过程的间接占用（如装依赖、跑工具带出的包缓存、临时文件、组件等）视同C盘操作，发生即告知用户（是什么、占了哪、多大）；能配置到其他盘的，一并说明该选项、由用户决定是否改
- 当修改 SKILL.md 或 类似于CLAUDE.md 全局指令文件时，若当前 AI 工具不是 Claude Code，则同步将修改内容写入用户目录 ~/.claude/ 下的同名对应文件中，以保持配置一致。
- 机器现状(补充说明)：实际维护 ~/.claude、~/.zcode、~/.agents、~/.codex 四处 skills 镜像——Claude Code 读 .claude，ZCode 读 .zcode 且同时扫描 .agents，Codex 读 .codex；同步时把改动写到未覆盖的其余镜像（双向都算数），只增改、一般不做删除；被其他工具自行改写过措辞的镜像不回灌。
- 全局指令或 skill 改动落定后,先提醒用户,再跑 `D:\Desktop\新建文件夹\Github\` 下对应仓库的 sync.sh 备份(skill→skills-backup,指令→global-instructions)。


- bat/cmd 按 GBK 解码:含中文的 .bat 必须 GBK+CRLF 写、头部加 `chcp 936 >nul`(.ps1 用 UTF-8-BOM,其余文件一律 UTF-8,读 csv 优先 utf-8-sig);生成后回读验证,内联脚本中 Windows 路径的反斜杠用 chr(92) 拼。

- 实习项目文档(研究院/青软):研究院/青软实训相关文档(周报、技术方案、素材登记表、案例六件套)走 project-doc skill;材料主源与成品都在 `D:\Desktop\实训文档\`,工作日志按周在根目录,写文档前先读当周日志。仅限研究院/青软/冲压实习相关,其他项目与个人事务的周报/文档不走这条线。讲解/学习类文档(个人向、教材风图文)同走这条线,成品归 `D:\Desktop\实训文档\个人\`,周报可取材(2026-10-10 定)。
