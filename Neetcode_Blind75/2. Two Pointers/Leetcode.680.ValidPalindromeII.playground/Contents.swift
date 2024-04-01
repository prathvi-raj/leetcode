import Foundation

/*

 680. Valid Palindrome II
 Easy
 Topics
 Companies
 Given a string s, return true if the s can be palindrome after deleting at most one character from it.



 Example 1:

 Input: s = "aba"
 Output: true
 Example 2:

 Input: s = "abca"
 Output: true
 Explanation: You could delete the character 'c'.
 Example 3:

 Input: s = "abc"
 Output: false


 Constraints:

 1 <= s.length <= 105
 s consists of lowercase English letters.

 */

class Solution {
    func validPalindrome(_ s: String) -> Bool {
        let s = Array(s)

        var l = 0
        var r = s.count - 1
        while l < r && s[l] == s[r] {
            l += 1
            r -= 1
        }

        // No deletion needed.
        if l >= r { return true }

        func checkValid(_ l: Int, _ r: Int) -> Bool {
            var l = l
            var r = r
            while l < r && s[l] == s[r] {
                l += 1
                r -= 1
            }
            return l >= r
        }

        return checkValid(l + 1, r) || checkValid(l, r - 1)
    }
}

