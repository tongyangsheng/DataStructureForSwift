//
//  Test2.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/9/2.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int
{
    guard nums.count > 2 else
    {
        return nums.count
    }
    var temp = 1
    for i in 2 ..< nums.count
    {
        if nums[i] != nums[temp - 1]
        {
            temp += 1
            nums[temp] = nums[i]
        }
    }
    return temp + 1
}
