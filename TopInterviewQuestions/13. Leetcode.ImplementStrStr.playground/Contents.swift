import Foundation

/*
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 */

class Solution {
    // 20 ms
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        guard haystack.count >= needle.count else { return -1 }
        
        let distance = haystack.count - needle.count
        for i in 0...distance {
            let start = haystack.index(haystack.startIndex, offsetBy: i)
            let end = haystack.index(haystack.startIndex, offsetBy: i+needle.count)
            
            if haystack[start..<end] == needle {
                return start.encodedOffset
            }
        }
        return -1
    }
}

/*
 
 class Solution {
     func strStr(_ haystack: String, _ needle: String) -> Int {
         if needle.isEmpty {
             return 0
         }
         
         if haystack.isEmpty {
             return -1
         }
         
         let s = Array(haystack)
         
         for i in 0..<s.count {
             if (i + needle.count - 1) < s.count {
                 if String(s[i..<(i + needle.count)]) == needle {
                     return i
                 }
             }
         }
         
         return -1
     }
 }
 
 */

Solution().strStr("hello", "ll")
