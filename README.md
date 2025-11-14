# Claude Code Docker

[English](README.en.md) | 中文

> 版本更新，增加其他免费平台api-token调用  
> 注册地址：https://anyrouter.top/register?aff=Ilxk  
> 注册地址：https://agentrouter.org/register?aff=WNM6  -- 线路很不稳定，优先推荐 anyrouter

> 版本更新，新增 openai codex 

## 🚀 快速开始 - 一键运行

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code dust96747/claude-code bash
```

然后在容器内运行 `claude` 命令启动 Claude Code。

> 💡 **提示**：容器启动后会进入 bash 终端。运行 `claude` 命令启动 Claude Code，系统将提示您输入 API Key。请提前准备好您的 Moonshot API Key。

## 项目介绍

Claude Code Docker 是一个预打包了 Anthropic 官方 Claude Code CLI 工具的 Docker 镜像。为开发者提供开箱即用的 AI 编程助手环境，无需本地安装 Node.js 和相关依赖即可快速体验 Claude Code。

🔗 **项目仓库**：[https://github.com/dust96747/claude-code](https://github.com/dust96747/claude-code)

**🔥 特别说明：本项目默认配置使用月之暗面 (Moonshot) 的 [Kimi K2 万亿参数模型](https://platform.moonshot.cn/console/api-keys)，该服务提供完全兼容 Anthropic API 的接口，专为中国大陆用户优化，确保稳定快速的 Claude Code 体验！同时也支持 [SiliconFlow（硅基流动）](https://cloud.siliconflow.cn/i/tSgpfq1D) 平台，提供更多模型选择和高性价比的GenAI云服务。**

### 什么是 Claude Code？

Claude Code 是 Anthropic 官方推出的命令行 AI 编程助手，为开发者提供：
- 🤖 与 Claude AI 进行智能编程对话
- 💡 实时代码建议与问题解决方案  
- ⚙️ 全方位软件工程任务支持
- 🔍 代码审查与优化建议

## 功能特性

- 🐳 基于最新 Ubuntu 的轻量级容器镜像
- 📦 预置 Node.js、npm 和 Claude Code CLI 完整环境
- 🚀 支持多种 API 服务（Moonshot、SiliconFlow、官方 API）
- 🔧 零配置设计，一键启动即用
- ⚡ 集成阿里云镜像源，国内访问速度优化
- 🔒 支持配置持久化和本地项目挂载

## 快速开始

### 方法一：Docker Hub 镜像部署（推荐）

直接从 [Docker Hub](https://hub.docker.com/r/dust96747/claude-code) 获取并运行镜像：

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code dust96747/claude-code bash
```

然后在容器内运行 `claude` 命令启动 Claude Code。

### 方法二：本地构建部署

```bash
# 克隆仓库
git clone https://github.com/dust96747/claude-code.git
cd claude-code

# 构建镜像
docker build -t claude-code .

# 运行容器
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -w /root \
  --name my-claude-code \
  claude-code bash

# 然后在容器内运行 claude 命令
```

### 方法三：Docker Compose 部署（支持多服务）

```bash
# 启动后台服务
docker compose up -d

# 进入 Moonshot Kimi K2 服务
docker exec -u root -it claude-code-kimi bash 

# 或选择进入 SiliconFlow 服务
docker exec -u root -it claude-code-flow bash 

# 切换到工作目录
cd your_project

# 启动 Claude Code
claude

# 系统提示 "Do you want to use this API key?" 时选择 Yes
# 确认 API Key 和 API Base URL 配置正确后即可开始使用
# 输入 /init 初始化项目并开始 AI 辅助开发
```

## 环境变量

| 变量名 | 描述 | 默认值 |
|--------|------|--------|
| ANTHROPIC_BASE_URL | Claude API 的基础 URL | https://api.moonshot.cn/anthropic |
| ANTHROPIC_API_KEY | Claude API 密钥（运行时提示输入） | - |
| ANTHROPIC_MODEL | 使用的模型名称 | - |

## 使用方法

### 基础操作流程

1. **初次配置**：容器启动后按提示输入 API 密钥完成认证
2. **开始对话**：直接提出编程问题或描述需求，Claude 将提供智能建议
3. **项目初始化**：在项目目录中输入 `/init` 让 Claude 了解项目结构
4. **安全退出**：使用 `Ctrl+C` 或输入 `exit` 命令退出对话

### 项目文件访问配置

让 Claude Code 直接访问和编辑您的本地项目：

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v /path/to/your/project:/workspace \
  -w /workspace \
  --name my-claude-code \
  dust96747/claude-code bash
```

然后在容器内运行 `claude` 命令。

### 多平台 API 服务支持

#### Anthropic 官方 API（国际用户）
```bash
docker run --rm -it \
  -w /root \
  --name my-claude-code \
  dust96747/claude-code bash
```

#### Moonshot Kimi K2 服务（推荐/中国用户）
```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -w /root --name my-claude-code \
  dust96747/claude-code bash
```

#### SiliconFlow 服务（高性价比推荐）
[SiliconFlow（硅基流动）](https://cloud.siliconflow.cn/i/tSgpfq1D)是基于优秀开源模型的高性价比GenAI云服务平台，支持文本对话、图像生成、视频生成、语音合成等多种AI功能。

**🎁 邀请奖励持续进行，2000万Tokens送不停！**
- 📱 **新用户福利**：通过邀请链接注册即送2000万Tokens（价值14元平台配额）
- 🤝 **邀请奖励**：每成功邀请一位新用户，您也将获得2000万Tokens
- 💡 **特别说明**：奖励配额仅限平台使用，支持多种AI模型服务

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.siliconflow.cn/" \
  -w /root --name my-claude-code \
  dust96747/claude-code bash
```

> 启动后均需在容器内执行 `claude` 命令开始使用

## 高级配置

### 配置数据持久化

保存 API 密钥和个人配置，避免重复输入：

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v ~/.config/claude:/root/.config/claude \
  -w /root \
  --name my-claude-code \
  dust96747/claude-code bash
```

然后在容器内运行 `claude` 命令。

### Docker Compose 服务配置说明

项目提供的 `docker-compose.yml` 包含两套完整的服务配置：

| 服务名称 | API 提供商 | 适用场景 | 容器名称 |
|---------|-----------|---------|----------|
| **claude-code-kimi** | Moonshot Kimi K2 | 中国大陆用户首选 | claude-code-kimi |
| **claude-code-flow** | SiliconFlow | 备选方案/多平台 | claude-code-flow |

两个服务均已预配置：
- ✅ 工作目录自动挂载 
- ✅ 配置文件持久化保存
- ✅ API 密钥环境变量设置

## 常见问题解答

### Q: 如何获取 API 密钥？
**A:** 根据您的需求选择对应平台：
- **🌍 国际用户**：[Anthropic Console](https://console.anthropic.com/) - 注册获取官方 API 密钥
- **🇨🇳 中国用户**：[月之暗面平台](https://platform.moonshot.cn/console/api-keys) - 获取 Kimi K2 API 密钥  
- **💎 高性价比推荐**：[SiliconFlow（硅基流动）](https://cloud.siliconflow.cn/i/tSgpfq1D) - 邀请奖励持续进行！新用户注册即得2000万Tokens（价值14元），邀请好友同样获得2000万Tokens奖励，提供文本对话、图像生成、视频生成、语音合成等多种AI服务

### Q: 为什么推荐使用 Moonshot API？
**A:** 月之暗面的 Kimi K2 是专为中文优化的万亿参数模型，提供：
- ✅ 完全兼容 Anthropic API 协议
- ✅ 中国大陆网络环境优化  
- ✅ 更快的响应速度和稳定性
- ✅ 非代理服务，直接原生支持

### Q: 数据安全与持久化？
**A:** 容器默认为临时环境，退出后数据清除。如需持久化：
- 💾 **挂载配置目录**：`-v ~/.config/claude:/root/.config/claude`
- 📁 **挂载工作目录**：`-v /your/project:/workspace`
- 🔐 **API 密钥安全**：仅保存在挂载的配置目录中

### Q: 如何指定使用的 AI 模型？
**A:** 通过环境变量 `ANTHROPIC_MODEL` 指定：
- `kimi-k2-0905-preview` - Moonshot Kimi K2 最新预览版
- `moonshotai/Kimi-K2-Instruct-0905` - SiliconFlow 平台版本
- 具体可用模型请查看对应平台文档

### Q: SiliconFlow 的邀请奖励如何获取？
**A:** 邀请奖励机制详情：
1. **注册奖励**：通过[邀请链接](https://cloud.siliconflow.cn/i/tSgpfq1D)完成手机号注册，立即获得2000万Tokens
2. **邀请奖励**：每成功邀请一位新用户注册，您将获得2000万Tokens
3. **配额说明**：2000万Tokens基于Qwen2.5-14B-Instruct模型单价计算，实际到账为14元平台配额
4. **使用限制**：奖励配额仅限SiliconCloud平台使用，不可提现
5. **规则提醒**：请遵守平台规则，禁止奖励转卖、刷单等违规行为

### Q: 容器无法启动或连接失败？
**A:** 常见解决方案：
1. **检查网络**：确保能访问对应的 API 服务地址
2. **验证密钥**：确认 API Key 有效且有足够额度
3. **端口占用**：检查是否有其他服务占用相关端口
4. **权限问题**：确保 Docker 有足够权限访问挂载目录

## 贡献

欢迎贡献和建议！

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request

## 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## 相关链接

- [Claude Code 官方文档](https://docs.anthropic.com/claude/docs/claude-code)
- [Anthropic 官网](https://www.anthropic.com/)
- [Docker Hub 镜像](https://hub.docker.com/r/dust96747/claude-code)
- [月之暗面 API 密钥](https://platform.moonshot.cn/console/api-keys)
- [SiliconFlow 平台（推荐注册）](https://cloud.siliconflow.cn/i/tSgpfq1D) - 高性价比GenAI云服务
