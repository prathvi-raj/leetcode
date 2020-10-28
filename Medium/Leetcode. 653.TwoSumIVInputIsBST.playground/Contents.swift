import Foundation

/*
 Given a Binary Search Tree and a target number, return true if there exist two elements in the BST such that their sum is equal to the given target.

 Example 1:

 Input:
     5
    / \
   3   6
  / \   \
 2   4   7

 Target = 9

 Output: True
  

 Example 2:

 Input:
     5
    / \
   3   6
  / \   \
 2   4   7

 Target = 28

 Output: False
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
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        
        var nums: [Int] = []
        
        self.inorder(root: root, list: &nums)
        
        if nums.isEmpty {
            return false
        }
        
        var l: Int = 0
        var r: Int = nums.count - 1
        
        while l < r {
            let s = nums[l] + nums[r]
            if s == k {
                return true
            }
            if s < k {
                l = l + 1
            }else {
                r = r - 1
            }
        }
        return false
    }
    
    func inorder(root: TreeNode?, list: inout [Int]) -> Void {
        if root == nil {
            return
        }
        inorder(root: root?.left, list: &list)
        list.append(root!.val)
        inorder(root: root?.right, list: &list)
    }
}
