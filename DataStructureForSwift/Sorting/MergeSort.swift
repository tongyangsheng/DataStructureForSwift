//
//  MergeSort.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/29.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation
//两个有序数组合并为新的有序数组
func mergeArray (leftArray : Array<Int>,rightArray : Array<Int>) -> (Array<Int>)
{
    //创建一个临时数组
    var tempArray = [Int]()
    //都从两个数组的第一个元素开始比较
    var leftIndex = 0
    var rightIndex = 0
    //讲比较结果中小的元素存入到临时数组
    while leftIndex < leftArray.count && rightIndex < rightArray.count
    {
        if leftArray[leftIndex] < rightArray[rightIndex]
        {
            tempArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        else
        {
            tempArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    //当其中一个数组中的元素全部加入到临时数组中时，只要将另一个数组的元素依次填入
    while leftIndex < leftArray.count
    {
        tempArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightArray.count
    {
        tempArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    return tempArray
}

func MergeSort (_ items : Array<Int>) -> (Array<Int>)
{
    //将初始数组分为单个数组元素
    var tempArray : Array<Array<Int>> = []
    for item in items
    {
        var subArray : Array<Int> = []
        subArray.append(item)
        tempArray.append(subArray)
    }
    while tempArray.count != 1
    {
        print("此时数组为：\(tempArray)")
        var i = 0
        //将数组中的数组元素两两合并，然后返回新的数组
        while i < tempArray.count - 1
        {
            print("合并\(tempArray[i])和\(tempArray[i+1])")
            tempArray[i] = mergeArray(leftArray: tempArray[i], rightArray: tempArray[i+1])
            print("合并结果为：\(tempArray[i])")
            tempArray.remove(at: i+1)
            i = i+1
        }
    }
    //最后，tempArray最后只有一个元素，返回该元素
    return tempArray.first!
}
