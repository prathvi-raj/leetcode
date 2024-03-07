import Foundation

/*

 102. Binary Tree Level Order Traversal
 Solved
 Medium
 Topics
 Companies
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).



 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 Seen this question in a real interview before?
 1/4

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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        guard let root = root else { return ans }

        var q = [TreeNode]()
        q.append(root)
        while q.count > 0 {
            let size = q.count
            var list = [Int]()
            for i in 0..<size {
                let cur = q.removeFirst()
                list.append(cur.val)
                if let left = cur.left {
                    q.append(left)
                }
                if let right = cur.right {
                    q.append(right)
                }
            }
            ans.append(list)
        }
        return ans
    }
}


class Solution1 {

    private func heightOfTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }else {
            let leftHeight = heightOfTree(root?.left)
            let rightHeight = heightOfTree(root?.right)
            return max(leftHeight, rightHeight) + 1
        }
    }

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        let height = self.heightOfTree(root)
        var result: [[Int]] = []
        for i in 0..<height {
            var thisLevel: [Int] = []
            self.printLevel(root, i, &thisLevel)
            if !thisLevel.isEmpty {
                result.append(thisLevel)
            }
        }
        return result
    }

    private func printLevel(_ root: TreeNode?, _ level: Int, _ result: inout [Int]) {
        guard root != nil else { return }
        if level == 0 {
            result.append(root!.val)
        }else {
            self.printLevel(root?.left, level-1, &result)
            self.printLevel(root?.right, level-1, &result)
        }
    }
}

print(Solution1().levelOrder(t2))
