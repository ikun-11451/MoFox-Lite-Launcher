@echo off
chcp 65001 >nul
echo 检测MoFox-Core目录...
if exist "%~dp0MoFox-Core" (
    echo 切换到MoFox-Core\plugins目录...
    cd /d "%~dp0MoFox-Core\plugins"
    if %errorlevel% == 0 (
        echo 正在克隆MoFox-Core-Webui仓库...
        git clone -b webui-dist https://github.com/MoFox-Studio/MoFox-Core-Webui.git webui_backend
        if %errorlevel% == 0 (
            echo MoFox-Core-Webui仓库克隆成功，在你的MoFox-Core\config\bot_config.toml中配置plugin_api_valid_keys以设置WebUI密码。
        ) else (
            echo git clone失败，请检查网络连接或git配置。
        )
    ) else (
        echo 无法切换到MoFox-Core\plugins目录，请确保目录存在。
    )
) else (
    echo 未检测到MoFox-Core目录，请先运行install.bat安装依赖。
)

pause