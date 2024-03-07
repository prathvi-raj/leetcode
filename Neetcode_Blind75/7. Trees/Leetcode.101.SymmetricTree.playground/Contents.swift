import Foundation

/*

 101. Symmetric Tree
 Easy
 Topics
 Companies
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).



 Example 1:


 Input: root = [1,2,2,3,4,4,3]
 Output: true
 Example 2:


 Input: root = [1,2,2,null,3,null,3]
 Output: false


 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100


 Follow up: Could you solve it both recursively and iteratively?

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

    private func isPalindrome( _ numbers: [Int]) -> Bool {

        guard numbers.count > 1 else { return true }
        var result: Bool = true
        for i in 0...numbers.count/2 {
            result = result && numbers[i] == numbers[numbers.count-i-1]
        }

        print("\(numbers) : \(result)")
        return result
    }

    func isSymmetric(_ root: TreeNode?) -> Bool {
        let height = self.heightOfTree(root)
        var result: Bool = true
        for i in 0..<height {
            var thisLevel: [Int] = []
            self.printLevel(root, i, &thisLevel)
            result = result &&  isPalindrome(thisLevel)
        }
        return result
    }
}


class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        isMirror(root, root)
    }

    private func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil, right == nil { return true }

        guard left?.val == right?.val else { return false }

        return isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
    }
}


class Solution2 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var stack: [(TreeNode?, TreeNode?)] = [(root.left, root.right)]
        while !stack.isEmpty {
            let (left, right) = stack.removeFirst()
            if left == nil && right == nil {
                continue
            }
            if left?.val != right?.val {
                return false
            }
            stack.append((left?.right, right?.left))
            stack.append((left?.left, right?.right))
        }
        return true
    }
}
