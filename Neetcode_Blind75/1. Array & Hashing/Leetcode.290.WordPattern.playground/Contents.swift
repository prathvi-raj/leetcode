import Foundation

/*

 290. Word Pattern
 Easy
 Topics
 Companies
 Given a pattern and a string s, find if s follows the same pattern.

 Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.



 Example 1:

 Input: pattern = "abba", s = "dog cat cat dog"
 Output: true
 Example 2:

 Input: pattern = "abba", s = "dog cat cat fish"
 Output: false
 Example 3:

 Input: pattern = "aaaa", s = "dog cat cat dog"
 Output: false


 Constraints:

 1 <= pattern.length <= 300
 pattern contains only lower-case English letters.
 1 <= s.length <= 3000
 s contains only lowercase English letters and spaces ' '.
 s does not contain any leading or trailing spaces.
 All the words in s are separated by a single space.

 */

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var parts = s.components(separatedBy: " ")
        var pattern = Array(pattern)
        guard parts.count == pattern.count else { return false }
        var p_map = [Character: String]()
        var s_map = [String: Character]()

        for i in 0..<pattern.count {
            if let existing = p_map[pattern[i]] {
                if existing == parts[i] {
                    continue
                } else {
                    return false
                }
            } else {
                if s_map[parts[i]] != nil {
                    return false
                } else {
                    p_map[pattern[i]] = parts[i]
                    s_map[parts[i]] = pattern[i]
                }
            }
        }

        return true
    }
}
