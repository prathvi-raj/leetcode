import Foundation

/*
 Invert a binary tree.

 Example:

 Input:

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 Output:

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 Trivia:
 This problem was inspired by this original tweet by Max Howell:

 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        
        var stack = [root!]
        while !stack.isEmpty {
            let top = stack.popLast()!
            let temp = top.left
            top.left = top.right
            top.right = temp
            
            if top.left != nil {
                stack.append(top.left!)
            }
            if top.right != nil {
                stack.append(top.right!)
            }
        }
        return root
    }
}
