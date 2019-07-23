//
//  Stack.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/23.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation
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
