//
//  QuickSort.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/29.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation
//划分函数
func Partition <T: Comparable>(_ array: inout [T],low: Int,high: Int) -> Int
{
    //一般设置最后一个元素为支点
    let pivot = array[high]
    //i的初始值为low
    var i = low
    for j in low ..< high
    {
        if array[j] <= pivot
        {
            array.swapAt(i, j)
            i += 1
        }
    }
    array.swapAt(i, high)
    return i
}

func QuickSort<T: Comparable>(_ array: inout [T],low: Int,high: Int)
{
    guard low < high else { return }
    let pivot = Partition(&array, low: low, high: high)
    QuickSort(&array, low: low, high: pivot-1)
    QuickSort(&array, low: pivot+1, high: high)
}
