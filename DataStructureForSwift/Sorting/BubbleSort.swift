//
//  File.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/29.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

//inout 关键字的作用是：让值传递以指针方式传递，可改变原来数据的值
func BubbleSort (_ num : inout [Int])
{
    let n = num.count
    for i in 0 ..< n
    {
        for j in 0 ..< (n-1-i)
        {
            if(num[j] > num[j+1])
            {
                num.swapAt(j, j+1)
            }
        }
    }
}
//冒泡排序优化1:当发现在某一趟排序中发现没有发生交换，则说明排序已经完成，所以可以在此趟排序后结束排序。在每趟排序前设置flag，当其未发生改变时，终止算法；
func BubbleSort1 (_ num : inout [Int])
{
    let n = num.count
    //设置初始值 判断是否发生交换
    for i in 0 ..< n
    {
        var end = true
        for j in 0 ..< (n-1-i)
        {
            if(num[j] > num[j+1])
            {
                num.swapAt(j, j+1)
                
                end = false
            }
        }
        //end值不变 为true结束排序
        if end
        {
            break
        }
    }
}
//冒泡排序优化2:每趟排序中，最后一次发生交换的位置后面的数据均已有序，所以我们可以记住最后一次交换的位置来减少排序的趟数。
func BubbleSort2 (_ num : inout [Int])
{
    let n = num.count
    //记录发生交换的位置
    var swapIndex = 0
    //需要执行交换操作的最大位置
    var k = n - 1
    for _ in 0 ..< n
    {
        var end = true
        for j in 0 ..< k
        {
            if(num[j] > num[j+1])
            {
                num.swapAt(j, j+1)
                end = false
                //赋值为最后交换的位置
                swapIndex = j
            }
        }
        k = swapIndex
        //end值不变 为true结束排序
        if end
        {
            break
        }
    }
}
