import Foundation

/*

 543. Diameter of Binary Tree
 Solved
 Easy
 Topics
 Companies
 Given the root of a binary tree, return the length of the diameter of the tree.

 The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 The length of a path between two nodes is represented by the number of edges between them.



 Example 1:


 Input: root = [1,2,3,4,5]
 Output: 3
 Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
 Example 2:

 Input: root = [1,2]
 Output: 1


 Constraints:

 The number of nodes in the tree is in the range [1, 104].
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

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var result: Int = 0
        dfs(root, &result)
        return result
    }

    func dfs(_ node: TreeNode?, _ result: inout Int) -> Int {
        guard let node = node else { return 0 }
        let leftDepth = dfs(node.left, &result)
        let rightDepth = dfs(node.right, &result)
        result = max(result, leftDepth + rightDepth)
        return 1 + max(leftDepth, rightDepth)
    }
}
