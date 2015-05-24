## 几点说明
1. 键盘映射是相当多的，这里只是把一些常用的列举出来
2. 这里列举的基本上是插件里的映射或者是根据插件文档自定义的映射
3. 及时更新，尽可能把自己常用的映射写在这里
## 基本映射
在这份配置中，`leader`键是分号`;`，`localleader`键是下划线`_`。
## Airline
`<Leader>ar :AirlineRefresh` 手动刷新airline
## NeoBundle
1. `<Leader>nu :NeoBundleUpdate` 更新插件
1. `<Leader>nl :NeoBundleUpdateLog` 插件更新日志
1. `<Leader>nc :NeoBundleClean` 清理插件
1. `<Leader>ni :NeoBundleInstall` 安装插件
## NeoComplete和NeoSnippets
1. `<tab> CleverTab()` 这个tab键在这里扮演重要角色，类似`supertab`的功能
    > 在NeoComplete和Snippets的选择中，tab替代了c-n，S-tab替代了c-p
1. `<Space>` 在有补全项被选中时，空格键直接把补全项补上并关闭preview，
否则就是一个普通的空格键
1. `<C-k>` 展开Snippets
## Unite
1. `<Leader>b` buffer列表
1. `<Space>/` 正则搜索
1. `<Space>ut` tabpage列表
1. `<Space>uo` 大纲列表（类似于tagbar）
1. `<Leader>y` yank历史（vim的内部复制历史列表）
## JSHint2
1. `<Space>jh :JSHint` 调用jshint
1. `<Space>jn :lnext` 下一个有问题的
1. `<Space>jp :lprevious` 上一个有问题的
