import Foundation

/*

 669. Trim a Binary Search Tree
 Medium
 Topics
 Companies
 Given the root of a binary search tree and the lowest and highest boundaries as low and high, trim the tree so that all its elements lies in [low, high]. Trimming the tree should not change the relative structure of the elements that will remain in the tree (i.e., any node's descendant should remain a descendant). It can be proven that there is a unique answer.

 Return the root of the trimmed binary search tree. Note that the root may change depending on the given bounds.



 Example 1:


 Input: root = [1,0,2], low = 1, high = 2
 Output: [1,null,2]
 Example 2:


 Input: root = [3,0,4,null,2,null,null,1], low = 1, high = 3
 Output: [3,2,null,1]


 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 104
 The value of each node in the tree is unique.
 root is guaranteed to be a valid binary search tree.
 0 <= low <= high <= 104


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
    func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
        guard let root else { return nil }

        if low > root.val { return trimBST(root.right, low, high) }

        if high < root.val { return trimBST(root.left, low, high) }

        root.left = trimBST(root.left, low, high)
        root.right = trimBST(root.right, low, high)

        return root
    }
}

