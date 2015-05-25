## 几点说明
1. 键盘映射是相当多的，这里只是把一些常用的列举出来
2. 这里列举的基本上是插件里的映射或者是根据插件文档自定义的映射
3. 及时更新，尽可能把自己常用的映射写在这里

## 基本映射
1. 在这份配置中，`leader`键是分号`;`，`localleader`键是下划线`_`。
1. `jk` 在`insert`模式中按下，可退出到`normal`模式。
1. 在`normal`模式中，`j`被映射成`gj`，`k`被映射成`gk`，
这个做法是为了更好地在一段多行文字进行浏览。
1. 0、$、^、<HOME>和<END>各自的映射基本不变。
1. 一些有用的编辑映射

   > 1. `<Leader>ew :e %%`
   > 2. `<Leader>es :sp %%` 在横分离的窗体中打开文件%
   > 3. `<Leader>ev :vsp %%` 在竖分离的窗体中打开文件%
   > 4. `<Leader>et :tabe %%` 在新的tabpage中编辑文件%

1. `_$` 去除行末空白
1. `<Leader>f(number)` 折叠级别
1. `<Space>f :AutoFormat` 自动调用文件类型的格式化工具进行文本格式化

## Airline
1. `<Leader>ar :AirlineRefresh`
1. `<Leader>at :AirlineToggle`

## NeoBundle
1. `<Leader>nu :NeoBundleUpdate`
1. `<Leader>nl :NeoBundleUpdateLog`
1. `<Leader>nc :NeoBundleClean`
1. `<Leader>ni :NeoBundleInstall`

## NeoComplete和NeoSnippets
1. `<tab> CleverTab()` 这个tab键在这里扮演重要角色，类似`supertab`的功能。
即在NeoComplete和Snippets的选择中，tab替代了c-n，S-tab替代了c-p
1. `<Space>` 在处于补全状态时，若有补全项被选中时，
空格键直接把补全项补上并关闭补全弹出框，若无补全项被选中，则直接关闭补全弹出框。
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
1. `s <Plug>(easymotion-s2)` 搜索两个相邻字母
1. 行移动

    > 1. `<Leader>j <Plug>(easymotion-j)`
    > 2. `<Leader>k <Plug>(easymotion-k)`

## Syntastic
1. `<silent> <Space>st :SyntasticToggleMode`
1. `<Space>sc :SyntasticCheck`
1. `<Space>si :SyntasticInfo`
1. `<Space>se :Errors`
1. `<Space>sr :SyntasticReset`
1. `<Space>ss :SyntasticSetLoclist`

## Fugitive
1. `<Leader>gs :Gstatus`
1. `<Leader>gd :Gdiff`
1. `<Leader>gc :Gcommit`
1. `<Leader>gb :Gblame`
1. `<Leader>gl :Glog`
1. `<Leader>gp :Git push`
1. `<Leader>gr :Gread`
1. `<Leader>gw :Gwrite`
1. `<Leader>ge :Gedit`

## Signify
1. `<Space>gg :SignifyToggle`
1. `<Space>gr :SignifyRefresh`
1. `<Space>gh :SignifyToggleHighlight`
1. `<Space>gj <Plug>(signify-next-hunk)`
1. `<Space>gk <Plug>(signify-prev-hunk)`

## TagBar
1. `<Leader>tt :TagbarToggle`
1. `<Leader>to :TagbarOpen`
1. `<Leader>tc :TagbarOpenAutoClose`

## Vim-Surround
1. `cs{label1}{label2}` 把{label1}改成{label2}
2. `ds({label})` 删除包围的符号({label})
1. `cst{label}` 把一行的WORD用{label}全包围
1. `ys{text-object}{label}` 给{text-object}加上{label}
1. `label`的一些说明

    > 1. 'b' <=> ')'
    > 2. 'B' <=> '}'
    > 3. 'r' <=> ']'
    > 4. 'a' <=> '>'
    > 5. '{' <=> '{ '

## TComment
1. 注释

    > 1. `gc{motion}` 按动作{motion}注释
    > 2. `gc<Count>c{motion}` 按动作{motion}注释<Count>次
    > 3. `gcc` 行注释
    > 4. `g>{motion}` 区域注释
    > 5. `g>c` 行注释
    > 6. `g>b` 块注释

1. Visual模式注释

    > 1. `gc`
    > 2. `g>`

2. 反注释

    > 1. `g<{motion}`
    > 2. `g<c`
    > 3. `g<b`

1. 其他的一些快捷键

    > 1. `<Leader>__`       :: `:TComment`
    > 2. `<Leader>_p`       :: `Comment the current inner paragraph`
    > 3. `<Leader>_<space>` :: `:TComment <QUERY COMMENT-BEGIN ?COMMENT-END>`
    > 4. `<Leader>_i`       :: `:TCommentInline`
    > 5. `<Leader>_r`       :: `:TCommentRight`
    > 6. `<Leader>_b`       :: `:TCommentBlock`
    > 7. `<Leader>_a`       :: `:TCommentAs <QUERY COMMENT TYPE>`
    > 8. `<Leader>_n`       :: `:TCommentAs &filetype <QUERY COUNT>`
    > 9. `<Leader>_s`       :: `:TCommentAs &filetype_<QUERY COMMENT SUBTYPE>`

## Golden-Ratio
1. `<Space>rr <Plug>(golden_ratio_resize)`
2. `<Space>rt <Plug>(golden_ratio_toggle)`
