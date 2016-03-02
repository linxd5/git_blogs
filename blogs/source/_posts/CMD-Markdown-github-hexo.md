---
title: CMD_Markdown_+_github_+_hexo
date: 2016-03-02 12:27:22
tags: Markdown editor
categories: Markdown editor
---


之前写作的时候使用的编辑器是haroopad(ubuntu), 但是这家伙不支持数学公式的显示．早上和小彬师兄在路上聊天的时候，他提到CMD Markdown编辑器支持MathJax. 

### CMD Markdown

不过和所有的笔记软件类似，CMD Markdown也设计了会员制度，类似`一键导出`, `上传本地图片`等功能是需要收费的. 当然, 我不是土豪, 不能说想要会员就能有会员, 于是还是得想想绕行一点的解决方案.

**CMD Markdown 支持vim模式, 同时支持MathJax的实时预览, 还有本地的客户端**, 我大概的搜索了一下, 能满足这几项的Markdown编辑器着实很少, 于是就毫不犹豫地选择CMD Markdown了. 说到CMD Markdown的客户端, 这里想吐槽一下, 这家伙竟然不能打开本地的md文件, 活脱脱就是网页版的本地延伸而已....

原本也想用印象笔记的, 因为周边的很多人都在用这个, 而之前我也特别羡慕它的网页截图功能. 但是印象笔记好像不支持vim模式, 不支持MathJax, 没有客户端, 于是最终还是放弃了. 网页截图的功能现在分解成调用ubuntu的截图工具进行截图, 上传到github中, 然后通过链接地址进行引用. 这种方法使得图片在CMD Markdown上和hexo 博客上都能显示出来.

github图片的链接地址并不是: 
`https://github.com/linxd5/git_blogs/blob/master/blogs/source/images/1.jpg`, 
而是这样:
`https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/1.jpg`

为什么要自己搭博客, 而不选择使用CSDN, cnblog或简书这样的工具(它们一般会有比较完善的各种问题的解决方案的), 这是一个可以思考的问题. 

![这是测试图片](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/1.jpg)