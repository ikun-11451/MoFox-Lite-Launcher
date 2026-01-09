# MoFox Lite Launcher

MoFox Lite Launcher 是一个用于快速安装、更新和运行 MoFox-Core 项目的 Windows 批处理脚本集合。

## 功能特性

- 自动安装 uv 工具
- 克隆 MoFox-Core 仓库
- 创建 Python 虚拟环境
- 安装项目依赖
- 更新 MoFox-Core 代码
- 安装 WebUI 插件
- 运行 bot.py 主程序

## 脚本说明

### install.bat - 安装脚本

此脚本用于安装启动 MoFox-Core 项目：

1. 检测并安装 uv 工具
2. 克隆 MoFox-Core 仓库
3. 创建 Python 虚拟环境
4. 安装项目依赖
5. 运行 bot.py 主程序

### update.bat - 更新脚本

此脚本用于更新 MoFox-Core 代码：

1. 切换到 MoFox-Core 目录
2. 执行 git pull 更新代码

### webui.bat - WebUI 插件安装脚本

此脚本用于安装 WebUI 插件：

1. 切换到 MoFox-Core\plugins 目录
2. 克隆 MoFox-Core-Webui 仓库的 webui-dist 分支到 webui_backend 目录

## 使用方法

1. 双击运行 `install.bat` 完成安装启动
2. 如需更新代码，双击运行 `update.bat`
3. 如需安装 WebUI 插件，双击运行 `webui.bat`

## 系统要求

- Windows 操作系统
- 网络连接
- Git for Windows
- Python 3.12+

## 注意事项

- 请确保运行脚本前已安装 Git for Windows
- 首次运行 install.bat 时，请勿关闭命令行窗口直到安装完成
- 如遇到网络问题，请检查网络连接或更换网络环境后重试