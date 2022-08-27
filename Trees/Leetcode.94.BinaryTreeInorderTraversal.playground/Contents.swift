import Foundation

/*
 94. Binary Tree Inorder Traversal

 Given the root of a binary tree, return the inorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,3,2]
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

class Solution {
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

class Solution1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result: [Int] = []

        var stack: [TreeNode] = []

        var current: TreeNode? = root
        while !stack.isEmpty || current != nil {
            while current != nil {
                stack.append(current!)
                current = current?.left
            }
            let top = stack.popLast()
            result.append(top!.val)
            current = top?.right
        }

        return result

    }
}

class Solution2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var currentNode = root
        while currentNode != nil || !stack.isEmpty {

            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }

            currentNode = stack.popLast()
            result.append(currentNode!.val)
            currentNode = currentNode?.right
        }

        return result
    }
}

class Solution3 {

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        self.inorderTraverse(root, &result)
        return result
    }

    private func inorderTraverse(_ root: TreeNode?, _ result: inout [Int]) {
        guard root != nil else { return }
        self.inorderTraverse(root?.left, &result)
        result.append(root!.val)
        self.inorderTraverse(root?.right, &result)
    }
}

Solution1().inorderTraversal(Solution().bstFromPreorder([8,5,1,7,10,12]))
Solution2().inorderTraversal(Solution().bstFromPreorder([8,5,1,7,10,12]))
Solution3().inorderTraversal(Solution().bstFromPreorder([8,5,1,7,10,12]))
