import Foundation

/*

 653. Two Sum IV - Input is a BST
 Easy
 Topics
 Companies
 Given the root of a binary search tree and an integer k, return true if there exist two elements in the BST such that their sum is equal to k, or false otherwise.


 Example 1:


 Input: root = [5,3,6,2,4,null,7], k = 9
 Output: true
 Example 2:


 Input: root = [5,3,6,2,4,null,7], k = 28
 Output: false


 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -104 <= Node.val <= 104
 root is guaranteed to be a valid binary search tree.
 -105 <= k <= 105

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
        guard let root else { return false }
        var flatArray: [Int] = []
        inorder(root, result: &flatArray)
        return twoSum(flatArray, target: k)
    }

    private func inorder(_ root: TreeNode?, result: inout [Int]) {
        guard let root else { return }
        inorder(root.left, result: &result)
        result.append(root.val)
        inorder(root.right, result: &result)
    }

    private func twoSum(_ values: [Int], target: Int) -> Bool {
        var store = [Int: Bool]()
        for i in 0..<values.count {
            if  store[target - values[i]] != nil {
                return true
            } else {
                store[values[i]] = true
            }
        }
        return false
    }
}


class Solution1 {

    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root else { return false }

        var nums: [Int] = []
        self.inorder(root: root, list: &nums)

        var l: Int = 0
        var r: Int = nums.count - 1

        while l < r {
            let s = nums[l] + nums[r]
            if s == k { return true }
            if s < k {
                l = l + 1
            }else {
                r = r - 1
            }
        }
        return false
    }

    func inorder(root: TreeNode?, list: inout [Int]) -> Void {
        guard let root else { return }
        inorder(root: root.left, list: &list)
        list.append(root.val)
        inorder(root: root.right, list: &list)
    }
}
