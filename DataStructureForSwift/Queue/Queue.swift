//
//  Queue.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/23.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

struct Queue<T> {
    private var array = [T?]()
    private var head = 0
    //判断队列是否为空
    public var isEmpty : Bool
    {
        return count == 0
    }
    //队列元素个数
    public var count: Int
    {
        return array.count - head
    }
    //入队操作
    public mutating func enqueue(_ element: T)
    {
        array.append(element)
    }
    //出队操作
    public mutating func dequeue() -> T?
    {
        guard head < array.count, let element = array[head] else{ return nil }
        
        array[head] = nil
        
        head += 1
        
        let precentage = Double(head)/Double(array.count)
        //周期性调整数组
        //数组大小超过50且空点所占比例超过25%对数组进行调整 移除空点
        if array.count > 50 && precentage > 0.25
        {
            array.removeFirst(head)
            head = 0
        }
        return element
    }
    public var front: T?
    {
        if isEmpty
        {
            return nil
        }
        else
        {
            return array[head]
        }
    }
}
