---
title: 机器学习之Regression
date: 2016-03-04 11:23:33
tags: machine_learning_NG_cousera
categories: machine_learning
---

[NG cousera 公开课](https://www.coursera.org/learn/machine-learning/lecture/ACpTQ/the-problem-of-overfitting)中介绍了两种解决overfitting的方法:

1. Reduce number of features
    - Manually select which features to keep
    - Model selection algorithm
2. Regularization
    - Keep all the features, but reduce magnitude / values of parameters $\theta_j$
    - Works well when we have a lot of features, each of which contributes a bit to predicting $y$

__________________________

overfitting的问题都是因为features太多, 模型太复杂.  那么我们要怎么解决overfitting呢? 

1. 一种办法是说, 我选择留下一些比较重要的features, 另外一些不那么重要的features就直接扔掉.
2. 另一种办法是说, 这些features都同等重要, 我也不知道要扔掉哪个, 那我就对所有的features都做一个限制, 从而防止overfitting.

_________________________

这里还有一个疑点, **Keep all the features, but reduce magnitude / values of parameters $\theta_j$**, 这句话是什么意思呢?

我的理解是, 如果是正常fit data的模型, 把它们plot出来之后, 会发现曲线比较平缓, 所以对应的$\theta_j$就会比较小. 但如果是overfitting的复杂模型, 他们的曲线一般会比较陡峭, 对应的$\theta_j$就会比较大.

为了验证这个猜想, 在启良师兄的鼓舞下, 我原本想通过改ex1来看看效果的. 后来弄弄之后还是算了, **专注于自己的目标, 不重复造轮子**. 于是google `polynomial regression online` 之后, 找到了这个[网站](http://arachnoid.com/polysolve/).

为了显示的效果, 我只用了`ex1data1.txt`一部分的数据如下:
> 6.1101 17.592
5.5277 9.1302
8.5186 13.662
7.0032 11.854
5.8598 6.8233
8.3829 11.886
7.4764 4.3483

然后分别取degree = 1, 3, 6, 显示效果如下:

![degree=1](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/6.jpg)

___________

![degree=3](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/7.jpg)

____________

![degree=6](https://raw.githubusercontent.com/linxd5/git_blogs/master/blogs/source/images/8.jpg)

____________

结果显示, 随着degree的增大, 模型中参数的最大值也会增大, 这在一定程度上验证了我们的猜想.