import Foundation

/*
 1305. All Elements in Two Binary Search Trees
 Medium
 Topics
 Companies
 Hint
 Given two binary search trees root1 and root2, return a list containing all the integers from both trees sorted in ascending order.



 Example 1:


 Input: root1 = [2,1,4], root2 = [1,0,3]
 Output: [0,1,1,2,3,4]
 Example 2:


 Input: root1 = [1,null,8], root2 = [8,1]
 Output: [1,1,8,8]


 Constraints:

 The number of nodes in each tree is in the range [0, 5000].
 -105 <= Node.val <= 105
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
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var nums1: [Int] = []
        var nums2: [Int] = []
        self.preorder(root1, &nums1)
        self.preorder(root2, &nums2)
        self.merge(&nums1, nums1.count, nums2, nums2.count)

        return nums1
    }

    private func preorder(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root else { return }
        self.preorder(root.left, &result)
        result.append(root.val)
        self.preorder(root.right, &result)
    }

    private func merge(_ nums1: inout [Int],
                       _ m: Int,
                       _ nums2: [Int],
                       _ n: Int) {
        var total : Int =  m + n - 1
        var m = m - 1
        var n = n - 1

        while total >= 0 {

            if (m < 0) {
                nums1[total] = nums2[n]
                total -= 1
                n -= 1
                continue
            }

            if (n < 0) {
                nums1[total] = nums1[m]
                total -= 1
                m -= 1
                continue
            }

            if nums1[m] > nums2[n] {
                nums1[total] = nums1[m]
                total -= 1
                m -= 1
            }else {
                nums1[total] = nums2[n]
                total -= 1
                n -= 1
            }

        }
    }
}

class Solution1 {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var nums1: [Int] = []
        var nums2: [Int] = []
        self.inorder(root1, &nums1)
        self.inorder(root2, &nums2)
        self.merge(&nums1, nums1.count, nums2, nums2.count)

        return nums1
    }

    private func inorder(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root else { return }
        self.inorder(root.left, &result)
        result.append(root.val)
        self.inorder(root.right, &result)
    }

    private func merge(_ nums1: inout [Int],
                       _ m: Int,
                       _ nums2: [Int],
                       _ n: Int) {
        var total : Int =  m + n - 1
        var m = m - 1
        var n = n - 1

        while total >= 0 {

            if (m < 0) {
                nums1[total] = nums2[n]
                total -= 1
                n -= 1
                continue
            }

            if (n < 0) {
                nums1[total] = nums1[m]
                total -= 1
                m -= 1
                continue
            }

            if nums1[m] > nums2[n] {
                nums1[total] = nums1[m]
                total -= 1
                m -= 1
            }else {
                nums1[total] = nums2[n]
                total -= 1
                n -= 1
            }

        }
    }
}

