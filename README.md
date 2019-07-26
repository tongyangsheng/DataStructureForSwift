# 目录
* [DataStructureForSwift](#datastructureforswift)<br/>
      * [数据结构swift实现代码](#数据结构swift实现代码)<br/>
         * [第一部分：数组的实现](#第一部分数组的实现)<br/>
         * [第二部分：链表](#第二部分链表)<br/>
            * [数组和链表的区别](#数组和链表的区别)<br/>
            * [时间空间互换](#时间空间互换)<br/>
         * [第三部分：栈](#第三部分栈)<br/>
            * [入栈的时间复杂度](#入栈的时间复杂度)<br/>
            * [栈实现表达式求值](#栈实现表达式求值)<br/>
         * [第四部分：队列](#第四部分队列)<br/>
            * [更有效的队列算法](#更有效的队列算法)<br/>

# DataStructureForSwift

## 数据结构swift实现代码

### 第一部分：数组的实现

涉及数组的概念和一些基本操作的方法<br/><br/>

数组的定义：`数组是一种线性表数据结构，它用一组连续的内存空间，来存储一组具有相同类型的数据`<br/><br/>

除了数组，链表、队列、栈等也是线性表结构<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show1.jpg)<br/><br/>

数组具有连续的内存空间和相同类型的数据，因为这两个限制，拥有了`随机访问`的特性<br/><br/>

数组支持随机访问，根据下标随机访问的时间复杂度为O(1)<br/><br/>

数组从0开始编号的原因，在数组的寻址公式中如果从0开始<br/><br/>

`a[k]_address = base_address + k * type_size`<br/><br/>

如果从1开始<br/><br/>

`a[k]_address = base_address + (k-1)*type_size`

<br/><br/>多了一次减法运算

### 第二部分：链表

包括链表的特点和代码实现单链表，双链表<br/><br/>

常见的缓存策略：先进先出策略FIFO(First In,First Out)，最少使用策略LFU（Least Frequently Used),最近最少使用策略LRU（Least Recently Used)<br/><br/>

链表中包括：单链表、循环链表、双向链表还有双向循环链表<br/><br/>

单链表：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show3.jpg)<br/><br/>

循环链表：<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show6.jpg)<br/><br/>

双向链表：<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show4.png)<br/><br/>

双向循环链表：<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show7.jpg)<br/><br/>

#### 数组和链表的区别
数组需要一块连续的内存空间来储存，对内存的要求比较高<br/>
链表不需要连续的内存空间可以通过指针将一组零散的内存块串联起来<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show2.jpg)<br/><br/>

数组的插入删除操作，为了保持内存数据的连续性，需要大量数据搬移，时间复杂度是O(n)，链表的插入和删除是O(1)<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show5.jpg)<br/><br/>
#### 时间空间互换
对于执行较慢的程序，通过消耗更多内存空间来进行优化（空间换时间）<br/><br/>

对于消耗过多内存的程序，通过消耗更多时间降低内存消耗（时间换空间）<br/><br/>

### 第三部分：栈
一个数据集合只涉及在一端插入和删除数据，并且满足后进先出、先进后出的特性，应该首选`栈`这种数据结构<br/><br/>

栈用数组实现是`顺序栈`<br/>
栈用链表实现是`链式栈`<br/>
利用swift数组的特性 代码中实现了`顺序栈`<br/><br/>

利用数组实现的顺序栈给予数组特性，支持动态扩容<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show8.png)<br/><br/>

#### 入栈的时间复杂度
对于出栈  不涉及内存的重新申请内存和数据的搬移 时间复杂度永远是O(1)<br/><br/>

入栈时如果栈的空间不够需要重新申请内存和数据搬移，时间复杂度为O(n)（最坏情况时间复杂度）。最好情况时间复杂度为O(1)<br/><br/>

计算入栈的均摊时间复杂度：假设：<br/>
1.栈空间不够时申请一个原来两倍大小的数组 <br/>
2.只有入栈没有出栈<br/>
3.入栈操作为简单的simple-push时间复杂度为O(1)<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show9.jpg)<br/><br/>

利用均摊思想可知，时间复杂度为O(1)<br/><br/>

#### 栈实现表达式求值
以 3+5*8-6 为例：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show10.jpg)<br/><br/>

### 第四部分：队列
队列满足先进先出的特性<br/><br/>

队列和栈一样也是一种操作受限的线性表数据结构<br/><br/>

入队操作时间复杂度大多数为O(1)<br/><br/>

出队时会有数据的复制.在取出数值的过程中，我们移除的是队列最前端的数值，而不是最末端。这个过程基本上一直是O(n)运算因为它需要将剩余的数据在内存上进行保留和移动。<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show11.jpg)<br/><br/>

#### 更有效的队列算法
当我们需要从队列中取出元素的时候，我们不做数组元素的移动（慢），而是记住这个元素的位置，并且把它重写为xxx（快）。<br/><br/>

因为在队列算法中，最前端的预留内存永远不会被用到，为了防止内存浪费，我们可以偶尔对数组重新进行大小调整，即删除前端预留内存<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show12.jpg)<br/><br/>







