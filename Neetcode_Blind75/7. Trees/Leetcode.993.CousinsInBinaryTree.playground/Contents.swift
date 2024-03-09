import Foundation

/*

 993. Cousins in Binary Tree
 Solved
 Easy
 Topics
 Companies
 Given the root of a binary tree with unique values and the values of two different nodes of the tree x and y, return true if the nodes corresponding to the values x and y in the tree are cousins, or false otherwise.

 Two nodes of a binary tree are cousins if they have the same depth with different parents.

 Note that in a binary tree, the root node is at the depth 0, and children of each depth k node are at the depth k + 1.



 Example 1:


 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 Example 2:


 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 Example 3:


 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false


 Constraints:

 The number of nodes in the tree is in the range [2, 100].
 1 <= Node.val <= 100
 Each node has a unique value.
 x != y
 x and y are exist in the tree.

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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root = root else { return false }
        var queue: [[TreeNode]] = [[root]]
        while !queue.isEmpty {
            if let current = queue.popLast() {
                var nodesOnLevel: [TreeNode] = []
                var toSearch: Int? = nil

                for i in 0..<current.count {

                    if toSearch != nil && (toSearch == current[i].left?.val || toSearch == current[i].right?.val) { return true }

                    if x == current[i].left?.val && y == current[i].right?.val { return false }
                    
                    if x == current[i].left?.val { toSearch = y }
                    if x == current[i].right?.val { toSearch = y}
                    if y == current[i].left?.val { toSearch = x }
                    if y == current[i].right?.val { toSearch = x }

                    if let left = current[i].left { nodesOnLevel.append(left) }
                    if let right = current[i].right { nodesOnLevel.append(right) }
                }

                if toSearch != nil { return false }

                if !nodesOnLevel.isEmpty {
                    queue.insert(nodesOnLevel, at: 0)
                }
            }
        }
        return false
    }
}
