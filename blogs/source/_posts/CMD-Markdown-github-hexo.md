---
title: CMD Markdown + github + hexo
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


Markdown编辑器的光标一闪一闪的, 这让我觉得十分不舒服. 但是也没有办法啊, Markdown的vim是嵌入在可执行文件里边的, 外部没有留下任何的配置文件可供输入. 也只能到作者的github上提issus, 不过好像之前已经有人提这个问题了, 但作者没有回复, 估计希望不大.

原本我打算用vim来搭一个Markdown编辑器, 它能够实时预览, 同时能够写数学公式. 但这个工程是十分浩大的, 我不禁问自己, 我要的到底是什么 ? **所以我选择了屈服, 选择了接受不完美, 程序员应该专注于目标, 而不是重复造轮子**.

印象笔记 $\cdot$ 剪藏实在是太强大了, 框框箭头正是写博客截图时所需要的所有东西, 多一分太多, 少一分太少. 不过因为截图处理后的结果只能保存到 Evernote 中, 所以我要到 Evernote 中下载图片, 然后保存到 hexo 博客的 source/images 目录下, 这个过程还是有点繁琐的.