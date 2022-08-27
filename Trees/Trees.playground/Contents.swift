import Foundation

/*
Common methods on tree.
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


class Builder {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        var i: Int = 0
        return construct(preorder, &i, Int.min, Int.max)
    }

    private func construct(_ preorder: [Int], _ i: inout Int, _ min: Int, _ max: Int) -> TreeNode? {
        if i >= preorder.count {
            return nil
        }

        let v: Int = preorder[i]
        if v < min || v > max {
            return nil
        }

        let n = TreeNode(v)
        i += 1

        n.left = construct(preorder, &i, min, v-1)
        n.right = construct(preorder, &i, v+1, max)

        return n
    }
}


class Tree {

    func preOrder(_ node: TreeNode?) {
        guard node != nil else { return }
        print(node!.val, terminator: ",")
        self.preOrder(node?.left)
        self.preOrder(node?.right)
    }

    func inOrder(_ node: TreeNode?) {
        guard node != nil else { return }
        self.inOrder(node?.left)
        print(node!.val, terminator: ",")
        self.inOrder(node?.right)
    }

    func postOrder(_ node: TreeNode?) {
        guard node != nil else { return }
        self.postOrder(node?.left)
        self.postOrder(node?.right)
        print(node!.val, terminator: ",")
    }

    func levelOrder(_ node: TreeNode?) {
        guard node != nil else { return }

        var queue: [TreeNode?] = []
        queue.append(node)
        queue.append(nil)
        while !queue.isEmpty {

            let currentNode = queue.removeFirst()
            if currentNode != nil {

                print(currentNode!.val, terminator: ",")

                if currentNode?.left != nil {
                    queue.append(currentNode?.left)
                }

                if currentNode?.right != nil {
                    queue.append(currentNode?.right)
                }

            }else {
                print("")
                if !queue.isEmpty {
                    queue.append(nil)
                }else {
                    break
                }
            }
        }
    }

    func countNodes(_ node: TreeNode?) -> Int {
        guard node != nil else { return 0 }
        return self.countNodes(node?.left) + self.countNodes(node?.right) + 1
    }

    func sumOfNodes(_ node: TreeNode?) -> Int {
        guard node != nil else { return 0 }
        return self.sumOfNodes(node?.left) + self.sumOfNodes(node?.right) + node!.val
    }

    func maxNode(_ node: TreeNode?) -> Int {
        guard node != nil else { return Int.min }
        return max(self.maxNode(node?.left), self.maxNode(node?.right), node!.val)
    }

    func minNode(_ node: TreeNode?) -> Int {
        guard node != nil else { return Int.max }
        return min(self.minNode(node?.left), self.minNode(node?.right), node!.val)
    }

    func heightOfNode(_ node: TreeNode?) -> Int {
        guard node != nil else { return 0 }
        return max(heightOfNode(node?.left), heightOfNode(node?.right)) + 1
    }

    // O(n2)
    func diameterOfNode( _ node: TreeNode?) -> Int {
        guard node != nil else { return 0 }
        let d1 = self.diameterOfNode(node?.left)
        let d2 = self.diameterOfNode(node?.right)
        let d3 = self.heightOfNode(node?.left) + self.heightOfNode(node?.right) + 1
        return max(d1, d2, d3)
    }

    private struct TreeInfo {
        let h: Int
        let d: Int
    }

    private func treeInfoOfNode( _ node: TreeNode?) -> TreeInfo {
        guard node != nil else { return TreeInfo(h: 0, d: 0) }
        let left = treeInfoOfNode(node?.left)
        let right = treeInfoOfNode(node?.right)

        let mh = max(left.h, right.h) + 1

        let d1 = left.d
        let d2 = right.d
        let d3 = left.h + right.h
        return TreeInfo(h: mh, d: max(d1, d2, d3))
    }

    // O(n)
    func diameterOfNodeLinear( _ node: TreeNode?) -> Int {
        return self.treeInfoOfNode(node).d
    }

    func isSubTree(_ root: TreeNode?, _ subroot: TreeNode?) -> Bool {

        func isIdentical(_ root: TreeNode?, _ subroot: TreeNode?) -> Bool {
            if root == nil && subroot == nil { return true }

            if root == nil || subroot == nil { return false }

            if root?.val != subroot?.val { return false }

            return isIdentical(root?.left, subroot?.left) && isIdentical(root?.right, subroot?.right)
        }

        if subroot == nil {
            return true
        }

        if root == nil {
            return false
        }

        if root?.val == subroot?.val {
            if isIdentical(root, subroot) {
                return true
            }
        }

        return isSubTree(root?.left, subroot) || isSubTree(root?.right, subroot)
    }
}

let v = Builder().bstFromPreorder([8,5,1,7,10,12])
let t = Tree()


//print("PreOrder")
//t.preOrder(v)
//
//print("\ninOrder")
//t.inOrder(v)
//
//print("\npostOrder")
//t.postOrder(v)
//
//print("\nlevelOrder")
//t.levelOrder(v)

//t.countNodes(v)

//t.sumOfNodes(v)

//t.maxNode(v)

//t.minNode(v)

//t.heightOfNode(v)

//t.diameterOfNode(v)

//t.diameterOfNodeLinear(v)


//t.isSubTree(v, v)
