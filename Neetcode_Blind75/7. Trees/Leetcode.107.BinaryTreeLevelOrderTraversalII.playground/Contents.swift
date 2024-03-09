import Foundation

/*

 107. Binary Tree Level Order Traversal II
 Medium
 Topics
 Companies
 Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).



 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[15,7],[9,20],[3]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
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
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue: [[TreeNode]] = [[root]]
        var result: [[Int]] = []
        while !queue.isEmpty {
            if let current = queue.popLast() {
                var nodesOnLevel: [TreeNode] = []
                var valuesOnLevel: [Int] = []
                for i in 0..<current.count {
                    valuesOnLevel.append(current[i].val)

                    if let left = current[i].left {
                        nodesOnLevel.append(left)
                    }

                    if let right = current[i].right {
                        nodesOnLevel.append(right)
                    }
                }

                if !nodesOnLevel.isEmpty {
                    queue.insert(nodesOnLevel, at: 0)
                }

                result.insert(valuesOnLevel, at: 0)
            }
        }
        return result
    }
}


print(Solution().levelOrderBottom(t2))
