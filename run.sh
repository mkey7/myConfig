#!/bin/bash

# 获取系统名称
OS_NAME=$(uname)

# 判断是否为 Linux 系统
if [ "$OS_NAME" == "Linux" ]; then
    echo "当前系统是 Linux"

    # 确保目标目录存在
    if [ ! -d "$HOME/.config" ]; then
        mkdir -p "$HOME/.config"
    fi

    # 复制 nvim 文件夹到 ~/.config/nvim
    if [ -d "nvim" ]; then
        ln -sf nvim "$HOME/.config/nvim"
        echo "nvim 文件夹已复制到 ~/.config/nvim"
    else
        echo "nvim 文件夹不存在，请检查当前目录。"
    fi
	ln -sf .tmux.conf "$HOME/.tmux.conf"
	echo ".tmux.conf文件已复制到 ~/.tmux.conf"

# 判断是否为 Windows 系统（例如通过 Git Bash 或 Cygwin）
elif [[ "$OS_NAME" == MINGW* || "$OS_NAME" == CYGWIN* ]]; then
    echo "当前系统是 Windows"

    # 获取 Windows 的配置目录
    NVIM_CONFIG_PATH="$APPDATA/nvim"

    # 确保目标目录存在
    if [ ! -d "$NVIM_CONFIG_PATH" ]; then
        mkdir -p "$NVIM_CONFIG_PATH"
    fi

    # 复制 nvim 文件夹到 $APPDATA/nvim
    if [ -d "nvim" ]; then
        cp -r nvim "$NVIM_CONFIG_PATH"
        echo "nvim 文件夹已复制到 $NVIM_CONFIG_PATH"
    else
        echo "nvim 文件夹不存在，请检查当前目录。"
    fi

else
    echo "未识别的系统: $OS_NAME"
fi

