@echo off
chcp 65001 >nul
echo 检测uv是否已安装...
where uv >nul 2>&1
if %errorlevel% == 0 (
    echo uv已安装，跳过安装步骤。
) else (
    echo uv未安装，正在使用pip安装uv...
    pip install uv
    if %errorlevel% == 0 (
        echo uv安装完成。
    ) else (
        echo uv安装失败，请检查网络连接或pip配置。
    )
)

echo 检测MoFox-Core目录...
if exist "%~dp0MoFox-Core" (
    echo 切换到MoFox-Core目录...
    cd /d "%~dp0MoFox-Core"
    if %errorlevel% == 0 (
        echo 检测虚拟环境...
        if exist ".venv" (
            echo 虚拟环境已存在，跳过创建步骤。
        ) else (
            echo 创建虚拟环境...
            uv venv
            if %errorlevel% == 0 (
                echo 虚拟环境创建成功。
            ) else (
                echo 虚拟环境创建失败。
                pause
                exit /b
            )
        )
        echo 安装依赖...
        uv pip install -r pyproject.toml -i https://repo.huaweicloud.com/repository/pypi/simple
        if %errorlevel% == 0 (
            echo 依赖安装成功。
            echo 运行bot.py...
            uv run python bot.py
        ) else (
            echo 依赖安装失败，请检查网络连接或配置。
        )
    ) else (
        echo 无法切换到MoFox-Core目录，请确保目录存在。
    )
) else (
    echo 未检测到MoFox-Core目录，正在克隆仓库...
    git clone https://github.com/MoFox-Studio/MoFox-Core.git
    if %errorlevel% == 0 (
        echo MoFox-Core仓库克隆成功。
        echo 切换到MoFox-Core目录...
        cd /d "%~dp0MoFox-Core"
        if %errorlevel% == 0 (
            echo 检测虚拟环境...
            if exist ".venv" (
                echo 虚拟环境已存在，跳过创建步骤。
            ) else (
                echo 创建虚拟环境...
                uv venv
                if %errorlevel% == 0 (
                    echo 虚拟环境创建成功。
                ) else (
                    echo 虚拟环境创建失败。
                    pause
                    exit /b
                )
            )
            echo 安装依赖...
            uv pip install -r pyproject.toml -i https://repo.huaweicloud.com/repository/pypi/simple
            if %errorlevel% == 0 (
                echo 依赖安装成功。
                echo 运行bot.py...
                uv run python bot.py
            ) else (
                echo 依赖安装失败，请检查网络连接或配置。
            )
        ) else (
            echo 无法切换到MoFox-Core目录，请确保目录存在。
        )
    ) else (
        echo git clone失败，请检查网络连接或git配置。
    )
)

pause