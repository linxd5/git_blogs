#!/bin/bash



hexo clean                    
hexo generate
hexo deploy
git add --all
git commit -m "my blogs"
git push origin master


export DISPLAY=:0.0    # 启动GUI显示

haroopad /home/panjinbo/Desktop/git_blogs/README.md
