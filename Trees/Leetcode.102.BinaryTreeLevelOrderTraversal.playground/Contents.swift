import Foundation

/*
 102. Binary Tree Level Order Traversal
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

class Utility {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var i: Int = 0
        return construct(preorder, &i, Int.min, Int.max)
    }

    private func construct(_ preorder: [Int], _ i: inout Int, _ min: Int, _ max: Int) -> TreeNode? {
        if i >= preorder.count {
            return nil
        }

        let v: Int = preorder[i]
        if v < min || v > max {
            return nil
        }

        let n = TreeNode(v)
        i += 1

        n.left = construct(preorder, &i, min, v-1)
        n.right = construct(preorder, &i, v+1, max)

        return n
    }
}



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
            print(root!.val)
        }else {
            self.printLevel(root?.left, level-1, &result)
            self.printLevel(root?.right, level-1, &result)
        }
    }
}

print(Solution().levelOrder(Utility().bstFromPreorder([8,5,1,7,10,12])))
