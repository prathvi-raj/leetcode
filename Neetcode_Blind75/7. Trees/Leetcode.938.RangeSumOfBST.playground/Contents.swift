import Foundation

/*

 Example 1:


 Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
 Output: 32
 Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
 Example 2:


 Input: root = [10,5,15,3,7,13,18,1,null,6], low = 6, high = 10
 Output: 23
 Explanation: Nodes 6, 7, and 10 are in the range [6, 10]. 6 + 7 + 10 = 23.


 Constraints:

 The number of nodes in the tree is in the range [1, 2 * 104].
 1 <= Node.val <= 105
 1 <= low <= high <= 105
 All Node.val are unique.

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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else { return 0 }
        var result: Int = 0
        inOrderTraversal(root, result: &result, low, high)
        return result
    }

    func inOrderTraversal(_ node: TreeNode?, result: inout Int, _ low: Int, _ high: Int) {
        guard let currentNode = node,
              (low <= currentNode.val &&  currentNode.val <= high) else { return }
        inOrderTraversal(currentNode.left, result: &result, low, high)
        if low <= currentNode.val &&  currentNode.val <= high { result = result + currentNode.val }
        inOrderTraversal(currentNode.right, result: &result, low, high)
    }
}

class Solution1 {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else { return 0 }
        if root.val < low { return rangeSumBST(root.right, low, high) }
        if root.val > high { return rangeSumBST(root.left, low, high) }

        var output = root.val
        output += rangeSumBST(root.left, low, high)
        output += rangeSumBST(root.right, low, high)

        return output
    }
}

class Solution2 {
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var result: Int = 0
        var stack: [TreeNode] = []
        var currentNode = root
        while currentNode != nil || !stack.isEmpty {

            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }

            currentNode = stack.popLast()
            if currentNode!.val >= low && currentNode!.val <= high {
                result = result + currentNode!.val
            }
            currentNode = currentNode?.right
        }

        return result
    }
}
