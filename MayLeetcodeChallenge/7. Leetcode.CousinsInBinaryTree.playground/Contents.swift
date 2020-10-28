import Foundation

/*
 
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

 Return true if and only if the nodes corresponding to the values x and y are cousins.

  

 Example 1:


 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 Example 2:


 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 Example 3:



 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
  

 Note:

 The number of nodes in the tree will be between 2 and 100.
 Each node has a unique integer value from 1 to 100.

 
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
    
    var depthX = -1
    var depthY = -1
    var parentX = -1
    var parentY = -1
    
    var x = 0
    var y = 0
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        self.x = x
        self.y = y
        
        traverse(root, 0)
        
        return depthX == depthY && parentX != parentY
    }
    
    func traverse(_ root: TreeNode?, _ l: Int) {
    
        guard let r = root else { return }
        
        if r.left?.val == x || r.right?.val == x { parentX = r.val }
        if r.left?.val == y || r.right?.val == y { parentY = r.val }
        
        if r.val == x { depthX = l }
        if r.val == y { depthY = l }
        
        traverse(r.left, l + 1)
        traverse(r.right, l + 1)
    }
}
