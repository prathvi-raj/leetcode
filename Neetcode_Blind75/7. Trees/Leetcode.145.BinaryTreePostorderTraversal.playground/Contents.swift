import Foundation

/*
 145. Binary Tree Postorder Traversal
 Solved
 Easy
 Topics
 Companies
 Given the root of a binary tree, return the postorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [3,2,1]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]


 Constraints:

 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100


 Follow up: Recursive solution is trivial, could you do it iteratively?
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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var stack: [TreeNode?] = []
        var result: [Int] = []
        stack.append(root)
        while !stack.isEmpty {
            if let current = stack.popLast() {
                result.insert(current!.val, at: 0)
                if let left = current?.left { stack.append(left) }
                if let right = current?.right { stack.append(right) }
            }
        }

        return result
    }
}

class Solution1 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        postorder(root, result: &result)
        return result
    }

    private func postorder(_ root: TreeNode?, result: inout [Int]) {
        guard let root = root else { return }
        postorder(root.left, result: &result)
        postorder(root.right, result: &result)
        result.append(root.val)
    }
}


print(Solution().postorderTraversal(t2))
print(Solution1().postorderTraversal(t2))
