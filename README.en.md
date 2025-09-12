# Claude Code Docker

English | [中文](README.md)

## 🚀 Quick Start - One Command

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code dust96747/claude-code bash
```

Then run `claude` command inside the container to start Claude Code.

> 💡 **Tip**: The container starts with a bash terminal. Run the `claude` command to launch Claude Code, and the system will prompt you to enter your API Key. Please have your Moonshot API Key ready beforehand.

## Introduction

Claude Code Docker is a pre-packaged Docker image featuring Anthropic's official Claude Code CLI tool. It provides developers with a ready-to-use AI programming assistant environment, enabling quick Claude Code experience without local Node.js and dependency installation.

🔗 **Project Repository**: [https://github.com/dust96747/claude-code](https://github.com/dust96747/claude-code)

**🔥 Special Note: This project is pre-configured to use Moonshot's [Kimi K2 trillion-parameter model](https://platform.moonshot.cn/console/api-keys), which provides a fully compatible Anthropic API interface optimized for users in mainland China, ensuring stable and fast Claude Code experience! It also supports [SiliconFlow](https://cloud.siliconflow.cn/i/tSgpfq1D) platform, offering more model choices and cost-effective GenAI cloud services.**

### What is Claude Code?

Claude Code is Anthropic's official command-line AI programming assistant that provides developers with:
- 🤖 Intelligent programming conversations with Claude AI
- 💡 Real-time code suggestions and problem-solving solutions
- ⚙️ Comprehensive software engineering task support
- 🔍 Code review and optimization recommendations

## Features

- 🐳 Lightweight container image based on the latest Ubuntu
- 📦 Complete environment with Node.js, npm, and Claude Code CLI pre-installed
- 🚀 Multiple API service support (Moonshot, SiliconFlow, Official API)
- 🔧 Zero-configuration design, one-click startup
- ⚡ Integrated Aliyun mirror sources for optimized access speed in China
- 🔒 Support for configuration persistence and local project mounting

## Quick Start

### Method 1: Docker Hub Image Deployment (Recommended)

Direct image retrieval and execution from [Docker Hub](https://hub.docker.com/r/dust96747/claude-code):

```bash
docker run --rm -it -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" -w /root --name my-claude-code dust96747/claude-code bash
```

Then run `claude` command inside the container to start Claude Code.

### Method 2: Local Build Deployment

```bash
# Clone the repository
git clone https://github.com/dust96747/claude-code.git
cd claude-code

# Build the image
docker build -t claude-code .

# Run the container
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -w /root \
  --name my-claude-code \
  claude-code bash

# Then run claude command inside the container
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|----------|
| ANTHROPIC_BASE_URL | Base URL for Claude API | https://api.moonshot.cn/anthropic |
| ANTHROPIC_API_KEY | Claude API key (prompted at runtime) | - |
| ANTHROPIC_MODEL | Model name to use | - |

## Usage

### Basic Operation Workflow

1. **Initial Setup**: After container startup, follow prompts to enter your API key for authentication
2. **Start Conversation**: Directly ask programming questions or describe your needs, and Claude will provide intelligent suggestions
3. **Project Initialization**: In your project directory, type `/init` to let Claude understand your project structure
4. **Safe Exit**: Use `Ctrl+C` or type `exit` command to quit the conversation

### Project File Access Configuration

Allow Claude Code to directly access and edit your local projects:

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v /path/to/your/project:/workspace \
  -w /workspace \
  --name my-claude-code \
  dust96747/claude-code bash
```

Then run `claude` command inside the container.

### Multi-Platform API Service Support

#### Anthropic Official API (International Users)
```bash
docker run --rm -it \
  -w /root \
  --name my-claude-code \
  dust96747/claude-code bash
```

#### Moonshot Kimi K2 Service (Recommended/China Users)
```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -w /root --name my-claude-code \
  dust96747/claude-code bash
```

#### SiliconFlow Service (Cost-Effective Recommended)
[SiliconFlow](https://cloud.siliconflow.cn/i/tSgpfq1D) is a cost-effective GenAI cloud service platform based on excellent open-source models, supporting text conversation, image generation, video generation, voice synthesis and other AI functions.

**🎁 Invitation Rewards Continue, 20 Million Tokens Giveaway!**
- 📱 **New User Benefits**: Register via invitation link and get 20 million Tokens instantly (worth 14 yuan platform credit)
- 🤝 **Invitation Rewards**: Earn 20 million Tokens for each successful referral
- 💡 **Special Note**: Reward credits are for platform use only, supporting various AI model services

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.siliconflow.cn/" \
  -w /root --name my-claude-code \
  dust96747/claude-code bash
```

> All services require running the `claude` command inside the container after startup

## Advanced Configuration

### Configuration Data Persistence

Save API keys and personal configurations to avoid repeated input:

```bash
docker run --rm -it \
  -e ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic" \
  -v ~/.config/claude:/root/.config/claude \
  -w /root \
  --name my-claude-code \
  dust96747/claude-code bash
```

Then run `claude` command inside the container.

### Method 3: Docker Compose Deployment (Multi-Service Support)

```bash
# Start background services
docker compose up -d

# Enter Moonshot Kimi K2 service
docker exec -u root -it claude-code-kimi-1 bash 

# Or choose to enter SiliconFlow service
docker exec -u root -it claude-code-flow-1 bash 

# Navigate to working directory
cd your_project

# Start Claude Code
claude

# When prompted "Do you want to use this API key?" select Yes
# Confirm that the API Key and API Base URL are correctly configured
# Type /init to initialize the project and start AI-assisted development
```

### Docker Compose Service Configuration Details

The provided `docker-compose.yml` contains two complete service configurations:

| Service Name | API Provider | Use Case | Container Name |
|-------------|-------------|----------|----------------|
| **claude-code-kimi-1** | Moonshot Kimi K2 | Preferred for China users | claude-code-kimi-1 |
| **claude-code-flow-1** | SiliconFlow | Alternative/Multi-platform | claude-code-flow-1 |

Both services are pre-configured with:
- ✅ Automatic workspace directory mounting
- ✅ Persistent configuration file storage
- ✅ API key environment variable setup

## Frequently Asked Questions

### Q: How to obtain API keys?
**A:** Choose the platform based on your needs:
- **🌍 International Users**: [Anthropic Console](https://console.anthropic.com/) - Register for official API key
- **🇨🇳 China Users**: [Moonshot Platform](https://platform.moonshot.cn/console/api-keys) - Get Kimi K2 API key  
- **💎 Cost-Effective Recommended**: [SiliconFlow](https://cloud.siliconflow.cn/i/tSgpfq1D) - Invitation rewards continue! New users get 20 million Tokens upon registration (worth 14 yuan), referrers also get 20 million Tokens rewards, providing text conversation, image generation, video generation, voice synthesis and other AI services

### Q: Why is Moonshot API recommended?
**A:** Moonshot's Kimi K2 is a trillion-parameter model optimized for Chinese language, providing:
- ✅ Full compatibility with Anthropic API protocol
- ✅ Network environment optimization for mainland China  
- ✅ Faster response speed and stability
- ✅ Non-proxy service with direct native support

### Q: Data security and persistence?
**A:** Containers are temporary environments by default, with data cleared after exit. For persistence:
- 💾 **Mount config directory**: `-v ~/.config/claude:/root/.config/claude`
- 📁 **Mount working directory**: `-v /your/project:/workspace`
- 🔐 **API key security**: Only saved in mounted configuration directory

### Q: How to specify the AI model to use?
**A:** Use the environment variable `ANTHROPIC_MODEL`:
- `kimi-k2-0905-preview` - Moonshot Kimi K2 latest preview version
- `moonshotai/Kimi-K2-Instruct-0905` - SiliconFlow platform version
- Check respective platform documentation for available models

### Q: How to get SiliconFlow invitation rewards?
**A:** Invitation reward mechanism details:
1. **Registration Reward**: Complete mobile phone registration via [invitation link](https://cloud.siliconflow.cn/i/tSgpfq1D) and get 20 million Tokens instantly
2. **Referral Reward**: Earn 20 million Tokens for each successful new user referral
3. **Credit Description**: 20 million Tokens calculated based on Qwen2.5-14B-Instruct model pricing, actual credit is 14 yuan platform balance
4. **Usage Restrictions**: Reward credits are for SiliconCloud platform use only, non-withdrawable
5. **Rules Reminder**: Please comply with platform rules, reward reselling and fraudulent activities are prohibited

### Q: Container fails to start or connection issues?
**A:** Common solutions:
1. **Check network**: Ensure access to the corresponding API service address
2. **Verify key**: Confirm API Key is valid and has sufficient quota
3. **Port conflicts**: Check if other services are using related ports
4. **Permission issues**: Ensure Docker has sufficient permissions to access mounted directories

## Contributing

Contributions and suggestions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Related Links

- [Claude Code Official Documentation](https://docs.anthropic.com/claude/docs/claude-code)
- [Anthropic Official Website](https://www.anthropic.com/)
- [Docker Hub Image](https://hub.docker.com/r/dust96747/claude-code)
- [Moonshot API Keys](https://platform.moonshot.cn/console/api-keys)
- [SiliconFlow Platform (Recommended Registration)](https://cloud.siliconflow.cn/i/tSgpfq1D) - Cost-effective GenAI cloud services
