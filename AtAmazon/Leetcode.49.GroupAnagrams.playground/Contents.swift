import Foundation

/*
 49. Group Anagrams
 Medium
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.



 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 Example 2:

 Input: strs = [""]
 Output: [[""]]
 Example 3:

 Input: strs = ["a"]
 Output: [["a"]]


 Constraints:

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] consists of lowercase English letters.
 */


class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var values = [String: [String]]()
        for str in strs {
            values[String(str.sorted()), default: []].append(str)
        }

        print(values)

        var result = [[String]]()
        for (_, value) in values {
            result.append(value)
        }
        return result
    }
}

print(Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"]))

