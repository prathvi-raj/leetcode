import Foundation

/*
 Valid Anagram
 Solution
 Given two strings s and t , write a function to determine if t is an anagram of s.

 Example 1:

 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:

 Input: s = "rat", t = "car"
 Output: false
 Note:
 You may assume the string contains only lowercase alphabets.

 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 */


class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var store: [Character: Int] = [:]
        for a in s {
            store[a] =  (store[a] ?? 0) + 1
        }
        for b in t {
            if let c = store[b], c > 0 {
                store[b] = c - 1
                if c == 1 {
                    store.removeValue(forKey: b)
                }
            }else {
                return false
            }
        }
        
        if !store.isEmpty {
            return false
        }
        
        return true
    }
}

Solution().isAnagram("anagram", "nagaram")
