## 我的vim配置
+ fork自[spf13-vim][1]，一个相当有影响力的好配置。
+ 经过自己一些整理后，插件的数量略显庞大。
+ 不过，配置文件的行数貌似减少了不少，看起来会清爽一些。

## 配置文件列表
参照我的[neovim][2]的配置思路，分为以下文件：

+ __vimrc__             主配置文件，包含[neobundle][4]的初始化和对以下两个文件夹的引用
+ __neobundles/__       插件列表文件所在文件夹，包含所有安装的插件，按照[spf13-vim][1]进行分组
+ __settings/__    插件配置文件夹，包含已安装插件的一些配置与vim的基本配置，与`neobundles`的分组对应

+ __install.sh__ 用来辅助安装的文件，生成`tmp`文件夹和克隆`neobundle.vim`。
+ __bundle__ 包含在git的忽略文件里，所有安装的插件都在这个文件夹里
+ __tmp__ 包含vim的`swap` `undo` `view` `backup` `session`文件夹

## things todo
1. ✓ replace nerdtree with vimfiler
2. ✓ fix arrow key and esc mapping error
3. ~~complete install.sh~~

    > After executing `install.sh`, the basic plugin `neobundle` has been installed.
    > When you open `vim`, `neobundle` will take care of all other plugins that need installing.
    > So, in some way, this `install.sh` is complete.

4. ✓ split plugins list
4. ✓ split plugins settings
4. good documentation
5. use less plugins as possible

    > This could be difficult for me now. I will try my best.

6. fix issues met in use regularly

## 几点说明
+ 之所以用[neobundle][4]而不是[vundle][3]，是因为我对vim脚本不熟悉，`vundle`用着就出错了。
+ 出错的地方应该在`vundle`的配置路径上没用上函数`expand()`，导致`vundle`无法读取插件，出现一堆让我头疼的东西。
+ 让我最郁闷的是，`vundle`同样的写法，在`neovim`上不会有问题。
+ `neobundle`的使用过程相对平滑，没有出现无法读取插件的问题。
+ 不过，现在已经用上了`neobundle`，就安逸地用了，懒得再去换了。
+ 该配置主要针对`ruby`开发而定制。

## 几点事项
1. 这个配置只打算在linux上（目前是在archlinux）进行使用。
2. 这个配置并不完善，许多地方会有问题。
3. 感谢 __Bram Moolenaar__ 和其他vim的维护者们创造了如此多彩的编辑器。
3. 感谢 __Steve Francia__ 在github上分享了这么有用的配置。
4. 感谢 __Shougo__ 为vim创造了这么多有用的vim插件。
5. 感谢所有插件的作者与维护者们，你们共同创造了vim社区的现在。

## 许可证
Copyright 2015 gisphm <phmfk@hotmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[1]: https://github.com/spf13/spf13-vim.git
[2]: https://github.com/gisphm/myneovimrc.git
[3]: https://github.com/gmarik/Vundle.vim.git
[4]: https://github.com/Shougo/neobundle.vim.git
