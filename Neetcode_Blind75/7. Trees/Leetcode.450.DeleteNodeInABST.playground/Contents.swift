import Foundation

/*
 450. Delete Node in a BST
 Medium
 Topics
 Companies
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.

 Basically, the deletion can be divided into two stages:

 Search for a node to remove.
 If the node is found, delete the node.


 Example 1:


 Input: root = [5,3,6,2,4,null,7], key = 3
 Output: [5,4,6,2,null,null,7]
 Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
 One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
 Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.

 Example 2:

 Input: root = [5,3,6,2,4,null,7], key = 0
 Output: [5,3,6,2,4,null,7]
 Explanation: The tree does not contain a node with value = 0.
 Example 3:

 Input: root = [], key = 0
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -105 <= Node.val <= 105
 Each node has a unique value.
 root is a valid binary search tree.
 -105 <= key <= 105


 Follow up: Could you solve it with time complexity O(height of tree)?
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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }
        if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            if root.right == nil {
                return root.left
            } else if root.left == nil {
                return root.right
            } else {
                var newRight = root.left
                while let right = newRight?.right {
                    newRight = right
                }
                newRight?.right = root.right
                return root.left
            }
        }
        return root
    }
}

class Solution1 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        // search for the node to delete
        if key > root.val {
            root.right = deleteNode(root.right, key)
        } else if key < root.val {
            root.left = deleteNode(root.left, key)
        } else {
            // we found a node we want to delete
            // There are few cases which we need to handle
            // 1. If the node we want to delete has no leaves
            //    or just one, then we can return left or right node
            //    which will replace it.
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
            // 2. The node we want to delete is a parent node
            //    We have to find the smallest node from the right side,
            //    which will traverse to the smallest minNode
            //    then traverse to the bottom again and delete it
            //    to avoid duplicate node.
                let minNode = minNode(root.right)
                root.val = minNode!.val
                root.right = deleteNode(root.right, minNode!.val)
            }
        }

        // Go back to the top of the tree with updated nodes
        return root
    }

    // Find the smallest node
    func minNode(_ root: TreeNode?) -> TreeNode? {
        var curr = root

        while curr != nil && curr?.left != nil {
            curr = curr?.left
        }

        return curr
    }
}

class Solution3 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        // search for the node to delete
        if key > root.val {
            root.right = deleteNode(root.right, key)
        } else if key < root.val {
            root.left = deleteNode(root.left, key)
        } else {
            // we found a node we want to delete
            // There are few cases which we need to handle
            // 1. If the node we want to delete has no leaves
            //    or just one, then we can return left or right node
            //    which will replace it.
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
            // 2. The node we want to delete is a parent node
            //    We have to find the largest node from the left side,
            //    which will traverse to the largest maxNode
            //    then traverse to the bottom again and delete it
            //    to avoid duplicate node.
                let maxNode = maxNode(root.left)
                root.val = maxNode!.val
                root.left = deleteNode(root.left, maxNode!.val)
            }
        }

        // Go back to the top of the tree with updated nodes
        return root
    }

    // Find the smallest node
    func maxNode(_ root: TreeNode?) -> TreeNode? {
        var curr = root

        while curr != nil && curr?.right != nil {
            curr = curr?.right
        }

        return curr
    }
}


class Solution2 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root else { return nil }
        if key < root.val {
            root.left = deleteNode(root.left, key)
        } else if key > root.val {
            root.right = deleteNode(root.right, key)
        } else {
            
            if root.right == nil{
                return root.left
            }
            
            if root.left == nil {
                return root.right
            }

            var rightest = root.left
            while let right = rightest?.right {
                rightest = right
            }
            rightest?.right = root.right

            return root.left
        }
        return root
    }
}
