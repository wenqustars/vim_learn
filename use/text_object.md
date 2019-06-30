# 文本对象操作
**vim编辑命令的结构**  
```xml
<number> <operator> <text object or motion>

<数字> <操作符> <文本对象或移动命令>
```
## 数字
**number**: 数字用于在文本对象或移动操作上进行多次执行, 比如说`3dd`表示删除3行. 数字是可选的, 可以出现在命令(command) 的前面，也可以放在命令的后面.
## 操作符
**operator**: 操作符, 比如, change(修改), delete (删除), yank (复制). 操作符也是可选的. 但是如果没有操作符的话, 那么就只剩一个移动命令, 而非一个编辑命令了.

:h operator :
```
|c|     c       修改 (change) 
|d|     d       删除 (delete)
|y|     y       抽出 (yank) 到寄存器 (不改变文本)
|~|     ~       变换大小写 (只有当 'tildeop' 置位时有效)
|g~|    g~      变换大小写
|gu|    gu      变为小写
|gU|    gU      变为大写
|!|     !       通过外部程序过滤
|=|     =       通过 'equalprg' (若为空，C-indenting) 过滤
|gq|    gq      文本排版
|g?|    g?      ROT13 编码
|>|     >       右移
|<|     <       左移
|zf|    zf      定义折叠
|g@|    g@      调用 'operatorfunc' 选项定义的函数

如果动作包括一个次数而操作符之前也有一个的话，两者相乘。因此，"2d3w" 删除六个单词。
```
## 文本对象或移动命令
`text object`或者`motion`可以是一个文本对象, 比如, 一个单词, 一个句子, 一个段落, 或者是一个移动, 比如, 向下移动一行, 向后翻一页, 到一行末尾.
### 文本对象动作
```
(          反向 [count] 个句子。|exclusive| 开动作。
)          正向 [count] 个句子。|exclusive| 开动作。
{          反向 [count] 个段落。|exclusive| 开动作。
}          正向 [count] 个段落。|exclusive| 开动作。
]]         正向 [count] 个小节或到出现在首列的 '{'。如果带操作符，则同时停留在首列的 '}' 的下方。|exclusive| 开动作。注意 |exclusive-linewise| 常常适用。
][         正向 [count] 个小节或到出现在首列的 '}'。|exclusive|开动作。注意 |exclusive-linewise| 常常适用。
[[         反向 [count] 个小节或到出现在首列的 '{'。|exclusive|开动作。注意 |exclusive-linewise| 常常适用。
[]         反向 [count] 个小节或到出现在首列的 '}'。|exclusive|开动作。注意 |exclusive-linewise| 常常适用。
```
### 文本对象选择
:h text-objects :
```txt
在可视模式下，各操作将切换到可视的字符选择模式。
                                                        *v_iw* *iw*
aw       "一个单词"，包括开头或拖尾的空白，但不单独计算。可视模式下它切换为面向字符的模式.
                                                        *v_iw* *iw*
iw       "内含单词"，单词之间的空白也被算为一个单词。可视模式下它切换为面向字符的模式.
                                                        *v_aW* *aW*
aW       "一个字串"，包括开头或拖尾的空白，但不单独计算。可视模式下它切换为面向字符的模式.
                                                        *v_iW* *iW*
iW       "内含字串"，字串之间的空白也被算为一个字串。可视模式下它切换为面向字符的模式.
                                                        *v_as* *as*
as       "一个句子"，可视模式下它切换为面向字符的模式。
                                                        *v_is* *is*
is       "内含句子"，可视模式下它切换为面向字符的模式。
                                                        *v_ap* *ap*
ap       "一个段落"，空白行也被视为段落边界。可视模式下它切换为面向行的模式。
                                                        *v_ip* *ip*
ip       "内含段落"，空白行也被视为段落边界。可视模式下它切换为面向行的模式。
a]                                          *v_a]* *v_a[* *a]* *a[*
a[       "一个 [] 块"，选择 [count] 层 '[' ']' 块。为此，先反向查找第 [count] 个未匹配的 '['，然后查找其相应的 ']'。两者之间的文本，包括 '[' 和 ']'，都被选择。可视模式下它切换为面向字符的模式。
i]                                          *v_i]* *v_i[* *i]* *i[*
i[       "内含 [] 块"，选择 [count] 层 '[' ']' 块。为此，先反向查找第 [count] 个未匹配的 '['，然后查找其相应的 ']'。两者之间的文本，但不包括 '[' 和 ']'，被选择。 可视模式下它切换为面向字符的模式。
a)                                                 *v_a)* *a)* *a(*
a(                                         *vab* *v_ab* *v_a(* *ab*
ab       "一个块"，选择 [count] 层块，从 "[count] [(" 到其相应的 ')'，包括 '(' 和 ')' (见 |[(|)。它并不包括括号之外的空白。可视模式下它切换为面向字符的模式。
i)                                                 *v_i)* *i)* *i(*
i(                                         *vib* *v_ib* *v_i(* *ib*
ib       "内含块"，选择 [count] 层块，从 "[count] [(" 到其相应的 ')'，但不包括 '(' 和 ')' 。可视模式下它切换为面向字符的模式。
a>                                          *v_a>* *v_a<* *a>* *a<*
a<       "一个 <> 块"，选择 [count] 层 <> 块，从反向第 [count]个未匹配的 '<' 到其匹配的 '>'，包括 '<' 和 '>'。可视模式下它切换为面向字符的模式。
i>                                          *v_i>* *v_i<* *i>* *i<*
i<       "内含 <> 块"，选择 [count] 层 <> 块，从反向第 [count]个未匹配的 '<' 到其匹配的 '>'，但不包括 '<' 和 '>'。可视模式下它切换为面向字符的模式。
                                                        *v_at* *at*
at       "一个标签块"，选择 [count] 层标签块。从反向第 [count]个未匹配的 "<aaa>" 到其匹配的 "</aaa>"，包括 "<aaa>"和 "</aaa>"。可视模式下它切换为面向字符的模式。
                                                        *v_it* *it*
it       "内部标签块"，选择 [count] 层标签块。从反向第 [count]个未匹配的 "<aaa>" 到其匹配的 "</aaa>"，但不包括"<aaa>" 和 "</aaa>"。可视模式下它切换为面向字符的模式。
a}                                                 *v_a}* *a}* *a{*
a{                                               *v_aB* *v_a{* *aB*
aB       "一个大块"，选择 [count] 层大块，从 "[count] [{" 到其相应的 '}'，包括 '{' 和 '}'可视模式下它切换为面向字符的模式。
i}                                                 *v_i}* *i}* *i{*
i{                                               *v_iB* *v_i{* *iB*
iB       "内含大块"，选择 [count] 层大块，从 "[count] [{" 到其相应的 '}'，但不包括 '{' 和 '}'可视模式下它切换为面向字符的模式。
a"                                              *v_aquote* *aquote*
a'                                                      *v_a'* *a'*
a`                                                      *v_a`* *a`*
         "一个引号字符串"。选择上一个引号开始到下一个引号结束的文本。'quoteescape' 选项用于跳过转义的引号。只在同一行内有效。如果开始时光标在引号上，Vim 会从该行行首开始搜索，以决定哪个引号对构成字符串。包含任何拖尾的空白，如果没有拖尾的，也包含开头的空白。可视模式下它切换为面向字符的模式。在可视模式下重复此对象会包含另一个字符串。目前不使用计数。
i"                                              *v_iquote* *iquote*
i'                                                      *v_i'* *i'*
i`                                                      *v_i`* *i`*
         类似于 a"、a' 和 a`，但不包括引号，而重复也不会扩展可视选择区。特例: 计数为 2 时包含引号，但不包括 a"/a'/a` 包含的额外的空白。                      
```
### 移动光标的命令
:h motion :
```txt
w        移动至下一个单词的首部
b        移动至当前单词的首部
4j       下移四行
/the<cR>        移动至下一个 "The"
```