import Foundation

/*

 110. Balanced Binary Tree
 Easy
 Topics
 Companies
 Given a binary tree, determine if it is
 height-balanced
 .



 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: true
 Example 2:


 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 Example 3:

 Input: root = []
 Output: true


 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104

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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        if abs(depthOfTree(root.left) - depthOfTree(root.right)) > 1 {
            return false
        }
        return isBalanced(root.left) && isBalanced(root.right)
    }

    private func depthOfTree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        return max(depthOfTree(root.left), depthOfTree(root.right)) + 1

    }
}
