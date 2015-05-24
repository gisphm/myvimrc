## 平台要求
这个配置只在`GNU/linux`平台上使用的，如果想在windows上弄本配置，请慎重考虑。
## vim
### 总体要求
需要`lua`和`ruby`支持，当然如果有`python`支持就更好了。
### 从源码编译
下载[vim的源码][1]，然后进行编译，编译的参数大体如下，请合适取用：
```shell
./configure \
    --enable-rubyinterp=yes \
    --enable-pythoninterp=yes \
    --enable-perlinterp=yes \
    --enable-tclinterp \
    --enable-luainterp=yes \
    --enable-multibyte \
    --enable-sniff \
    --disable-netbeans \
    --with-features=huge \
    --prefix=$prefix
```
然后
```shell
VIMRUNTIMEDIR=$prefix/share/vim/vim74 make && make install
```
### 包软件管理系统
我只在`archlinux`和`ubuntu vivid`上测试过，因此也只给出这两个系统的一些东西。
> archlinux
>> sudo pacman -S vim
>
> ubuntu
>> 1. sudo apt-get install vim
>> 2. sudo apt-get build-dep vim（从源码编译需要的一些软件包，_推荐_）

## 第三方软件
### `the_silver_searcher`
推荐从源码安装，直接克隆[github上的仓库][2]，然后运行`./build.sh`。
如果提示有缺失的包，安装上就好了。
### `ack-grep`
这个一般的软件包管理系统里都有的，只是版本可能不是最新的，但不影响使用
### `ctags`
软件包管理系统有这个软件的，直接安装就好了。
但我推荐使用[github上的这个版本][3]，原因是这个修改版的ctags更新比较多，
对一些语言有更好的支持。从源码编译这个软件也是相当简单的事情，
直接运行`autoreconf -v -f -i`，然后`configure`一下，就可以make并安装了。
### `the_platinum_searcher`
[这个工具][4]也是用于代码搜索，与`ack`和`ag`相似。自认为比`ag`更快
（但我测试的结果是`ag`更胜一筹）。从源码安装的话，这个软件需要`go`软件包。
```shell
go get -u github.com/monochromegane/the_platinum_searcher/...
```
### `js-beautify`
这个需要`node.js`或者`io.js`的支持，安装好两个中的一个后，直接
```shell
npm install -g js-beautify
```
### `ruby-beautify`
直接`gem install ruby-beautify`即可。

[1]: https://github.com/vim/vim
[2]: https://github.com/ggreer/the_silver_searcher
[3]: https://github.com/fishman/ctags
[4]: https://github.com/monochromegane/the_platinum_searcher
