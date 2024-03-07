import Foundation

/*
 226. Invert Binary Tree
 Solved
 Easy
 Topics
 Companies
 Given the root of a binary tree, invert the tree, and return its root.



 Example 1:


 Input: root = [4,2,7,1,3,6,9]
 Output: [4,7,2,9,6,3,1]
 Example 2:


 Input: root = [2,1,3]
 Output: [2,3,1]
 Example 3:

 Input: root = []
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

let t = TreeNode(0,
                 TreeNode(1,
                          TreeNode(3,
                                   TreeNode(7),
                                   TreeNode(8)),
                          TreeNode(4,
                                   TreeNode(9),
                                   TreeNode(10))),
                 TreeNode(2,
                          TreeNode(5,
                                   TreeNode(11),
                                   TreeNode(12)),
                          TreeNode(6,
                                   TreeNode(13),
                                   TreeNode(14))))

let t2 = TreeNode(1,
                 TreeNode(2,
                          TreeNode(4),
                          TreeNode(5)),
                 TreeNode(3,
                          TreeNode(6),
                          TreeNode(7)))


class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        var stack: [TreeNode?] = [root]
        while !stack.isEmpty {
            if let current = stack.popLast() {
                let left = current?.left
                current?.left = current?.right
                current?.right = left

                if let left = current?.left {
                    stack.append(left)
                }

                if let right = current?.right {
                    stack.append(right)
                }
            }
        }

        return root
    }
}


class Solution1 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return root }
        let left = root.left
        let right = root.right
        root.right = invertTree(left)
        root.left = invertTree(right)
        return root
    }
}


Solution().invertTree(t2)
