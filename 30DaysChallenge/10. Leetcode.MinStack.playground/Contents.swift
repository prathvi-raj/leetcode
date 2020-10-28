import Foundation

/*
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
  

 Example 1:

 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]

 Output
 [null,null,null,null,-3,null,0,-2]

 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
  

 Constraints:

 Methods pop, top and getMin operations will always be called on non-empty stacks.
 */

class MinStack {

    /** initialize your data structure here. */
    
    var values = [Int]()
    
    init() { }
    
    var min: Int?
    var minStack = [Int]()
    
    func push(_ x: Int) {
        
        if values.isEmpty {
            min = x
        } else {
            if x <= min! {
                minStack.append(min!)
                min = x
            }
        }
        
        values.append(x)
    }
    
    func pop() {
        if !values.isEmpty {
            
            if values.last! == min {
                
                min = nil
                
                if !minStack.isEmpty {
                    min = minStack.last
                    minStack.removeLast()
                }
                
            }
            
            values.removeLast()
        }
    }
    
    func top() -> Int {
        
        if !values.isEmpty {
            return values.last!
        } else {
            fatalError()
        }
    }
    
    func getMin() -> Int {
        if let minValue = min {
            return minValue
        } else {
            fatalError()
        }
    }
}


/*
class MinStack {

    var store: [Int] = []
    var min: Int = 0
    
        
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        
        // Push to store
        if store.isEmpty {
            min = x
            store.append(x)
        }else {
            if x < min {
                store.append(2*x - min)
                min = x
            }else {
                store.append(x)
            }
        }
    }
    
    func pop() {
        
        // Update box.
        let last = store.last!
        
        if last >= min {
            store.removeLast()
        }else {
            min = 2*min-last
            store.removeLast()
        }
    }
    
    func top() -> Int {
        let last = store.last!
        
        if last < min {
            return min
        }
        
        return last
    }
    
    func getMin() -> Int {
        return min
    }
}
 */

/*
class MinStack {

    var store: [Int] = []
    var box: [Int: [Int]] = [:]
    
//    var min: Int = Int.max
        
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        
        // Push to store
        store.append(x)
        
        // Update box
        if box[x] == nil {
            box[x] = [store.count - 1]
        }else {
            var v = box[x]!
            v.append(store.count - 1)
            box[x] = v
        }
    }
    
    func pop() {
        
        // Update box.
        let last = store.last!
        
        var v = box[last]!
        v.removeLast()
        
        if v.isEmpty {
            box.removeValue(forKey: last)
        }
        
        // Remove from store
        store.removeLast()
    }
    
    func top() -> Int {
        return store.last ?? 0
    }
    
    func getMin() -> Int {
        return store.min() ?? 0
    }
}
*/
