## 我的vim配置
+ fork自[spf13-vim][1]，一个相当有影响力的好配置。
+ 经过自己一些整理后，插件的数量略显庞大。
+ 不过，配置文件的行数貌似减少了不少，看起来会清爽一些。

## 配置文件列表
参照我的[neovim][2]的配置思路，分为以下文件：

+ __vimrc__ 主配置文件，包含[neobundle][4]的初始化和vim插件的初次安装
+ __plugins.vim__ 插件列表文件，包含所有安装的插件，按照[spf13-vim][1]进行分组
+ __plugins.rc.vim__ 插件的配置，尽可能地不包含vim的基本配置
+ __local.vim__ vim的基本配置，离开了插件也能运行

## 几点说明
+ 之所以用[neobundle][4]而不是[vundle][3]，是因为我对vim脚本的不熟悉。
+ 在`vundle`的配置路径上没用上函数`expand()`，导致vundle无法读取，出现一堆让我头疼的东西。
+ neobundle的使用过程相对平滑，没有多少的问题。
+ 让我最郁闷的是，vundle同样的写法，在neovim上不会有问题。
+ 不过，现在已经用上了neobundle，就安逸地用了，懒得再去换了。

## 几点事项
1. 这个配置只打算在linux上（目前是在archlinux）进行使用。
2. 这个配置并不完善，许多地方会有问题。
3. 感谢__Steve Francia__在github上分享了这么有用的配置。
4. 感谢__Shougo__在github上为vim创造了这么多有用的vim插件。
5. 感谢所有插件的作者与维护者们，你们共同创造了vim社区的现在。

[1]: https://github.com/spf13/spf13-vim.git
[2]: https://github.com/gisphm/myneovimrc.git
[3]: https://github.com/gmarik/Vundle.vim.git
[4]: https://github.com/Shougo/neobundle.vim.git
