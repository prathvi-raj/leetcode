import Foundation

/*
 98. Validate Binary Search Tree

 Given the root of a binary tree, determine if it is a valid binary search tree (BST).

 A valid BST is defined as follows:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.


 Example 1:


 Input: root = [2,1,3]
 Output: true
 Example 2:


 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.


 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
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


class Builder {
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

//class Solution {
//    func isValidBST(_ root: TreeNode?) -> Bool {
//        guard root != nil else { return true }
//
//        if root?.left == nil && root?.right == nil {
//            return true
//        }
//
//        if root.left != nil && root.right == nil {
//            if root.val >= root!.left!.val { return false }
//            return self.isValidBST(root?.left)
//        }
//
//        if root?.left == nil && root?.right != nil {
//            if root!.val <= root!.right!.val { return false }
//            return self.isValidBST(root?.left)
//        }
//
//        return self.isValidBST(root?.left) && self.isValidBST(root?.right)
//    }
//}


class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return validate(root, Int.min, Int.max)
    }

    private func validate(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {

        if root == nil { return true }

        if root!.val <= min || root!.val >= max {
            return false
        } else {
            return validate(root?.left, min, root!.val) && validate(root?.right, root!.val, max)
        }
    }
}
