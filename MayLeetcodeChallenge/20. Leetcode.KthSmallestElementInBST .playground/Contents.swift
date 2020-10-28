import Foundation

/*
 
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

 Example 1:

 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 Output: 1
 Example 2:

 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 Output: 3
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 
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
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var nums: [Int] = []
        
        self.inorder(root: root, list: &nums)
        
        if nums.count < k {
            return -1
        }
        
        return nums[k-1]
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


