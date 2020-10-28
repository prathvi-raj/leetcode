// https://leetcode.com/explore/learn/card/linked-list/209/singly-linked-list/1290/

/*
 Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
 A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
 If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

 Implement the MyLinkedList class:

 MyLinkedList() Initializes the MyLinkedList object.
 int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
 void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 void addAtTail(int val) Append a node of value val as the last element of the linked list.
 void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
 void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class MyLinkedList {

    var head: ListNode? = nil
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        guard let node = node(at: index) else {
            return -1
        }
        return node.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        ListNode(val)
        let newNode = ListNode(val)
        newNode.next = head
        head = newNode
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        guard head != nil else {
            head = ListNode(val)
            return
        }
        var node = head
        while node?.next != nil {
            node = node?.next
        }
        node?.next = ListNode(val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index <= 0 {
            addAtHead(val)
            return
        }
        guard let prevNode = node(at: index - 1) else {
            return
        }
        let newNode = ListNode(val)
        newNode.next = prevNode.next
        prevNode.next = newNode
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index == 0, head != nil {
            head = head?.next
            return
        }
        guard let prevNode = node(at: index - 1) else {
            return
        }
        prevNode.next = prevNode.next?.next
    }
    
    // helper methods
    private func node(at: Int) -> ListNode? {
        guard at > -1, var node = head else {
            return nil
        }
        guard at > 0 else {
            return head
        }
        for _ in 1...at {
            guard let nextNode = node.next else {
                return nil
            }
            node = nextNode
        }
        return node
    }

    func deleteHead() {
        head = head?.next
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
