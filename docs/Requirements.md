## 平台要求
1. 这个配置只在`GNU/linux`平台上使用
1. 如果想在 Windows 上弄本配置，请慎重考虑。

## Vim
### 总体要求
需要`lua`和`ruby`及`python`支持。

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
    --prefix=$prefix \
    ...

# After configure, juse make it!
VIMRUNTIMEDIR=$prefix/share/vim/vim74 make && make install
```

### 包软件管理系统
我只在`ArchLinux`上测试过

>> sudo pacman -S vim

## 第三方软件
### `the_silver_searcher`
推荐从源码安装，直接克隆[GitHub 上的仓库][2]，然后运行`./build.sh`。

### `ctags`
软件包管理系统有这个软件的，直接安装就好了。

但我推荐使用[GitHub 上的这个版本][3]，原因是这个版本的 ctags 更新比较多，
对一些语言有更好的支持。从源码编译这个软件也是相当简单的事情，

```shell
# after clone, change directory to the repo path and run
autoreconf -v -f -i

# then
./configure

# last
make && make install
```

### `js-beautify` 和 `jshint`
这个需要`node.js`或者`io.js`的支持，安装好两个中的一个后，直接
```shell
npm install -g js-beautify jshint
```

### `ruby-beautify`
直接`gem install ruby-beautify`即可。


[1]: https://github.com/vim/vim
[2]: https://github.com/ggreer/the_silver_searcher
[3]: https://github.com/universal-ctags/ctags
