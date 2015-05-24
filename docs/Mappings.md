## 几点说明
1. 键盘映射是相当多的，这里只是把一些常用的列举出来
2. 这里列举的基本上是插件里的映射或者是根据插件文档自定义的映射
3. 及时更新，尽可能把自己常用的映射写在这里
## 基本映射
1. 在这份配置中，`leader`键是分号`;`，`localleader`键是下划线`_`。
1. `jk` 在插件模式中按下，可退出到正常模式。
1. 在正常模式中，`j`被映射成`gj`，`k`被映射成`gk`，
这个做法是为了更好地在一段多行文字进行浏览。
1. 0、$、^、<HOME>和<END>各自的映射基本不变。
1. 一些有用的编辑映射
   > <Leader>ew :e %%
   > <Leader>es :sp %%
   > <Leader>ev :vsp %%
   > <Leader>et :tabe %%
1. `_$` 去除行末空白
1. `<Leader>f(number)` 折叠级别
1. `<Space>f :AutoFormat` 自动调用文件类型的格式化工具进行文本格式化
## Airline
1. `<Leader>ar :AirlineRefresh` 手动刷新airline
1. `<Leader>at :AirlineToggle` airline切换
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
1. `<Space>jh :JSHint`
1. `<Space>jn :lnext`
1. `<Space>jp :lprevious`
## UndoTree
1. `<Leader>ut :UndotreeToggle`
1. `<Leader>uf :UndotreeFocus`
1. `<Leader>uh :UndotreeHide`
1. `<Leader>us :UndotreeShow`
## Tabularize
1. `<Leader>a& :Tabularize /&`
1. `<Leader>a= :Tabularize /^[^=]*\zs=`
1. `<Leader>a=> :Tabularize /=>`
1. `<Leader>a: :Tabularize /:`
1. `<Leader>a:: :Tabularize /:\zs`
1. `<Leader>a, :Tabularize /,`
1. `<Leader>a,, :Tabularize /,\zs`
1. `<Leader>a<Bar> :Tabularize /<Bar>`
## EasyMotion
1. `nmap s <Plug>(easymotion-s2)` 搜索两个相邻字母
1. 行移动
    > map <Leader>j <Plug>(easymotion-j)
    > map <Leader>k <Plug>(easymotion-k)
## Syntastic
1. `nnoremap <silent> <Space>st :SyntasticToggleMode`
1. `nnoremap <Space>sc :SyntasticCheck`
1. `nnoremap <Space>si :SyntasticInfo`
1. `nnoremap <Space>se :Errors`
1. `nnoremap <Space>sr :SyntasticReset`
1. `nnoremap <Space>ss :SyntasticSetLoclist`
## Fugitive
1. <Leader>gs :Gstatus
1. <Leader>gd :Gdiff
1. <Leader>gc :Gcommit
1. <Leader>gb :Gblame
1. <Leader>gl :Glog
1. <Leader>gp :Git push
1. <Leader>gr :Gread
1. <Leader>gw :Gwrite
1. <Leader>ge :Gedit
## Signify
1. `<Space>gg :SignifyToggle`
1. `<Space>gr :SignifyRefresh`
1. `<Space>gh :SignifyToggleHighlight`
1. `nmap <Space>gj <Plug>(signify-next-hunk)`
1. `nmap <Space>gk <Plug>(signify-prev-hunk)`
## TagBar
1. `<Leader>tt :TagbarToggle`
1. `<Leader>to :TagbarOpen`
1. `<Leader>tc :TagbarOpenAutoClose`
