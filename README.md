# DataStructureForSwift

## 第一部分：数组的实现

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

## 第二部分：链表

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

### 数组和链表的区别
数组需要一块连续的内存空间来储存，对内存的要求比较高<br/>
链表不需要连续的内存空间可以通过指针将一组零散的内存块串联起来<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show2.jpg)<br/><br/>

数组的插入删除操作，为了保持内存数据的连续性，需要大量数据搬移，时间复杂度是O(n)，链表的插入和删除是O(1)<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show5.jpg)<br/><br/>
### 时间空间互换
对于执行较慢的程序，通过消耗更多内存空间来进行优化（空间换时间）<br/><br/>

对于消耗过多内存的程序，通过消耗更多时间降低内存消耗（时间换空间）<br/><br/>

## 第三部分：栈
一个数据集合只涉及在一端插入和删除数据，并且满足后进先出、先进后出的特性，应该首选`栈`这种数据结构<br/><br/>

栈用数组实现是`顺序栈`<br/>
栈用链表实现是`链式栈`<br/>
利用swift数组的特性 代码中实现了`顺序栈`<br/><br/>

利用数组实现的顺序栈给予数组特性，支持动态扩容<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show8.png)<br/><br/>

### 入栈的时间复杂度
对于出栈  不涉及内存的重新申请内存和数据的搬移 时间复杂度永远是O(1)<br/><br/>

入栈时如果栈的空间不够需要重新申请内存和数据搬移，时间复杂度为O(n)（最坏情况时间复杂度）。最好情况时间复杂度为O(1)<br/><br/>

计算入栈的均摊时间复杂度：假设：<br/>
1.栈空间不够时申请一个原来两倍大小的数组 <br/>
2.只有入栈没有出栈<br/>
3.入栈操作为简单的simple-push时间复杂度为O(1)<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show9.jpg)<br/><br/>

利用均摊思想可知，时间复杂度为O(1)<br/><br/>

### 栈实现表达式求值
以 3+5*8-6 为例：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show10.jpg)<br/><br/>

## 第四部分：队列
队列满足先进先出的特性<br/><br/>

队列和栈一样也是一种操作受限的线性表数据结构<br/><br/>

入队操作时间复杂度大多数为O(1)<br/><br/>

出队时会有数据的复制.在取出数值的过程中，我们移除的是队列最前端的数值，而不是最末端。这个过程基本上一直是O(n)运算因为它需要将剩余的数据在内存上进行保留和移动。<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show11.jpg)<br/><br/>

### 更有效的队列算法
当我们需要从队列中取出元素的时候，我们不做数组元素的移动（慢），而是记住这个元素的位置，并且把它重写为xxx（快）。<br/><br/>

因为在队列算法中，最前端的预留内存永远不会被用到，为了防止内存浪费，我们可以偶尔对数组重新进行大小调整，即删除前端预留内存<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show12.jpg)<br/><br/>

## 第五部分：排序
原地排序算法：特指空间复杂度是O(1)的算法<br/>
稳定性：经过排序后相等元素之间的顺序没有改变则是`稳定的排序算法`，相反则是`不稳定的排序算法`

### 冒泡排序
冒泡排序是将相邻两个元素之间进行比较，一次冒泡会让一个元素移动到对应位置，要执行n次<br/><br/>
一次冒泡的过程：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show13.jpg)<br/><br/>

n次冒泡的过程：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show14.jpg)<br/><br/>

冒泡排序只涉及相邻元素的交换操作，只需要常量级的临时空间，空间复杂度为O（1），是原地排序算法<br/>
冒泡排序中可以设置相邻元素大小相等时不做交换，所以是稳定的算法<br/>
冒泡排序的最好情况时间复杂度：`O(n)`--1次冒泡,最坏情况时间复杂度：`O(n^2)`--n次冒泡,平均时间复杂度：`O(n^2)`<br/><br/>

#### 冒泡排序优化方案一
当发现在某一趟排序中发现没有发生交换，则说明排序已经完成，所以可以在此趟排序后结束排序。在每趟排序前设置一个检测值，当其未发生改变时，终止算法；<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show15.jpg)<br/><br/>

详见代码<br/>

#### 冒泡排序优化方案二
每趟排序中，最后一次发生交换的位置后面的数据均已有序，可以记住最后一次交换的位置来减少排序的趟数。<br/><br/>
详见代码<br/><br/>

### 插入排序
插入排序的理念是将为排序部分中的元素插入到已排序部分<br/>
插入排序包含了两个部分：`元素的比较`和`元素的移动`<br/><br/>

插入排序概念图：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show16.jpg)<br/><br/>

插入排序不需要额外的运行空间，是原地排序算法<br/>
插入排序在插入时可以选择将后面插入的等大小元素插入到之前出现的元素后面，因此是稳定的排序算法<br/>
插入排序的最好情况时间复杂度：`O(n)`--数据顺序,最坏情况时间复杂度：`O(n^2)`--数据倒序,平均时间复杂度：`O(n^2)`--每次插入一个数据,循环执行n次<br/><br/>

#### 插入排序的优化
删除swap方法，我们可以不交换，将数字向右移动，然后把新数字放到合适的位置就可以了。<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show18.jpg)<br/><br/>

### 选择排序
选择排序类似插入排序，从未排序的部分中选出最小值，放到已排序部分的末尾<br/><br/>

选择排序概念图：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show17.jpg)<br/><br/>

选择排序也是原地排序算法<br/>
选择排序在交换的过程中，相同大小的元素位置可能发生改变，是不稳定的排序<br/>
选择排序的时间复杂度永远是O(n^2)<br/><br/>

### 归并排序
归并排序的处理，就是先将初始数组进行分割，然后进行合并<br/><br/>

归并排序举例：<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show19.jpg)<br/><br/>

归并排序在合并两个有序数组时，是将两个数组从初始元素开始比较，存入一个临时数组<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show20.jpg)<br/><br/>

归并排序中可以控制先放入前一个子数组的元素，是稳定的排序<br/>
归并排序的时间复杂度永远是`O(nlogn)`<br/>
归并排序的空间复杂度为`O(n)`，不是原地排序算法<br/><br/>

### 快速排序
快速排序的核心就是选择一个分支点，将小于分支点的数放到分支点左边，将大于分支点的数放到分支点右边，不断的分治，递归，将处理区间缩小为1<br/><br/>

![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show21.jpg)<br/><br/>

大致处理过程：<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show22.jpg)<br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show23.jpg)<br/><br/>

快速排序是原地、不稳定的算法<br/>
快速排序在大部分情况下时间复杂度为`O(nlogn)`在极端情况下会退化到`O(n^2)`<br/><br/>

## 第六部分：二分查找
二分查找的时间复杂度：O(logn)<br/><br/>

二分查找的局限性：<br/>
(1) 二分查依赖顺序表结构（数组）<br/>
(2) 二分查找针对的是有序数据<br/>
(3) 数据太小，没有必要用二分查找<br/>
(4) 数据太大需要很大的数组，占据内存空间<br/>




