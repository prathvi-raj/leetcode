import Foundation

/*

 700. Search in a Binary Search Tree
 Solved
 Easy
 Topics
 Companies
 You are given the root of a binary search tree (BST) and an integer val.

 Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.



 Example 1:


 Input: root = [4,2,7,1,3], val = 2
 Output: [2,1,3]
 Example 2:


 Input: root = [4,2,7,1,3], val = 5
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [1, 5000].
 1 <= Node.val <= 107
 root is a binary search tree.
 1 <= val <= 107

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
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val == val { return root }
        if val < root.val { return searchBST(root.left, val) }
        if val > root.val { return searchBST(root.right, val) }
        return nil
    }
}


class Solution1 {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else { return nil }
        var current: TreeNode? = root
        while current != nil {
            if current!.val == val { return current }
            if val < current!.val{
                current = current?.left
            } else if val > current!.val {
                current = current?.right
            }
        }
        return nil
    }
}
