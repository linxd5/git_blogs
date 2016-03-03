---
title: hexo主题折腾炸鸡
date: 2016-02-29 18:37:04
tags: hexo主题
categories: hexo
description: 搞计算机的同学就是要不怕困难, 不怕折腾
---

<!-- toc -->

## 第一阶段的折腾 (2016/02/29 ~ 2016/03/01)

- [next](https://github.com/iissnan/hexo-theme-next):  这个主题star的人最多, 文档也最齐全, 只是大众的不一定符合我的口味

- [maupassant](https://github.com/tufu9441/maupassant-hexo): 这个主题是小土刀用的, 看着感觉还不错

1. 在站点配置文件(_config.yml)中设置language的时候, 一定要注意后面的值是否有对应的主题language文件, 这些文件一半是在主题的language文件夹下. 就简体中文来说, next对应的主题文件是zh-Hans.yml, 但maupassant对应的是zh-CN.yml

2. google搜索框对应的是站点配置文件中的url, 目前搜索hexo, 找不到相关的网页, 怀疑google还没有收录我的网页.

3. [rss](https://github.com/hexojs/hexo-generator-feed)订阅: 按照官网的instruction, 加入到站点配置文件中.

4. [hexo使用攻略](http://ijiaober.github.io/categories/hexo/)


_____________________________________________

hexo的设置就告一段落了, 以后写作的步骤就是这样子的:

1. hexo new [file]: new一篇博文, 可以在Front-matter里设置category, tags之类的, 详情见[这里](https://hexo.io/docs/front-matter.html).

2. hexo clean: 目前认为这个命令是在删除一篇博文的时候事情, 目的是为了clean和被删除博文相关的文件和文件夹.

3. hexo generate: md -> html

4. hexo deploy: 部署在服务器上(这里是github)

5. git相关操作: 为了能够跨多台机器进行写作.

ps: 关于图片的部分以后再自己慢慢摸索.

Simple inline $a = b + $c

----------------------------------------------------

## 第二阶段的折腾: MathJax

> 为了上面那条公式的显示, 我用了三个小时的时间, 耗尽心血啊!

### math-hexo

hexo上显示数学公式的插件有两个: `hexo-renderer-mathjax`和`hexo-math`, 前者star的人比较少, 按文档的指示没有安装成功, 直接 `npm unistall hexo-renderer-mathjax`. 后者在google的时候发现两种版本:

- 一种是老版本的安装, 采用的是这种方法:
![](/images/2.png)

- 另一种是[官网](https://github.com/akfish/hexo-math#migration-note)上的安装方法:
![](/images/3.png)

官网下面的那句** Your config will be merged into default config **, 我到现在都还没弄明白是什么意思. 然后把文档上上下下翻了个遍, 也没有找到有用的信息.

经过一番折腾之后, 我决定不再依赖hexo-math, 看看还有没有其他的办法 ?

### next mathjax

折腾了很久之后, 突然想起hexo另一个主题`next`是支持mathjax的, 于是使用命令`grep mathjax -r .`扫到了这样的东西:
![](/images/4.png)
代码不复杂啊, 就这么几行代码, 我心中暗自窃喜. 于是扫描了一遍`maupassant` layout目录下的文件之后, 我抄起家伙, 打算往after_footer.jade文件里塞入几行代码. 但是这次我碰上了硬家伙, terminal提示编译什么鬼的出了问题. google了一下, 发现是`swig`, `jade`这两个前端模板引擎语言, 可惜我已经离开前端江湖很多个月了, 鼓捣了一下, 发现太复杂, 只得放弃.

![](/images/5.png)

### 柳暗花明

在我就快要放弃的时候, 黎明的曙光才珊珊到来 -- 我发现了这个[网站](http://t.tiany.me/2015/12/08/hexo-config/). 这里, 我参考了后面的那种[做法](https://github.com/tiany/maupassant-hexo/commit/fd8319fbf9a5f0936ad3348132e41d5c2d5a8215#diff-71257dade4be9be31d2d24b3c2d8a0ea), 往`layout/base.jade`的头部注入了两行JS代码, 然后创建`source/js/mathjax.js`文件来配置MathJax.

这里需要注意的一点是, hexo出于对原创主题的保护, 在对某个文件进行修改后(例如layout/base.jade), 会把源文件命名为另一个文件(例如layout/base.jade~), 然后编译的时候发现某文件被修改的话, terminal就会报错. 解决方法也很简单, 直接把原来的文件(例如layout/base.jade~)删除掉就可以了.


### 再下一城

收到了_debug的回复, 他说`讲道理只需要 npm install hexo-math --save 即可`.

于是我hexo init了一个新的blogs, 然后在原始的主题`landscape`中进行了测试, 只敲上面那行命令, 而没有配置其它的东西, 之后竟然能够正常地显示数学公式了.
然后我把主题改成`maupassant`, 仍然能够正常地显示数学公式.

收到小土刀的回复, 他建议我在配置文件中加入:

> plugins:
- hexo-generator-feed
- hexo-generator-sitemap
- hexo-math

于是我在`站点配置文件`中加入了这些东西, 结果编译报错. 我在`站点配置文件`中加入这些东西, 编译没有报错, 数学公式正常显示.

因此, 我认为之前`输入安装命令+修改配置文件`没能成功的关键在于错误地修改配置文件之后, 导致编译出错, 进而导致数学公式不能成功显示.


## TODO

- 关于为什么要在配置文件中加入:

> plugins:
- hexo-generator-feed
- hexo-generator-sitemap
- hexo-math

- 对`maupassant`的TOC不大满意, 我期望能有这样的[TOC](http://luuman.github.io/2016/02/28/MobileRotate/).

- 对一些有用的资源进行整理, 做成类似这样的[界面](http://luuman.github.io/FrontEndGuide/V1/index.html).