//
//  SelectionSort.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/29.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

func SelectionSort (_ num : inout [Int])
{
    let n = num.count
    for i in 0 ..< n
    {
        //假设当前值即为最小元素
        var minIndex = i
        for j in i + 1 ..< n
        {
            if num[j] < num[minIndex]
            {
                //找到最小元素的下标
                minIndex = j
            }
        }
        if i != minIndex
        {
            //将当前元素与最小元素互换
            num.swapAt(i, minIndex)
        }
    }
}
