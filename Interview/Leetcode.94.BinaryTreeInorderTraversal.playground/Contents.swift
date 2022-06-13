import Foundation

/*
 94. Binary Tree Inorder Traversal
 Given the root of a binary tree, return the inorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,3,2]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]


 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100


 Follow up: Recursive solution is trivial, could you do it iteratively?

 */



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int,
                _ left: TreeNode?,
                _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 0{
        return nil
    }

    let middle = nums.count/2
    var node = TreeNode(nums[middle])

    if middle != 0, let leftSubTree = sortedArrayToBST(Array(nums[0..<middle])){
        node.left = leftSubTree
    }

    if (middle + 1) < nums.count, let rightSubTree = sortedArrayToBST(Array(nums[middle+1..<nums.count])){
        node.right = rightSubTree
    }

    return node
}

class Solution94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        var stack: [TreeNode] = []
        var currentNode = root
        while currentNode != nil || !stack.isEmpty {

            while currentNode != nil {
                stack.append(currentNode!)
                currentNode = currentNode?.left
            }

            currentNode = stack.popLast()
            result.append(currentNode!.val)
            currentNode = currentNode?.right
        }

        return result
    }
}

/*
 145. Binary Tree Postorder Traversal
 Given the root of a binary tree, return the postorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [3,2,1]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]


 Constraints:

 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100


 Follow up: Recursive solution is trivial, could you do it iteratively?
 */



class Solution145 {

    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode?] = []
        var resultStack: [Int] = []
        stack.append(root)
        while !stack.isEmpty {
            if let node = stack.removeLast() {
                resultStack.insert(node.val, at: 0)
                if let left = node.left { stack.append(left) }
                if let right = node.right { stack.append(right) }
            }
        }
        return resultStack
    }
}

/*
 144. Binary Tree Preorder Traversal
 Given the root of a binary tree, return the preorder traversal of its nodes' values.



 Example 1:


 Input: root = [1,null,2,3]
 Output: [1,2,3]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [1]
 Output: [1]


 Constraints:

 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100


 Follow up: Recursive solution is trivial, could you do it iteratively?
 */

class Solution144 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }

        var result = [Int]()
        var stack = [TreeNode]()

        stack.append(root)
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            if let rightNode = node.right {
                stack.append(rightNode)
            }
            if let leftNode = node.left {
                stack.append(leftNode)
            }
        }

        return result
    }
}


//print(Solution94().inorderTraversal(sortedArrayToBST([1,2,3,4,5,6,7,8,9])))
//print(Solution145().postorderTraversal(sortedArrayToBST([1,2,3,4,5,6,7,8,9])))
//print(Solution144().preorderTraversal(sortedArrayToBST([1,2,3,4,5,6,7,8,9])))


class Solution2236 {
    func checkTree(_ root: TreeNode?) -> Bool {
        if let root = root, let left = root.left, let right = root.right {
            return root.val == (left.val + right.val)
        }
        return false
    }
}


//print(Solution2236().checkTree(sortedArrayToBST([5,3,1])))
//print(Solution2236().checkTree(sortedArrayToBST([10,4,6])))

/*
 1379. Find a Corresponding Node of a Binary Tree in a Clone of That Tree
 Given two binary trees original and cloned and given a reference to a node target in the original tree.

 The cloned tree is a copy of the original tree.

 Return a reference to the same node in the cloned tree.

 Note that you are not allowed to change any of the two trees or the target node and the answer must be a reference to a node in the cloned tree.



 Example 1:


 Input: tree = [7,4,3,null,null,6,19], target = 3
 Output: 3
 Explanation: In all examples the original and cloned trees are shown. The target node is a green node from the original tree. The answer is the yellow node from the cloned tree.
 Example 2:


 Input: tree = [7], target =  7
 Output: 7
 Example 3:


 Input: tree = [8,null,6,null,5,null,4,null,3,null,2,null,1], target = 4
 Output: 4


 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 The values of the nodes of the tree are unique.
 target node is a node from the original tree and is not null.


 Follow up: Could you solve the problem if repeated values on the tree are allowed?

 */

extension TreeNode: Equatable {
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val
    }
}

class Solution1379 {
    public func getTargetCopy(with original: TreeNode?, cloned: TreeNode?, target: TreeNode) -> TreeNode? {
        guard original != nil else { return nil }

        if original == target { return cloned }

        let left = getTargetCopy(with: original?.left, cloned: cloned?.left, target: target)
        if left != nil { return left }

        let right = getTargetCopy(with: original?.right, cloned: cloned?.right, target: target)
        return right
    }
}


/*
 938. Range Sum of BST
 Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].



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

class Solution938 {
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

    func rangeSumBST1(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        var res = 0
        func traverse(_ root: TreeNode?) {
            if let root = root {
                if root.val > high {
                    traverse(root.left)
                } else if root.val < low {
                    traverse(root.right)
                } else if root.val >= low && root.val <= high {
                    res += root.val
                    traverse(root.left)
                    traverse(root.right)
                }
            }
        }
        traverse(root)
        return res
    }

    func rangeSumBST2(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var sum = 0
        dps(root, L, R, &sum)
        return sum
    }

    func dps(_ root: TreeNode?, _ L: Int, _ R: Int, _ sum: inout Int) {
        if root == nil {
            return
        }

        if root!.val >= L && root!.val <= R {
            sum += root!.val
        }

        if root!.left != nil {
            dps(root!.left, L, R, &sum)
        }

        if root!.right != nil {
            dps(root!.right, L, R, &sum)
        }
    }
}


/*
 104. Maximum Depth of Binary Tree
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.



 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:

 Input: root = [1,null,2]
 Output: 2


 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100
 */

class Solution104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        let left = maxDepth(root.left)
        let right = maxDepth(root.right)
        
        return max(left, right) + 1
    }
}
