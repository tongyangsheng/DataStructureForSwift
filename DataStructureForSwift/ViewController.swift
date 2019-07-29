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
        //---------------------------------栈-------------------------
        print("------------------------------------栈---------------------------------")
        var stack = Stack<Any>()
        print("栈内元素个数：\(stack.count)")
        stack.capacity = 5
        stack.push(element: 1)
        print("入栈元素 1 后，栈顶元素：\(stack.peek()!)")
        stack.push(element: 2)
        stack.push(element: 3)
        stack.push(element: 4)
        print("继续入栈元素 2 3 4")
        print("此时栈顶元素为：\(stack.peek()!)")
        print("出栈一个元素，弹出元素为：\(stack.pop()!)")
        print("栈顶元素变为：\(stack.peek()!)")
        print("------------------------------------链表---------------------------------")
        let linkedNode = LinkedListNode(1)
        print("节点值为：\(linkedNode.value)")
        
        let linkedList = LinkedList<Any>()
        linkedList.appendToEnd(1)
        linkedList.appendToEnd(2)
        linkedList.appendToEnd(3)
        
        print("新增三个节点，返回链表长度：\(linkedList.count)")
        print("首节点为：\(linkedList.firstNode!.value)")
        print("尾节点为：\(linkedList.lastNode!.value)")
        print("------------------------------------队列---------------------------------")
        var queue = Queue<Any>()
        print("初始队列长度：\(queue.count)")
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        print("入队1，2，3 队列长度：\(queue.count)")
        print("出队一次，出队元素为：\(queue.dequeue()!)")
        print("此时队首为：\(queue.front!)")
        print("------------------------------------排序---------------------------------")
        print("-------------------冒泡排序-------------------")
        var num = [1,5,3,6,9]
        print("排序前：\(num)")
        BubbleSort(&num)
        print("排序后：\(num)")
        var num1 = [1,5,3,6,9]
        BubbleSort2(&num1)
        print("优化算法排序后：\(num1)")
        print("-------------------插入排序-------------------")
        var num2 = [1,5,3,6,9]
        print("排序前：\(num2)")
        InsertionSort(&num2)
        print("排序后：\(num2)")
        var num3 = [1,5,3,6,9]
        InsertionSort1(&num3)
        print("优化算法排序后：\(num3)")
        print("-------------------选择排序-------------------")
        var num4 = [1,5,3,6,9]
        print("排序前：\(num4)")
        SelectionSort(&num4)
        print("排序后：\(num4)")
        print("-------------------归并排序-------------------")
        let num5: Array<Int> = [78,66,53,12,55,26,34]
        let num5Sort = MergeSort(num5)
        print("排序后\(num5Sort)")
    }
}






