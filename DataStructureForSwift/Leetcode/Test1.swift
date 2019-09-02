//
//  Test1.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/9/2.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

func moveZeroes(_ nums: inout [Int])
{
    var temp = 0
    for (_, value) in nums.enumerated()
    {
        if value != 0
        {
            nums[temp] = value
            temp += 1
        }
    }
    
    for i in temp ..< nums.count
    {
        nums[i] = 0
    }
}
//双指针
func moveZeroes2(_ nums: inout [Int])
{
    var i = 0
    for j in 0..<nums.count
    {
        if nums[j] != 0
        {
            nums[i] = nums[j]
            i += 1
        }
    }
    
    for index in i ..< nums.count
    {
        nums[index] = 0
    }
}



