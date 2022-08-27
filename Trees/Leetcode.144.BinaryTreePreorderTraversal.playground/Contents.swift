import Foundation

/*
 144. Binary Tree Preorder Traversal
 Easy

 4524

 135

 Add to List

 Share
 Given the root of a binary tree, return the preorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,2,3]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]


 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100


 Follow up: Recursive solution is trivial, could you do it iteratively?
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

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        internalPreOrder(root: root, result: &result)
        return result
    }

    func internalPreOrder(root: TreeNode?, result: inout [Int]) {
        if root == nil { return }
        result.append(root!.val)
        internalPreOrder(root: root?.left, result: &result)
        internalPreOrder(root: root?.right, result: &result)
    }
}


class Solution1 {

    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var stack = [TreeNode]()
        var res = [Int]()
        stack.append(root)

        while !stack.isEmpty {
            let topNode = stack.removeLast()
            res.append(topNode.val)

            if let right = topNode.right {
                stack.append(right)
            }

            if let left = topNode.left {
                stack.append(left)
            }
        }

        return res
    }
}


Solution().preorderTraversal(Utility().bstFromPreorder([8,5,1,7,10,12]))
Solution1().preorderTraversal(Utility().bstFromPreorder([8,5,1,7,10,12]))
