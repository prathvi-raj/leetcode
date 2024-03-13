import Foundation

/*

 112. Path Sum
 Easy
 Topics
 Companies
 Given the root of a binary tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.

 A leaf is a node with no children.



 Example 1:


 Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 Output: true
 Explanation: The root-to-leaf path with the target sum is shown.
 Example 2:


 Input: root = [1,2,3], targetSum = 5
 Output: false
 Explanation: There two root-to-leaf paths in the tree:
 (1 --> 2): The sum is 3.
 (1 --> 3): The sum is 4.
 There is no root-to-leaf path with sum = 5.
 Example 3:

 Input: root = [], targetSum = 0
 Output: false
 Explanation: Since the tree is empty, there are no root-to-leaf paths.


 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000

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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else {  return false }
        return pathSum(root, target: targetSum, sum: 0)
    }

    private func pathSum(_ root: TreeNode?, target: Int, sum: Int) -> Bool {
        guard let root else {  return false }

        if root.left == nil && root.right == nil {
            if sum + root.val == target { return true }
        }

        if root.left == nil {
            return pathSum(root.right, target: target, sum: sum + root.val)
        }

        if root.right == nil {
            return pathSum(root.left, target: target, sum: sum + root.val)
        }

        return pathSum(root.left, target: target, sum: sum + root.val) || pathSum(root.right, target: target, sum: sum + root.val)
    }
}

class Solution1 {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else {  return false }
        return pathSum(root, target: targetSum, sum: 0)
    }

    private func pathSum(_ root: TreeNode?, target: Int, sum: Int) -> Bool {
        guard let root else {  return false }

        if root.left == nil && root.right == nil {
            if sum + root.val == target { return true }
        }

        return pathSum(root.left, target: target, sum: sum + root.val) || pathSum(root.right, target: target, sum: sum + root.val)
    }
}



print(Solution().hasPathSum(t2, 7))
print(Solution().hasPathSum(t2, 8))
print(Solution().hasPathSum(t2, 10))
print(Solution().hasPathSum(t2, 12))
