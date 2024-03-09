import Foundation

/*

 111. Minimum Depth of Binary Tree
 Easy
 Topics
 Companies
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.



 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 Example 2:

 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5


 Constraints:

 The number of nodes in the tree is in the range [0, 105].
 -1000 <= Node.val <= 1000


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

    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = 1 + minDepth(root.left)
        let right = 1 + minDepth(root.right)

        if root.left == nil {
            return right
        } else if root.right == nil {
            return left
        }

        return min(left, right)
    }
}

class Solution1 {

    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return min(minDepth(root.left), minDepth(root.right)) + 1
    }
}

