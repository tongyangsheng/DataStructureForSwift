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

func twoSum2(_ nums: [Int]) -> [[Int]]
{
    var result = [[Int]]()
    var help = Dictionary<Int, Int>()
    for i in 0 ..< nums.count
    {
        if help[nums[i]] != nil
        {
            result.append([nums[i],help[nums[i]]!])
            help[0 - nums[i]] = nums[i]
        }
        else
        {
            help[0 - nums[i]] = nums[i]
        }
    }
    return result
}

func threeSum(_ nums: [Int]) -> [[Int]]
{
    var result = [[Int]]()
    let sortedNums = nums.sorted()
    let length = sortedNums.count
    //优化1:数组两端必须异号，否则无解
    if sortedNums[0] <= 0 && sortedNums[length - 1] >= 0
    {
        for var i in 0 ..< length-2
        {
            //最左边大于0一定没有解
            if sortedNums[i] > 0
            {
                break
            }
            var first = i + 1
            var last = length - 1
            while first < last
            {
                //两者相遇或三者同号，退出
                if first >= last || sortedNums[i] * sortedNums[last] > 0
                {
                    break
                }
                let sum = sortedNums[i] + sortedNums[first] + sortedNums[last]
                if sum == 0
                {
                    result.append([sortedNums[i],sortedNums[first],sortedNums[last]])
                }
                if sum <= 0
                {
                    first = first + 1
                }
                else
                {
                    last = last - 1
                }
            }
            if sortedNums[i] == sortedNums[i + 1]
            {
                i += 1
                break
            }
        }
    }
    return result
}
