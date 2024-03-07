import Foundation

/*

 94. Binary Tree Inorder Traversal

 Given the root of a binary tree, return the inorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,3,2]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]


 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100


 Follow up: Recursive solution is trivial, could you do it iteratively?

Root -> Current -> Left

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

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var stack: [TreeNode?] = []
        var result: [Int] = []

        var current: TreeNode? = root
        while current != nil || !stack.isEmpty {
            while current != nil {
                stack.append(current)
                current = current?.left
            }

            if let last = stack.popLast() {
                result.append(last!.val)
                current = last?.right
            }
        }

        return result
    }
}

class Solution1 {
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        inorder(root, result: &result)
        return result
    }

    private func inorder(_ node: TreeNode?, result: inout [Int] ) {
        guard let node = node else { return }
        inorder(node.left, result: &result)
        result.append(node.val)
        inorder(node.right, result: &result)
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
                          TreeNode(4,
                                   TreeNode(7),
                                   TreeNode(8)),
                          TreeNode(5,
                                   TreeNode(9),
                                   TreeNode(10))),
                 TreeNode(3,
                          TreeNode(6,
                                   TreeNode(11),
                                   TreeNode(12)),
                          TreeNode(7,
                                   TreeNode(13),
                                   TreeNode(14))))


print(Solution().inorderTraversal(t))
print(Solution1().inorderTraversal(t))
