import Foundation

/*
 Given a string s and a non-empty string p, find all the start indices of p's anagrams in s.

 Strings consists of lowercase English letters only and the length of both strings s and p will not be larger than 20,100.

 The order of output does not matter.

 Example 1:

 Input:
 s: "cbaebabacd" p: "abc"

 Output:
 [0, 6]

 Explanation:
 The substring with start index = 0 is "cba", which is an anagram of "abc".
 The substring with start index = 6 is "bac", which is an anagram of "abc".
 Example 2:

 Input:
 s: "abab" p: "ab"

 Output:
 [0, 1, 2]

 Explanation:
 The substring with start index = 0 is "ab", which is an anagram of "ab".
 The substring with start index = 1 is "ba", which is an anagram of "ab".
 The substring with start index = 2 is "ab", which is an anagram of "ab".
 */

class Solution {

    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        /// Validate input
        if p.count > s.count {
            return []
        }
        
        var baseline = [Int](repeating: 0, count: 26)
        var current = [Int](repeating: 0, count: 26)
        
        /// convert characters into their index in latin alphabet based on their ASCII code
        let sChar = s.utf8.map { Int($0 - 97) }
        let pChar = p.utf8.map { Int($0 - 97) }
        
        /// this array contains quantities of each character in p
        for char in pChar {
            baseline[char] += 1
        }
        
        /// this array will contain quantities of all characters in a running substring of s with the length of p
        for i in 0 ..< pChar.count {
            current[sChar[i]] += 1
        }
        
        var retVal = [Int]()
        
        /// check the first substring
        if baseline == current {
            retVal.append(0)
        }
        
        /// loop through all contiguous substrings of s with the length of p
        for i in 0 ..< sChar.count - pChar.count {
            /// remove a character from the head and add a character to the tail
            current[sChar[i]] -= 1
            current[sChar[i + pChar.count]] += 1
            /// if the substrings contain the same number of each character
            /// append the starting index to the result
            if baseline == current {
                retVal.append(i + 1)
            }
        }
        
        return retVal
    }
}

/*
class Solution {
    
    func findAnagrams(_ p: String, _ s: String) -> [Int] {
        
        var result: [Int] = []
        
        guard p.count >= s.count else {
            return result
        }
        
        var store: [Character: Int] = [:]
        
        for a in s {
            store[a] = (store[a] ?? 0) + 1
        }
        
        let s2 = Array(p)
        for i in 0..<(p.count - s.count + 1) {
            if isValidPermutation2(String(s2[i...(i + s.count - 1)]), store) {
                result.append(i)
            }
        }
        return result
    }
    
    private func isValidPermutation2(_ s: String, _ store: [Character: Int]) -> Bool {
        
        var anotherStore: [Character: Int] = [:]
        
        for a in s {
            anotherStore[a] = (anotherStore[a] ?? 0) + 1
        }
        
        if store.keys.count != anotherStore.keys.count {
            return false
        }
        
        for (k,v) in store {
            
            if anotherStore[k] == nil {
                return false
            }
            
            if anotherStore[k]! != v {
                return false
            }
        }
        
        return true
    }

    
    private func isValidPermutation(_ s: String, _ store: [Character: Int]) -> Bool {
        var store = store
        for a in s {
            if store[a] == nil {
                return false
            }
            store[a] = (store[a] ?? 0) - 1
            if store[a] == 0 {
                store.removeValue(forKey: a)
            }
        }
        if store.isEmpty {
            return true
        }
        return false
    }
}
*/
Solution().findAnagrams("cbaebabacd", "abc")

