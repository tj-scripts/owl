#!/bin/sh
# It supports running both English and Chinese versions of the web application.
#
# Environment setup: 
# 1、Create a virtual environment at first
#   cp tjs/.env.example owl/.env
# 2、Change the environment variables in the .env file
#   Optionally, you can set the `LLM_*` and `VLM_*` variables to the desired models.
#   - `LLM_*` variables are for the LLM model.
#   - `VLM_*` variable is for the VLM model.
#   Or you can set *_ROLE_* variables to customize the roles of the models.
#   - `USER_ROLE_*` variables are for the user role.
#   - `ASSISTANT_ROLE_*` variables are for the assistant role.
#   - `PLANNING_ROLE_*` variables are for the planning role.
#   - `BROWSING_ROLE_*` variables are for the browsing role.
#   - `IMAGE_ROLE_*` variables are for the image role.
#   Or you can both use the `LLM_*` and `VLM_*` variables and the *_ROLE_* variables.
#
# Usage: sh tjs.sh [language]
#   - "en" for English version
#   - Any other value for Chinese version

source .venv/bin/activate

git pull && uv pip install -r requirements.txt

if [ "$1" == "en" ]; then
    # 运行英文版
    python owl/webapp.py
else
    # 运行中文版
    python owl/webapp_zh.py
fi

# 多平台模型运行脚本
# python examples/run_multi_platform_model.py
# python examples/run_multi_platform_model.py "这里还可以写问题" 
# python tjs/run_multi_platform_model.py
# python tjs/run_multi_platform_model.py "这里还可以写问题" 