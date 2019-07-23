//
//  LinkedList.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/23.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

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
