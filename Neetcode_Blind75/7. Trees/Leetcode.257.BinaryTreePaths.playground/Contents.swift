import Foundation

/*

 257. Binary Tree Paths
 Easy
 Topics
 Companies
 Given the root of a binary tree, return all root-to-leaf paths in any order.

 A leaf is a node with no children.



 Example 1:


 Input: root = [1,2,3,null,5]
 Output: ["1->2->5","1->3"]
 Example 2:

 Input: root = [1]
 Output: ["1"]


 Constraints:

 The number of nodes in the tree is in the range [1, 100].
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
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root else { return [] }
        var result: [String] = []
        paths(root, &result, "")
        return result
    }

    private func paths(_ root: TreeNode?, _ result: inout [String], _ currentPath: String) {
        guard let root else { return }
        var currentPath = currentPath

        if !currentPath.isEmpty {
            currentPath.append("->\(root.val)")
        } else {
            currentPath.append("\(root.val)")
        }


        if root.right == nil && root.left == nil {
            result.append(currentPath)
            return
        }

        if root.left != nil && root.right != nil {
            self.paths(root.left, &result, currentPath)
            self.paths(root.right, &result, currentPath)
        } else if root.left == nil {
            self.paths(root.right, &result, currentPath)
        } else if root.right == nil {
            self.paths(root.left, &result, currentPath)
        }
    }
}


print(Solution().binaryTreePaths(t2))
