@echo off
chcp 65001 >nul
echo 检测MoFox-Core目录...
if exist "%~dp0MoFox-Core" (
    echo 切换到MoFox-Core目录...
    cd /d "%~dp0MoFox-Core"
    if %errorlevel% == 0 (
        echo 正在更新MoFox-Core...
        git pull
        if %errorlevel% == 0 (
            echo MoFox-Core更新成功。
        ) else (
            echo git pull失败，请检查网络连接或git配置。
        )
    ) else (
        echo 无法切换到MoFox-Core目录，请确保目录存在。
    )
) else (
    echo 未检测到MoFox-Core目录，请先运行install.bat安装依赖。
)

pause