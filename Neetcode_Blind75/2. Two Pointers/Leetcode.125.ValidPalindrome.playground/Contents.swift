import Foundation

/*

 125. Valid Palindrome
 Solved
 Easy
 Topics
 Companies
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.



 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:

 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.


 Constraints:

 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.

 */


class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        
        let q = Array(s.lowercased().components(separatedBy: CharacterSet.alphanumerics.inverted).joined())

        var l: Int = 0
        var r: Int = q.count - 1

        while l <= r {
            if q[l] != q[r] { return false  }
            l += 1
            r -= 1
        }
        return true
    }
}


print(Solution().isPalindrome("A man, a plan, a canal: Panama"))
print(Solution().isPalindrome("race a car"))

