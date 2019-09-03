//
//  Test3.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/9/3.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int]) -> [[Int]]
{
    var result = [[Int]]()
    var help = Dictionary<Int, Int>()
    for i in 0 ..< nums.count
    {
        help[0 - nums[i]] = nums[i]
    }
    for j in 0 ..< nums.count
    {
        if help[nums[j]] != nil
        {
            result.append([nums[j],help[nums[j]]!])
        }
    }
    return result
}
