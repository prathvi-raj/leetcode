import Foundation

/*

 199. Binary Tree Right Side View
 Solved
 Medium
 Topics
 Companies
 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.



 Example 1:


 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]
 Example 2:

 Input: root = [1,null,3]
 Output: [1,3]
 Example 3:

 Input: root = []
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [0, 100].
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


class Solution0 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        let height = self.heightOfTree(root)
        var result: [Int] = []
        for i in 0..<height {
            var thisLevel: [Int] = []
            self.printLevel(root, i, &thisLevel)
            if let last = thisLevel.last {
                result.append(last)
            }
        }
        return result
    }

    private func heightOfTree(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }else {
            let leftHeight = heightOfTree(root?.left)
            let rightHeight = heightOfTree(root?.right)
            return max(leftHeight, rightHeight) + 1
        }
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


class Solution {

    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let tree = root else { return [] }

        var result: [[TreeNode]] = []
        traverse([tree], result: &result)

        return result.map { $0.last?.val ?? 0 }
    }

    func traverse(_ queue: [TreeNode], result: inout [[TreeNode]]) {
        var list: [TreeNode] = []
        var newQueue: [TreeNode] = []

        for tree in queue {
            
            list.append(tree)

            if let left = tree.left {
                newQueue.append(left)
            }

            if let right = tree.right {
                newQueue.append(right)
            }
        }

        result.append(list)

        if !newQueue.isEmpty {
            traverse(newQueue, result: &result)
        }
    }
}

print(Solution().rightSideView(t))
print(Solution().rightSideView(t2))
