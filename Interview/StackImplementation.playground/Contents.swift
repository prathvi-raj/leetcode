import Foundation

public struct Stack<T> {

  /// Datastructure consisting of a generic item.
  fileprivate var array = [T]()

  /// The number of items in the stack.
  public var count: Int {
    return array.count
  }

  /// Verifies if the stack is empty.
  public var isEmpty: Bool {
    return array.isEmpty
  }

  /**
     Pushes an item to the top of the stack.

     - Parameter element: The item being pushed.
  */
  public mutating func push(_ element: T) {
    array.append(element)
  }

  /**
     Removes and returns the item at the top of the stack.

     - Returns: The item at the top of the stack.
  */
  public mutating func pop() -> T? {
    return array.popLast()
  }

  /// Returns the item at the top of the stack.
  public var top: T? {
    return array.last
  }
}


/*
 20. Valid Parentheses
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.


 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false


 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */


class Solution20 {


    public struct Stack<T> {

      /// Datastructure consisting of a generic item.
      fileprivate var array = [T]()

      /// The number of items in the stack.
      public var count: Int {
        return array.count
      }

      /// Verifies if the stack is empty.
      public var isEmpty: Bool {
        return array.isEmpty
      }

      /**
         Pushes an item to the top of the stack.

         - Parameter element: The item being pushed.
      */
      public mutating func push(_ element: T) {
        array.append(element)
      }

      /**
         Removes and returns the item at the top of the stack.

         - Returns: The item at the top of the stack.
      */
      public mutating func pop() -> T? {
        return array.popLast()
      }

      /// Returns the item at the top of the stack.
      public var top: T? {
        return array.last
      }
    }


    enum StackOperation {
        case push
        case pop
    }

    func isValid(_ s: String) -> Bool {
        var stack = Stack<Character>()
        for c in s {
            switch self.stackOperationForCharacter(c) {
            case .push:
                stack.push(c)
            case .pop:
                if stack.pop() != self.oppositeCharacterOf(c) {
                    return false
                }
            default: continue
            }
        }

        return stack.isEmpty
    }

    func stackOperationForCharacter(_ charatcter: Character) -> StackOperation? {
        switch charatcter {
        case Character("("), Character("{"), Character("["):
            return .push
        case Character(")"), Character("}"), Character("]"):
            return .pop
        default: return nil
        }
    }

    private func oppositeCharacterOf(_ character: Character) -> Character? {
        switch character {
        case Character(")"): return Character("(")
        case Character("}"): return Character("{")
        case Character("]"): return Character("[")
        default: return nil
        }
    }
}

//print(Solution().isValid("()[]{}"))
//print(Solution().isValid("()}"))

/*
 22. Generate Parentheses
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]
 */

class Solution22 {
    public func generateParenthesis(n:Int) -> [String] {
        var result = [String]()
        if (n == 0)
        {
            return result
        }
        helper(res: &result, current: "", open: n, close: n)
        return result
    }

    func helper(res: inout [String], current: String, open: Int, close: Int) {
        if (close == 0) {
            res.append(current)
        }

        if (open > 0) {
            helper(res: &res, current: current + "(", open: open - 1, close: close)
        }

        if (close > open) {
            helper(res: &res, current: current + ")", open: open, close: close - 1)
        }
    }

}


/*
 2116. Check if a Parentheses String Can Be Valid

 A parentheses string is a non-empty string consisting only of '(' and ')'. It is valid if any of the following conditions is true:

 It is ().
 It can be written as AB (A concatenated with B), where A and B are valid parentheses strings.
 It can be written as (A), where A is a valid parentheses string.
 You are given a parentheses string s and a string locked, both of length n. locked is a binary string consisting only of '0's and '1's. For each index i of locked,

 If locked[i] is '1', you cannot change s[i].
 But if locked[i] is '0', you can change s[i] to either '(' or ')'.
 Return true if you can make s a valid parentheses string. Otherwise, return false.



 Example 1:


 Input: s = "))()))", locked = "010100"
 Output: true
 Explanation: locked[1] == '1' and locked[3] == '1', so we cannot change s[1] or s[3].
 We change s[0] and s[4] to '(' while leaving s[2] and s[5] unchanged to make s valid.
 Example 2:

 Input: s = "()()", locked = "0000"
 Output: true
 Explanation: We do not need to make any changes because s is already valid.
 Example 3:

 Input: s = ")", locked = "0"
 Output: false
 Explanation: locked permits us to change s[0].
 Changing s[0] to either '(' or ')' will not make s valid.


 Constraints:

 n == s.length == locked.length
 1 <= n <= 105
 s[i] is either '(' or ')'.
 locked[i] is either '0' or '1'.

 */



class Solution2116 {


    public struct Stack<T> {

      /// Datastructure consisting of a generic item.
      fileprivate var array = [T]()

      /// The number of items in the stack.
      public var count: Int {
        return array.count
      }

      /// Verifies if the stack is empty.
      public var isEmpty: Bool {
        return array.isEmpty
      }

      /**
         Pushes an item to the top of the stack.

         - Parameter element: The item being pushed.
      */
      public mutating func push(_ element: T) {
        array.append(element)
      }

      /**
         Removes and returns the item at the top of the stack.

         - Returns: The item at the top of the stack.
      */
      public mutating func pop() -> T? {
        return array.popLast()
      }

      /// Returns the item at the top of the stack.
      public var top: T? {
        return array.last
      }
    }


    enum StackOperation {
        case push
        case pop
    }

    func canBeValid(_ s: String, _ locked: String) -> Bool {
        var stack = Stack<Character>()
        for (i, c) in s.enumerated() {
            switch self.stackOperationForCharacter(c) {
            case .push:
                stack.push(c)
            case .pop:
                if stack.pop() != self.oppositeCharacterOf(c) {
                    return false
                }
            default: continue
            }
        }

        return stack.isEmpty
    }

    func stackOperationForCharacter(_ charatcter: Character) -> StackOperation? {
        switch charatcter {
        case Character("("), Character("{"), Character("["):
            return .push
        case Character(")"), Character("}"), Character("]"):
            return .pop
        default: return nil
        }
    }

    private func oppositeCharacterOf(_ character: Character) -> Character? {
        switch character {
        case Character(")"): return Character("(")
        case Character("}"): return Character("{")
        case Character("]"): return Character("[")
        default: return nil
        }
    }
}


/*
 394. Decode String
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].

 The test cases are generated so that the length of the output will never exceed 105.



 Example 1:

 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:

 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:

 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
 abcabccdcdcdef

 Constraints:

 1 <= s.length <= 30
 s consists of lowercase English letters, digits, and square brackets '[]'.
 s is guaranteed to be a valid input.
 All the integers in s are in the range [1, 300].
 */


class Solution394 {

    public struct Stack<T> {

        /// Datastructure consisting of a generic item.
        fileprivate var array = [T]()

        /// The number of items in the stack.
        public var count: Int {
            return array.count
        }

        /// Verifies if the stack is empty.
        public var isEmpty: Bool {
            return array.isEmpty
        }

        /**
         Pushes an item to the top of the stack.

         - Parameter element: The item being pushed.
         */
        public mutating func push(_ element: T) {
            array.append(element)
        }

        /**
         Removes and returns the item at the top of the stack.

         - Returns: The item at the top of the stack.
         */
        public mutating func pop() -> T? {
            return array.popLast()
        }

        /// Returns the item at the top of the stack.
        public var top: T? {
            return array.last
        }
    }

    func decodeString(_ s: String) -> String {
        var stack = Stack<Character>()
        for c in s {
            var res = ""
            if c == Character("]") {
                while stack.top != Character("[") {
                    if let p = stack.top {
                        if Int(String(p)) != nil, let n = self.getNumberFromStack(&stack) {
                            res = String(repeating: res, count: n)
                        }else {
                            res = String(p)+res
                            stack.pop()
                        }
                    }
                }
                stack.pop()
                if let p = stack.top, Int(String(p)) != nil, let n = self.getNumberFromStack(&stack) {
                    res = String(repeating: res, count: n)
                }
                stack.array.append(contentsOf: Array(res))
            } else {
                stack.push(c)
            }
            print(stack.array)
        }

        var res = ""
        while !stack.isEmpty {
            if let p = stack.pop() {
                if let n = Int(String(p)) {
                    res = String(repeating: res, count: n)
                }else {
                    res = String(p)+res
                }
            }
        }

        return res
    }

    private func getNumberFromStack(_ stack: inout Stack<Character>) -> Int? {
        var res = ""
        while stack.top != nil, Int(String(stack.top!)) != nil {
            res = String(stack.pop()!) + res
        }
        return Int(res)
    }
}

//print(Solution394().decodeString("2[abc]3[cd]ef"))
//print(Solution394().decodeString("20[abc]"))
print(Solution394().decodeString("3[a]2[bc]"))

