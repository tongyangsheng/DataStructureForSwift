//
//  InsertionSort.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/29.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

func InsertionSort (_ num : inout [Int])
{
    let n = num.count
    for i in 1 ..< n
    {
        var index = i
        while index > 0 && num[index] < num[index-1]
        {
            num.swapAt(index - 1, index)
            index -= 1
        }
    }
}
//插入排序优化1: 不通过swap交换的方式实现，通过复制的方式实现
func InsertionSort1 (_ num : inout [Int])
{
    let n = num.count
    for i in 1 ..< n
    {
        var index = i
        //记录当前比较点（即要插入的值）的值用于之后复制
        let temp = num[index]
        while index > 0 && temp < num[index - 1]
        {
            //满足条件时将前一个元素的值复制到当前位置
            num[index] = num[index - 1]
            index -= 1
        }
        //把要插入的值复制到对应位置
        num[index] = temp
    }
}
