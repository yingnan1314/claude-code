#!/bin/bash

# Define color codes
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Detect API service based on ANTHROPIC_BASE_URL
detect_api_service() {
    if [[ "$ANTHROPIC_BASE_URL" == *"agentrouter.org"* ]]; then
        echo "agentrouter"
    else
        echo "codex"
    fi
}

# Check if OPENAI_AUTH_TOKEN is already set
if [ -z "$OPENAI_AUTH_TOKEN" ]; then
    clear
    SERVICE=$(detect_api_service)
    
    echo -e "${YELLOW}==================================================${NC}"
    echo -e "${YELLOW}OPENAI_AUTH_TOKEN not set. Please enter your API token:${NC}"
    echo -e "${YELLOW}OPENAI_AUTH_TOKEN 未设置。请输入您的 API 密钥：${NC}"
    echo ""
    
    # Function to display with flashing URL based on service
    display_with_flash() {
        while true; do
            current_token="$OPENAI_AUTH_TOKEN"
            echo "Current token: $OPENAI_AUTH_TOKEN"
            
            # 如果 OPENAI_AUTH_TOKEN 已经设置，则退出循环
            if [ -n "$OPENAI_AUTH_TOKEN" ]; then
                break
            fi
            for color in "$RED" "$YELLOW" "$GREEN" "$BLUE" "$PURPLE" "$CYAN"; do
                tput cup 4 0
                if [ "$SERVICE" = "agentrouter" ]; then
                    echo -e "${BLUE}🎁 AgentRouter - Cost-effective GenAI service with invitation rewards!${NC}\033[K"
                    echo -e "${BLUE}🎁 AgentRouter - 高性价比GenAI服务，邀请奖励持续进行！${NC}\033[K"
                    echo -e "${PURPLE}💎 Get API Key at: ${color}https://agentrouter.org/register?aff=Boxc${NC}\033[K"
                    echo -e "${PURPLE}💎 在此获取API密钥（新用户送200美元）：${color}https://agentrouter.org/register?aff=Boxc${NC}\033[K"
                else
                    echo -e "${BLUE}🤖 Anthropic Official API - Direct access to Claude models${NC}\033[K"
                    echo -e "${BLUE}🤖 Anthropic 官方 API - 直接访问 Claude 模型${NC}\033[K"
                    echo -e "${PURPLE}Get your API Key at: ${color}https://console.anthropic.com/${NC}\033[K"
                    echo -e "${PURPLE}在此获取您的API密钥：${color}https://console.anthropic.com/${NC}\033[K"
                fi
                tput cup 10 0
                sleep 0.4
            done
        done
    }
    
    # Show service-specific information
    echo -e "${CYAN}Current API Service / 当前API服务: ${SERVICE}${NC}"
    if [ "$SERVICE" = "agentrouter" ]; then
        echo -e "${GREEN}🎁 New users get $200 money! / 新用户获得200美元！${NC}"
        echo -e "${GREEN}🤝 Invite friends, earn more! / 邀请好友，获得更多奖励！${NC}"
    else
        echo -e "${GREEN}🌍 Global official service / 全球官方服务${NC}"
    fi
    echo ""
    
    # Display initial content with infinite flashing
    display_with_flash &
    FLASH_PID=$!
    
    echo -e "${YELLOW}==================================================${NC}"
    echo ""
    echo -ne "${GREEN}API Token/API 密钥【粘贴后直接按回车Enter】: ${NC}"
    
    # Read input
    read -s OPENAI_AUTH_TOKEN
    
    # Stop flashing if still running
    kill $FLASH_PID 2>/dev/null
    wait $FLASH_PID 2>/dev/null
    
    export OPENAI_AUTH_TOKEN
    echo ""
    echo ""

    # 创建 ~/.codex/config.toml 文件，并添加如下配置
    mkdir -p ~/.codex
    cat > ~/.codex/config.toml <<EOF
model = "gpt-5"
model_provider = "openai-chat-completions"
preferred_auth_method = "apikey"
EOF
    cat >> ~/.codex/config.toml <<EOF
[model_providers.openai-chat-completions]
name = "OpenAI using Chat Completions"
base_url = "https://agentrouter.org/v1"
env_key = "AGENT_ROUTER_TOKEN"
wire_api = "chat"
query_params = {}
EOF

    cat >> ~/.codex/auth.json <<EOF
{
 "OPENAI_API_KEY":"$OPENAI_AUTH_TOKEN"
}
EOF

fi

# Execute the command passed to the container
exec "$@"