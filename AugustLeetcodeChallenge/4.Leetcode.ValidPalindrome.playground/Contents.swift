import Foundation

/*
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

 Note: For the purpose of this problem, we define empty string as valid palindrome.

 Example 1:

 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:

 Input: "race a car"
 Output: false
  

 Constraints:

 s consists only of printable ASCII characters.
 */

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.count <= 1 {
            return true
        }
        
        let store: [Character] = Array( s.lowercased().filter { $0.isLetter || $0.isNumber })
        var l: Int = 0
        var h: Int = store.count - 1
        
        while l < h {
            if store[l] != store[h] {
                return false
            }
            l += 1
            h -= 1
        }
        
        return true
    }
}
