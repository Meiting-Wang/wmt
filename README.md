# Stata 命令 wmt 的更新——查询并安装个人写的 Stata 新命令

> 作者：王美庭  
> Email: wangmeiting92@gmail.com

## 一、引言

为了命令使用更方便，我们对该命令进行了如下更新：

- 修复了该命令不能描述和安装个人写的最新命令的 bug；
- 增加了`wmt update`功能，用以更新`wmt`命令本身（即等同于`wmt install wmt, replace`）。

同时我也更新了本文档（旧文档参见 [Stata 新命令：wmt——查询并安装个人写的 Stata 新命令](https://mp.weixin.qq.com/s/P2V_6et9crS5GeNNfO-6xQ)），详情如下：

创建微信公众号以来，个人已发布过 18 个 Stata 命令。这些命令都是为了解决自己某一方面问题而书写的，后面新命令的发布也会继续秉承这样的原则。也许大家会说在哪里发现了类似的命令，不过还请大家不要见怪，因为：

- 你发现了功能类似的命令，但是我刚好没有看到。
- 我也发现了，但由于有强迫症的我，对于现有命令的某些细节还是不满意，于是就自己写一个。（读者可以对比一下我写的`fn`命令和现有的`fs`命令）

通过与大家在微信公众号后台和邮件中的交流，发现这些命令对于大家来说还是有一定用处的。由于现有安装 github 中托管的 Stata 命令的语句有些长以及存在着一定的问题：

- `net install`的语句太长，记不住
- `github install`不能自动提示已经存在的命令

所以个人基于简洁语法的原则和 Stata 自带命令`net`的内核，创建了一个专门用于安装我个人所写命令的命令。**该命令具有以下特点**：

1. 可以查询并安装所有我写过的命令。所有我写过的命令可以`help wmt`或在本文第六节进行查看。
2. 语法简洁易记，与我们常用的`ssc describe...`和`ssc install ...`语法一致。
3. 对于已经存在的命令都会进行提示。如果内容与远端的不一样，则必须加上`replace`或`force`选项才能进行安装。
4. 使用`wmt update`能实现对命令`wmt`本身的更新。
5. 使用命令后运行`return list`可以得到以下返回值：（1）用户所要查询或安装的命令；（2）用户所有查询或安装的命令的数量；（3）所有我个人已经写过的命令。

## 二、命令的安装

`wmt`及本人其他命令的代码都托管于 GitHub 上，读者可随时下载安装这些命令：

```stata
net install wmt, from("https://raw.githubusercontent.com/Meiting-Wang/wmt/main")
```

## 三、语法与选项

**查询单个或多个个人所写的命令：**

```stata
wmt describe commands
```

> - `describe`: 最短可以缩写为`d`

**安装单个或多个个人所写的命令：**

```stata
wmt install commands [, replace force]
```

> - `install`: 最短可以缩写为`i`
> - `replace`: 如果安装文件已存在且不一样，则替换之；如果一样，则不做任何操作
> - `force`: 如果安装文件已存在(无论是否一样)，都强制替换之

**更新`wmt`命令本身：**

```stata
wmt update
```

> - `update`: 最短可以缩写为`u`

## 四、实例

```stata
* 描述或安装单个命令
wmt describe mas //查询一下 mas 命令(含 title、description、authors、installation files)
wmt install mas //安装命令 mas。如果文件已存在且不一样，则会告诉你哪些文件不一样，但不做任何操作
wmt install mas, replace //安装命令 mas。如果安装文件已存在且不一样，则替换之；如果一样，则不做任何操作
wmt install mas, force //安装命令 mas。如果安装文件已存在(无论是否一样)，都强制替换之
return list //返回值

* 描述或安装多个命令
wmt describe fn mas
wmt install fn mas
wmt install fn mas, replace
wmt install fn mas, force
return list //返回值

* 更新命令 wmt 本身
wmt update
```

## 五、输出展示

```stata
wmt describe fn mas
```

```stata
------------------------------------------------------------------------------
package fn from https://raw.githubusercontent.com/Meiting-Wang/fn/main
------------------------------------------------------------------------------

TITLE
      fn. Return the name and path of the specified files

DESCRIPTION/AUTHOR(S)
      Meiting Wang
      Institute for Economic and Social Research, Jinan University
      Guangzhou, China
      wangmeiting92@gmail.com

INSTALLATION FILES                                   (type net install fn)
      fn.ado
      fn.sthlp
------------------------------------------------------------------------------


------------------------------------------------------------------------------
package mas from https://raw.githubusercontent.com/Meiting-Wang/mas/main
------------------------------------------------------------------------------

TITLE
      mas. Perform matching and substituting operations on text files

DESCRIPTION/AUTHOR(S)
      Meiting Wang
      Institute for Economic and Social Research, Jinan University
      Guangzhou, China
      wangmeiting92@gmail.com

INSTALLATION FILES                                  (type net install mas)
      mas.ado
      mas_main.ado
      mas_del.ado
      mas_coa.ado
      mas.sthlp
------------------------------------------------------------------------------
```

```stata
wmt install fn mas, force
```

```stata
------------------------------------------------------------------------------
checking fn consistency and verifying not already installed...

the following files will be replaced:
    D:\stata16/ado\plus\f\fn.ado
    D:\stata16/ado\plus\f\fn.sthlp

installing into D:\stata16/ado\plus\...
installation complete.
------------------------------------------------------------------------------
checking mas consistency and verifying not already installed...

the following files will be replaced:
    D:\stata16/ado\plus\m\mas.ado
    D:\stata16/ado\plus\m\mas_main.ado
    D:\stata16/ado\plus\m\mas_del.ado
    D:\stata16/ado\plus\m\mas_coa.ado
    D:\stata16/ado\plus\m\mas.sthlp

installing into D:\stata16/ado\plus\...
installation complete.
------------------------------------------------------------------------------
```

```stata
wmt update
```

```stata
-------------------------------------------------------------------------------
checking wmt consistency and verifying not already installed...
all files already exist and are up to date.
-------------------------------------------------------------------------------
```

## 六、目前我发布过的所有命令

1. [Stata 新命令：open--open everything](https://mp.weixin.qq.com/s/IdaTRmNS9itNinM7A3giIA)
17. [Stata 新命令：skewnor--生成 skew-normal 随机数](https://mp.weixin.qq.com/s/P72o_IQQU0vc2FQh0au8Pg)
16. [Stata 新命令：levelsof2--加强版 levelsof](https://mp.weixin.qq.com/s/99YEiViH9fSAa6cXKYESNg)
15. [Stata 新命令：wmt——查询并安装个人写的 Stata 新命令](https://mp.weixin.qq.com/s/P2V_6et9crS5GeNNfO-6xQ)
14. [Stata 新命令：del——删除一个或多个文件](https://mp.weixin.qq.com/s/KEC1H5lUiuPV73Cpy-roow)
13. [Stata 新命令：mas——文本文件内容的匹配与替换](https://mp.weixin.qq.com/s/EHoI4KFtueJp6kPh3IGzoA)
12. [Stata 新命令：fn——返回特定文件格式的文件名与所在路径](https://mp.weixin.qq.com/s/-Av-6qrATkMGtTdedmUsHg)
11. [Stata 新命令：tabstat2——"tabstat"命令结果的输出](https://mp.weixin.qq.com/s/DimxIuzA49HQeflW_V-W-w)
10. [Stata 新命令：table2——"table"命令结果的输出](https://mp.weixin.qq.com/s/59zPMeuCKtEw5E8HesVOCg)
9. [Stata 小程序：mat_cagn——解决类似mat A["mpg",1]=B[3,3]出现type mismatch的问题](https://mp.weixin.qq.com/s/Pe8YT5ukf4AM3fBzVy006g)
8. [Stata 小程序：space_rm——去除字符串括号里的空格](https://mp.weixin.qq.com/s/RoOv8R4QxH1tHZj1JcDBQw)
7. [Stata 新命令：wmtstr——对字符串进行唯一化、升序、降序处理](https://mp.weixin.qq.com/s/rlLLTwf20d8roudqt9hy_A)
6. [Stata 新命令：matmh——扩展版的矩阵运算命令](https://mp.weixin.qq.com/s/hdXH3D3fgXxxKbC9Z-e7GQ)
5. [Stata 新命令：wmtmat——矩阵的输出](https://mp.weixin.qq.com/s/CgHd8OxTuL5V_CwHKVaFRQ)
4. [Stata 新命令：wmtreg——回归结果的输出](https://mp.weixin.qq.com/s/VcYmeYUAm1QSYcVU0fVLXA)
3. [Stata 新命令：wmtcorr——相关系数矩阵的输出](https://mp.weixin.qq.com/s/K8pZokyZrB6nLUlEKytmDw)
2. [Stata 新命令：wmttest——分组 T 均值检验表格的输出](https://mp.weixin.qq.com/s/8w22ms0AttN1TqQZyN9dUA)
1. [Stata 新命令：wmtsum——描述性统计表格的输出](https://mp.weixin.qq.com/s/oLgXf0KTgoePOnN1mJUllA)

> 点击【阅读原文】可进入该命令的 github 项目。

