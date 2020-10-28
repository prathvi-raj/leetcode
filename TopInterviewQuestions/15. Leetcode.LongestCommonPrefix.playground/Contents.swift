import Foundation

/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

 Input: ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 Note:

 All given inputs are in lowercase letters a-z.
 
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        guard let first = strs.first, first.count > 0 else {
            return ""
        }
        
        var prefix: [Character] = Array(first)
        var index: Int = 1
        while index < strs.count {
            prefix = prefixIn(prefix, Array(strs[index]))
            if prefix.isEmpty {
                return ""
            }
            index += 1
        }
        return String(prefix)
    }
    
    func prefixIn(_ a: [Character], _ b: [Character]) -> [Character] {
        
        if a.isEmpty || b.isEmpty {
            return []
        }
        
        var result: [Character] = []
        for i in 0..<min(a.count, b.count) {
            if a[i] == b[i] {
                result.append(a[i])
            }else {
                return result
            }
        }
        return result
    }
}

Solution().longestCommonPrefix(["dog","racecar","car"])

//Solution().longestCommonPrefix(["flower","flow","flight"])
