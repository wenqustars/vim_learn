# 单词操作
## 单词动作
```
单词动作                                             *word-motions*

<S-Right>    或         *<S-Right>* *w*
w            正向 [count] 个单词。|exclusive| 开动作。

<C-Right>    或         *<C-Right>* *W*
W            正向 [count] 个字串。|exclusive| 开动作。
                        *e*
e            正向到第 [count] 个单词的尾部。|inclusive| 闭动作。不停留在空行上。
                        *E*
E            正向到第 [count] 个字串的尾部。|inclusive| 闭动作。不停留在空行上。
<S-Left>     或         *<S-Left>* *b*
b            反向 [count] 个单词。|exclusive| 开动作。
<C-Left>     或         *<C-Left>* *B*
B            反向 [count] 个字串。|exclusive| 开动作。
                        *ge*
ge           反向到第 [count] 个单词的尾部。|inclusive| 闭动作。
gE           反向到第 [count] 个字串的尾部。|inclusive| 闭动作。
```
