# DataStructureForSwift

## 数据结构swift实现代码

### 第一部分：数组的实现

&emsp;&emsp;涉及数组的概念和一些基本操作的方法<br/><br/>
&emsp;&emsp;数组的定义：`数组是一种线性表数据结构，它用一组连续的内存空间，来存储一组具有相同类型的数据`<br/><br/>
&emsp;&emsp;除了数组，链表、队列、栈等也是线性表结构<br/><br/>
![Image text](https://github.com/tongyangsheng/DataStructureForSwift/blob/master/show-img/show1.jpg)<br/><br/>
&emsp;&emsp;数组具有连续的内存空间和相同类型的数据，因为这两个限制，拥有了`随机访问`的特性<br/><br/>
&emsp;&emsp;数组支持随机访问，根据下标随机访问的时间复杂度为O(1)<br/><br/>
&emsp;&emsp;数组从0开始编号的原因，在数组的寻址公式中如果从0开始<br/><br/>&emsp;&emsp;`a[k]_address = base_address + k * type_size`<br/><br/>&emsp;&emsp;如果从1开始<br/><br/>&emsp;&emsp;`a[k]_address = base_address + (k-1)*type_size`<br/><br/>&emsp;&emsp;多了一次减法运算

### 第二部分：链表

包括链表的特点和代码实现单链表，双链表
