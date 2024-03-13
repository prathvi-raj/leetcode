import Foundation

/*

 129. Sum Root to Leaf Numbers
 Medium
 Topics
 Companies
 You are given the root of a binary tree containing digits from 0 to 9 only.

 Each root-to-leaf path in the tree represents a number.

 For example, the root-to-leaf path 1 -> 2 -> 3 represents the number 123.
 Return the total sum of all root-to-leaf numbers. Test cases are generated so that the answer will fit in a 32-bit integer.

 A leaf node is a node with no children.



 Example 1:


 Input: root = [1,2,3]
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 Example 2:


 Input: root = [4,9,0,5,1]
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.

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
    func sumNumbers(_ root: TreeNode?) -> Int {
        var result: [String] = []
        paths(root, &result, "")
        return result.reduce(0) { partialResult, current in
            return partialResult + Int(current)!
        }
    }

    private func paths(_ root: TreeNode?, _ result: inout [String], _ currentPath: String) {
        guard let root else { return }
        var currentPath = currentPath

        if !currentPath.isEmpty {
            currentPath.append("\(root.val)")
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

class Solution1 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return sum(root, 0)
    }

    func sum(_ n: TreeNode?, _ s: Int) -> Int {
        if n == nil {
            return 0
        }
        if n?.right == nil && n?.left == nil {
            return s*10 + n!.val
        }
        return sum(n?.left, s*10 + n!.val) + sum(n?.right, s*10 + n!.val)
    }
}
