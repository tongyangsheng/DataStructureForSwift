//
//  ViewController.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/19.
//  Copyright © 2019 game98. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("----------------------------数组---------------------------")
        //数组是一种线性表数据结构，它用一组连续的内存空间，来存储一组具有相同类型的数据
        //初始化数组:var someArray = [SomeType]() 或 var someArray = [SomeType](repeating: InitialValue, count: NumbeOfElements)
        //创建了一类型为 Int ，数量为 3，初始值为 10 的空数组
        var someInts = [Int](repeating: 10, count: 3)
        print("数组:\(someInts)")
        //创建含有三个元素的数组：
        //let someInts2:[Int] = [10,20,30]
        //可以根据数组的索引来访问数组的元素:var someVar = someArray[index]
        let someVar = someInts[0]
        //数组的随机访问：通过寻址公式：a[i]_address = base_address + i * data_type_size
        print("第一个元素的值\(someVar)")
        print("第二个元素的值\(someInts[1])")
        //使用 append() 方法或者赋值运算符 += 在数组末尾添加元素
        //数组的插入：最好时间复杂度：O(1)  最坏时间复杂度：O(n)
        someInts.append(20)
        someInts += [30]
        print("新增后数组:\(someInts)")
        //可以通过索引修改数组元素的值
        someInts[4] = 50
        print("修改后数组:\(someInts)")
        //遍历数组
        //方法一：使用for-in循环来遍历所有数组中的数据项
        print("遍历1:")
        for item in someInts
        {
            print(item)
        }
        //方法二：需要每个数据项的值和索引值，可以使用 String 的 enumerate() 方法来进行数组遍历
        print("遍历2:")
        for (index, item) in someInts.enumerated()
        {
            print("索引：\(index)，值：\(item)")
        }
        //数组的合并
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB
        print("合并后数组：\(intsC)")
        print("----------------------------链表---------------------------")
        print("----------------------------栈-----------------------------")
    }
}
//---------------------------------单链表--------------------------------
//链表节点
class ListNode
{
    var val : Int!
    var next : ListNode!
    init(_ val : Int)
    {
        self.val = val;
        self.next = nil;
    }
}
//链表及其操作
class List
{
    var head : ListNode?
    var tail : ListNode?
    //在尾部插入
    func appendToEnd(_ val : Int)
    {
        if tail == nil
        {
            tail = ListNode(val)
            head = tail
        }
        else
        {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    //在头部插入
    func appendToHead(_ val : Int)
    {
        if head == nil
        {
            head = ListNode(val)
            tail = head
        }
        else
        {
            ListNode(val).next = head!
            head = ListNode(val)
        }
    }
}
//---------------------------------双向链表--------------------------------
class LinkedListNode<T>
{
    var value: T
    //前驱
    //因为前后两个节点可能通过前驱和后继相互关联，所以讲前驱设置为weak引用，这样来防止节点间发生循环引用。
    weak var previous: LinkedListNode?
    //后继
    var next: LinkedListNode?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T>
{
    //定义别名
    typealias Node = LinkedListNode<T>
    private var head: Node?
    private var tail: Node?
    
    var isEmpty: Bool
    {
        return head == nil
    }
    //返回链表的第一个节点
    var firstNode: Node?
    {
        return head
    }
    var lastNode: Node?
    {
        return tail
    }
    //链表节点个数
    var count: Int
    {
        //guard else 除非。。。则(成立则继续执行，不成立return)。。。 必须 return
        guard var node = head else { return 0 }

        var count = 1
        while let next = node.next
        {
            node = next
            count += 1
        }
        return count
    }
    //在末尾新增节点
    func appendToEnd(_ value: T)
    {
        let newNode = Node.init(value)
        //判断链表是否为空
        if let lastNode = lastNode
        {
            lastNode.next = newNode
            newNode.previous = lastNode
        }
        else
        {
            head = newNode
        }
        tail = newNode
    }
    //获取某一位置的节点
    func node(atIndex index: Int) -> Node?
    {
        guard var node = head else { return nil }
        if index == 0 { return node }
        //前闭后开区间
        for i in 1..<count
        {
            guard let next = node.next else { return nil }
            node = next
            if index == i
            {
                return node
            }
        }
        return nil
    }
    //在某一位置插入
    func insert(_ newNode: Node, atIndex index: Int)
    {
        //链表为空
        guard let _ = head else { return head = newNode }
        //链表不为空
        if index == 0
        {
            head?.previous = newNode
            newNode.next = head
            head = newNode
        }
        else if index > count
        {
            appendToEnd(newNode.value)
        }
        else
        {
            let previousNode = self.node(atIndex: index - 1)
            let nextNode = previousNode?.next
            
            newNode.previous = previousNode
            newNode.next = newNode
            previousNode?.next = newNode
            nextNode?.previous = newNode
        }
    }
    //删除链表
    func removeAll()
    {
        head = nil
    }
    //删除某个节点
    //节点已知
    func remove(_ node: Node)
    {
        let nextNode = node.next
        if let previousNode = node.previous
        {
         previousNode.next = nextNode
        nextNode?.previous = previousNode
        }
        //删除的是头节点
        else
        {
            head = nextNode
        }
        node.next = nil
        node.previous = nil
    }
}
//------------------------------------栈-------------------------------------
//栈的实现：栈的实现依赖于swift中的数组 数组的append()和popLast()极大的方便了栈的实现
struct Stack<T>
{
    //声明一个泛型数组，因为不确定栈中元素的类型，用泛型替代
    var elements = [T]()
    //获得栈中元素个数
    var count : Int
    {
        return elements.count
    }
    //获取栈的t容量
    var capacity : Int
    {
        get
        {
            //栈的t容量即为数组的容量
            return elements.capacity
        }
        set
        {
            //数组最小容量即为栈最小容量
            elements.reserveCapacity(newValue)
        }
    }
    //初始化栈
    init()
    {
    
    }
    //入栈操作
    //结构体是值类型，值类型的方法是不能对自身(self)进行修改的，如果非要对自身(self)进行修改，就必须用关键字mutating进行标记。
    mutating func push(element: T)
    {
        //判断栈是否已满
        if count == capacity
        {
            fatalError("栈已满，无法入栈")
        }
        //利用数组的添加操作 实现入栈
        self.elements.append(element)
    }
    //出栈操作
//@discardableResult是Swift中的一个特性，用于抑制函数或者方法返回值被调用而没有使用其结果时的警告，如果你对警告不是特别敏感，可以考虑不用这个特性。
    //返回值可能为空 设置为可选类型
    mutating func pop() -> T?
    {
        if count == 0
        {
            fatalError("栈已空，无法弹出")
        }
        //利用数组的popLast() 弹出最后一个元素
        return elements.popLast()
    }
    //返回栈顶元素
    func peek() -> T?
    {
        return elements.last
    }
    //清空所有元素
    mutating func clear()
    {
        //清空数组元素
        return elements.removeAll()
    }
}






