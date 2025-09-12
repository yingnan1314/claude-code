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
    if [[ "$ANTHROPIC_BASE_URL" == *"moonshot.cn"* ]]; then
        echo "moonshot"
    elif [[ "$ANTHROPIC_BASE_URL" == *"siliconflow.cn"* ]]; then
        echo "siliconflow"
    else
        echo "anthropic"
    fi
}

# Check if ANTHROPIC_AUTH_TOKEN is already set
if [ -z "$ANTHROPIC_AUTH_TOKEN" ]; then
    clear
    SERVICE=$(detect_api_service)
    
    echo -e "${YELLOW}==================================================${NC}"
    echo -e "${YELLOW}ANTHROPIC_AUTH_TOKEN not set. Please enter your API token:${NC}"
    echo -e "${YELLOW}ANTHROPIC_AUTH_TOKEN 未设置。请输入您的 API 密钥：${NC}"
    echo ""
    
    # Function to display with flashing URL based on service
    display_with_flash() {
        while true; do
            current_token="$ANTHROPIC_AUTH_TOKEN"
            echo "Current token: $ANTHROPIC_AUTH_TOKEN"
            
            # 如果 ANTHROPIC_AUTH_TOKEN 已经设置，则退出循环
            if [ -n "$ANTHROPIC_AUTH_TOKEN" ]; then
                break
            fi
            for color in "$RED" "$YELLOW" "$GREEN" "$BLUE" "$PURPLE" "$CYAN"; do
                tput cup 4 0
                if [ "$SERVICE" = "siliconflow" ]; then
                    echo -e "${BLUE}🎁 SiliconFlow - Cost-effective GenAI service with invitation rewards!${NC}\033[K"
                    echo -e "${BLUE}🎁 SiliconFlow（硅基流动）- 高性价比GenAI服务，邀请奖励持续进行！${NC}\033[K"
                    echo -e "${PURPLE}💎 Get API Key at: ${color}https://cloud.siliconflow.cn/i/tSgpfq1D${NC}\033[K"
                    echo -e "${PURPLE}💎 在此获取API密钥（新用户送2000万Tokens）：${color}https://cloud.siliconflow.cn/i/tSgpfq1D${NC}\033[K"
                elif [ "$SERVICE" = "moonshot" ]; then
                    echo -e "${BLUE}🌙 Moonshot Kimi K2 - Trillion-parameter model optimized for Chinese!${NC}\033[K"
                    echo -e "${BLUE}🌙 月之暗面 Kimi K2 - 专为中文优化的万亿参数模型！${NC}\033[K"
                    echo -e "${PURPLE}You can create an API Key at: ${color}https://platform.moonshot.cn/console/api-keys${NC}\033[K"
                    echo -e "${PURPLE}您可以到【月之暗面】创建官方API密钥【建议充值50元以得到良好体验】：${color}https://platform.moonshot.cn/console/api-keys${NC}\033[K"
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
    if [ "$SERVICE" = "siliconflow" ]; then
        echo -e "${GREEN}🎁 New users get 20M Tokens! / 新用户获得2000万Tokens！${NC}"
        echo -e "${GREEN}🤝 Invite friends, earn more! / 邀请好友，获得更多奖励！${NC}"
    elif [ "$SERVICE" = "moonshot" ]; then
        echo -e "${GREEN}🌟 Optimized for Chinese / 中文优化${NC}"
        echo -e "${GREEN}💰 Recommended: 50¥ top-up / 建议充值50元${NC}"
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
    read -s ANTHROPIC_AUTH_TOKEN
    
    # Stop flashing if still running
    kill $FLASH_PID 2>/dev/null
    wait $FLASH_PID 2>/dev/null
    
    export ANTHROPIC_AUTH_TOKEN
    echo ""
    echo ""
    
    # Show asterisks based on token length
    if [ -n "$ANTHROPIC_AUTH_TOKEN" ]; then
        TOKEN_LENGTH=${#ANTHROPIC_AUTH_TOKEN}
        echo -n "Token received: "
        printf '*%.0s' $(seq 1 $TOKEN_LENGTH)
        echo ""
        echo ""
        echo "Token set successfully. / 密钥设置成功。"
        echo ""
        
        # Confirmation step with 10-second timeout
        CONFIRM=""
        for i in 10 9 8 7 6 5 4 3 2 1; do
            echo -ne "\r${GREEN}Continue? / 是否继续? [Y/n] (auto-confirm in / 自动确认倒计时: $i): ${NC}"
            read -t 1 -r CONFIRM
            if [ $? -eq 0 ]; then  # User pressed something
                break
            fi
        done
        echo ""
        
        # Default to Y if empty (just Enter pressed), timeout, or user enters yes formats
        # Only reject if user explicitly enters n/N/no/No
        if [[ -z "$CONFIRM" || "$CONFIRM" =~ ^[Yy]([Ee][Ss])?$ ]]; then
            echo "Starting Claude Code... / 正在启动 Claude Code..."
            echo ""
            
            # Show instructions instead of countdown
            echo ""
            echo -e "${YELLOW}==================================================${NC}"
            echo -e "${GREEN}🎉 Container is ready! / 容器已就绪！${NC}"
            echo ""
            echo -e "${BLUE}To start Claude Code, run: / 启动 Claude Code，请运行：${NC}"
            echo -e "${CYAN}claude${NC}"
            echo ""
            if [ "$SERVICE" = "siliconflow" ]; then
                echo -e "${PURPLE}💡 Tip: Don't forget to share your invitation link!${NC}"
                echo -e "${PURPLE}💡 提示：别忘了分享您的邀请链接获得更多奖励！${NC}"
                echo -e "${GREEN}   Invitation Link: https://cloud.siliconflow.cn/i/tSgpfq1D${NC}"
            fi
            echo -e "${YELLOW}==================================================${NC}"
            echo ""
        else
            echo "Exiting. / 退出。"
            exit 0
        fi
    else
        echo "No token entered. / 未输入密钥。"
        exit 1
    fi
fi

# Execute the command passed to the container
exec "$@"