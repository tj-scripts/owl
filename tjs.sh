#!/bin/sh
# This script is used to run the multi-platform model for TJS.
# sh tjs.sh

source .venv/bin/activate

git pull && uv pip install -r requirements.txt

if [ $1 == "en" ]; then
    # 运行英文版
    python owl/webapp.py
else
    # 运行中文版
    python owl/webapp_zh.py

# 多平台模型运行脚本
# python examples/run_multi_platform_model.py
# python examples/run_multi_platform_model.py "这里还可以写问题" 