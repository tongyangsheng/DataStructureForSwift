//
//  ViewController.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/7/19.
//  Copyright © 2019 game98. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("----------------------------数组---------------------------")
        //数组是一种线性表数据结构，它用一组连续的内存空间，来存储一组具有相同类型的数据
        //初始化数组:var someArray = [SomeType]() 或 var someArray = [SomeType](repeating: InitialValue, count: NumbeOfElements)
        //创建了一类型为 Int ，数量为 3，初始值为 10 的空数组
        var someInts = [Int](repeating: 10, count: 3)
        print("数组:\(someInts)")
        //创建含有三个元素的数组：
        //let someInts2:[Int] = [10,20,30]
        //可以根据数组的索引来访问数组的元素:var someVar = someArray[index]
        let someVar = someInts[0]
        //数组的随机访问：通过寻址公式：a[i]_address = base_address + i * data_type_size
        print("第一个元素的值\(someVar)")
        print("第二个元素的值\(someInts[1])")
        //使用 append() 方法或者赋值运算符 += 在数组末尾添加元素
        //数组的插入：最好时间复杂度：O(1)  最坏时间复杂度：O(n)
        someInts.append(20)
        someInts += [30]
        print("新增后数组:\(someInts)")
        //可以通过索引修改数组元素的值
        someInts[4] = 50
        print("修改后数组:\(someInts)")
        //遍历数组
        //方法一：使用for-in循环来遍历所有数组中的数据项
        print("遍历1:")
        for item in someInts
        {
            print(item)
        }
        //方法二：需要每个数据项的值和索引值，可以使用 String 的 enumerate() 方法来进行数组遍历
        print("遍历2:")
        for (index, item) in someInts.enumerated()
        {
            print("索引：\(index)，值：\(item)")
        }
        //数组的合并
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB
        print("合并后数组：\(intsC)")
    }
}

