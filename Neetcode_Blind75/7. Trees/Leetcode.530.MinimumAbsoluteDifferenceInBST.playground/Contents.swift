import Foundation

/*

 530. Minimum Absolute Difference in BST
 Easy
 Topics
 Companies
 Given the root of a Binary Search Tree (BST), return the minimum absolute difference between the values of any two different nodes in the tree.



 Example 1:


 Input: root = [4,2,6,1,3]
 Output: 1
 Example 2:


 Input: root = [1,0,48,null,null,12,49]
 Output: 1


 Constraints:

 The number of nodes in the tree is in the range [2, 104].
 0 <= Node.val <= 105


 Note: This question is the same as 783: https://leetcode.com/problems/minimum-distance-between-bst-nodes/


 https://leetcode.com/problems/minimum-absolute-difference-in-bst/solutions/3636061/swift-o-n-time-o-1-space-with-handy-morris-traversal/

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

class Solution0 {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        guard let root else { return -1 }

        var nums: [Int] = []
        self.inorder(root: root, list: &nums)

        var result: Int = Int.max
        for i in 0..<nums.count-1 {
            result = min(result, abs(nums[i] - nums[i+1]))
        }
        return result
    }

    func inorder(root: TreeNode?, list: inout [Int]) -> Void {
        guard let root else { return }
        inorder(root: root.left, list: &list)
        list.append(root.val)
        inorder(root: root.right, list: &list)
    }
}


class Solution {

    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var difference = Int.max
        var previousNodeValue: Int?
        inOrderTraversal(root, difference: &difference, previousNodeValue: &previousNodeValue)
        return difference
    }

    func inOrderTraversal(_ node: TreeNode?, difference: inout Int, previousNodeValue: inout Int?) {
        guard let currentNode = node else { return }

        inOrderTraversal(currentNode.left, difference: &difference, previousNodeValue: &previousNodeValue)

        if let value = previousNodeValue { difference = min(difference, abs(currentNode.val - value)) }

        previousNodeValue = currentNode.val

        inOrderTraversal(currentNode.right, difference: &difference, previousNodeValue: &previousNodeValue)
    }
}
