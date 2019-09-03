//
//  Binary search.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/30.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

func BinarySearch (sourceArray: [Int],find: Int) -> Int
{
    var lower = 0
    var higher = sourceArray.count - 1
    var compareTimes = 0
    while lower <= higher
    {
        let middle = (lower + higher)/2
        compareTimes += 1
        print("第\(compareTimes)次比较，中点为\(sourceArray[middle])")
        if find == sourceArray[middle]
        {
            return middle
        }
        if find > sourceArray[middle]
        {
            lower = middle + 1
        }
        if find < sourceArray[middle]
        {
            higher = middle - 1
        }
    }
    print("无此值")
    return -1
}
