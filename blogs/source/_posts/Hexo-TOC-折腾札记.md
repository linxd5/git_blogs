---
title: Hexo_TOC_折腾札记
date: 2016-03-04 11:21:31
tags: hexo
categories: hexo
description: 想不明白, 自己为什么要这么折腾, 为什么不好好看书, 好好写毕业论文. 或许是失落时的一种逃避吧, 人总要找点事情让自己忙起来.
---



## 目标

使用`maupassant`两三天了, 使起来还算顺手. 但某些细节的地方还是不太满意, 因此需要折腾折腾. 本篇属于`Hexo折腾系列`的第二篇 -- Hexo TOC 折腾札记.

这里通过`npm install hexo-toc`安装了[hexo-toc](https://github.com/bubkoo/hexo-toc), 但是这种原生的目录只能显示在博文的最上方, 而我希望目录能够一直显示在博文的右边. 另外, `maupassant`主题默认情况下, 博文右边显示的是`搜索框`, `分类`, `标签`之类, 具体情况我们可以看下面这一张图:

![](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/9.jpg)

______________________

## 步骤

明确了我们要做的事情后, 我们的计划如下:

1. 移走博文右边的框框
2. 移入博文上面的目录

_____________________


## 移走博文右边的框框

首先, 这里需要明确的一点是, 我们只是要移走`详细博文页`的右边框框, 对于`Home`, `Archive`的右边框框, 我们还是要保留的. 所以我们需要把详细博文页和Home, Archive区分开. 

### 通过 base.jade 移走框框

通过艰辛的文本查找, 我定位到了`maupassant/layout/base.jade`, 里面有这么一段代码:

![](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/10.png)

通过与智敏的探讨, 我选择了这样一种方案, 把`base.jade` copy 一份并命名成 `base_no_widgets.jade`. 然后在`post.jade` (博文详情页模板) 中, 我们 `include base_no_widgets`来替代`include base`. 这种做法的好处是, 我们能够从源头上杜绝不需要的DOM的产生, 而不是产生后再移走它.

在这个过程中, 我发现jade文件并不是不能修改的, 并不是像我以前认为的那样, 修改jade文件后会导致编译出错之类的, 只不过是我缺少了一点修改jade文件的知识而已. 同时, 我发现XX.jade文件最后会被编译成XX.html, 而通过使用WebStorm IDE, 能够减少一个tab和space之类的问题.


### 通过 post.jade 移走框框

接下来, 我找到了`maupassant/layout/post.jade`. 我设想博文详细页加载的时候, 会调用这个模板, 之后的简单实验也证明了我的这个设想.

虽然我们不能在源头上杜绝右边框框的产生, 但我们能够阻止右边框框的出现. 这里我往`maupassant/layout/post.jade`里面嵌入了两行代码:
```
    script(type='text/javascript', src=url_for(theme.js) + '/jquery.min.js' + '?v=' + theme.version)
    script(type='text/javascript', src=url_for(theme.js) + '/toc.js')
```

toc.js 的代码如下:
```
$(document).ready(function () {
    var toc = $('.post-content'), content = toc.html();
    content = content.replace('<!-- toc -->', '<div class="pure-u-1-4" id="sidebar">').replace('<!-- tocstop -->', '</div>');
    toc.html(content);
    $('.pure-u-1.pure-u-md-3-4').parent().prepend($('.pure-u-1-4'));
    $('.pure-u-1-4').css("position", "fixed").css("right", "50px").css("top", "200px")
        .css("background-color", "#F5F7F9").css("line-height", "150%").css("padding", "0").css("width", "20%");
});
```
这里, 我们先定位到目录所在的地方, 并且让它的class和原来widgets的class是一样的, 来保证我们网页布局风格的一致性. 然后利用JQ稍微地调整里一下目录的样式, 定位方式改成固定定位.

最后的效果图如下所示:
![](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/11.png)

强迫症受不了, 折腾来折腾去, 最后还是觉得不大满意, 还是改回原来的样式好了, o(╯□╰)o.

_____________

若想使用自己折腾的东西, 修改如下:

1. `post.jade`中修改`extends base`为`extends base_no_widgets`.
2. `post.jade`第33, 34行引入`JQuery`和`toc.js`

