import Foundation

/*
 Given a binary tree, return the preorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
    1
     \
      2
     /
    3

 Output: [1,2,3]
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
 
 
class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var result: [Int] = []
        result.append(root!.val)
        result += preorderTraversal(root!.left)
        result += preorderTraversal(root!.right)
        return result
    }
}


