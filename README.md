## 我的vim配置
+ fork自[spf13-vim][1]，一个相当有影响力的好配置。
+ 去掉了些自己不用的插件，也替换了一些，算是个性化了不少。
+ 此配置目前希望是有助于rails开发（自己个人在学习着）

## 配置文件列表
+ __vimrc__             主配置文件，包含[neobundle][4]的初始化和对以下两个文件夹的引用
+ __neobundles/__       插件列表文件所在文件夹，包含所有安装的插件，按照[spf13-vim][1]进行分组
+ __settings/__    插件配置文件夹，包含已安装插件的一些配置与vim的基本配置，与`neobundles`的分组对应
+ __install.sh__ 用来辅助安装的文件，生成`tmp`文件夹和克隆`neobundle.vim`。
+ __bundle__ 包含在git的忽略文件里，所有安装的插件都在这个文件夹里
+ __tmp__ 包含在git的忽略文件里，包括vim的`swap` `undo` `view` `backup` `session`文件夹

## things todo
1. ✓ replace nerdtree with vimfiler
2. ✓ fix arrow key and esc mapping error
3. ~~complete install.sh~~

    > 1. After executing `install.sh`, the basic plugin `neobundle` has been installed.
    > 2. When you open `vim`, `neobundle` will take care of all other plugins that need installing.
    > 3. So, in some way, this `install.sh` is complete.

4. ✓ split plugins list
4. ✓ split plugins settings
4. documentation of snippets(especially rails)
5. use less plugins as possible

    > This could be difficult for me now. I will try my best.

6. fix issues met in use regularly

## 几点说明
+ 之所以用[neobundle][4]而不是[vundle][3]，纯粹是因为当时凑巧`vundle`用不了，各种无奈下只好用了`neobundle`。

    > 1. `neobundle`的使用过程基本平滑，没有出现问题。
    > 2. `neobundle`对插件的各种“花式”写法体现了插件调用的灵活性，大大提高vim的启动和运行速度。
    > 3. `neobundle`唯一不爽的是没有跟`vundle`一样的直观的插件列表。

+ 目前此配置还在向着`1.0`版本进行着，我所期待的`1.0`主要是有以下几点：

    >
    > 1. 插件基本齐全，多没关系，后面的版本可以慢慢删。但也不能多到插件映射打架。
    > 2. 至少对其中的一些配置写点文档，不然就算是我也难以记住这n多的快捷键。
    >
    > 目前第1点基本算是修修补补一路搞得差不多了，第2点目前还没有想好到底要怎么来实现，
    > 现在的打算是先把`snippets`的文档搞一搞，再把一些常用的操作映射写一写。

+ 这个配置的整个过程用到了`git-flow-avh`的工作流模型，基本的分支流程可以在`network`图中看到。

## 几点事项
1. 这个配置只打算在linux上（目前是在archlinux）进行使用。
2. 这个配置并不完善，许多地方会有问题。
3. 感谢 __Bram Moolenaar__ 和其他vim的维护者们创造了如此多彩的编辑器。
3. 感谢 __Steve Francia__ 在github上分享了这么有用的配置。
5. 感谢所有插件的作者与维护者们，你们共同创造了vim社区的现在。

## 许可证
> Copyright 2015 gisphm <phmfk@hotmail.com>
>
> Licensed under the Apache License, Version 2.0 (the "License");
> you may not use this file except in compliance with the License.
> You may obtain a copy of the License at
>
>> http://www.apache.org/licenses/LICENSE-2.0
>
> Unless required by applicable law or agreed to in writing, software
> distributed under the License is distributed on an "AS IS" BASIS,
> WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> See the License for the specific language governing permissions and
> limitations under the License.

[1]: https://github.com/spf13/spf13-vim.git
[2]: https://github.com/gisphm/myneovimrc.git
[3]: https://github.com/gmarik/Vundle.vim.git
[4]: https://github.com/Shougo/neobundle.vim.git
