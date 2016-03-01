---
title: hexo主题折腾炸鸡
date: 2016-02-29 18:37:04
tags: hexo主题
categories: hexo
---

### 第一阶段的折腾 (2016/02/29 ~ 2016/03/01)

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