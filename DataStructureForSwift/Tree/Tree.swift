//
//  Tree.swift
//  DataStructureForSwift
//
//  Created by game98 on 2019/8/13.
//  Copyright © 2019 game98. All rights reserved.
//

import Foundation

//二叉树的节点
public class TreeNode
{
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    //初始化方法
    public init (_ val: Int)
    {
        self.val = val
        self.left = nil
        self.right = nil
    }
    //获取指定节点的最大深度
    func getMaxDepth(treeNode: TreeNode?) -> Int
    {
        guard let node = treeNode else { return 0 }
        //递归求  左右节点最大深度的较大值
        let total = max(getMaxDepth(treeNode: node.left), getMaxDepth(treeNode: node.right)) + 1
        return total
    }
    //判断是否为二叉搜索树
    func isBinarySearchTree(treeNode: TreeNode?) -> Bool
    {
        guard let node = treeNode else { return true }
        if node.left != nil && node.val <= (node.left?.val)!
        {
            return false
        }
        if node.right != nil && node.val >= (node.right?.val)!
        {
            return false
        }
        //递归检查左右子树是否符合条件
        return isBinarySearchTree(treeNode: node.left) && isBinarySearchTree(treeNode: node.right)
    }
}
