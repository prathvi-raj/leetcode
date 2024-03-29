import Foundation

/*
 Given a string s, find the length of the longest substring without repeating characters.

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */


class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
      guard s.count > 1 else { return s.count }
      let string = Array(s)
      var maxArray: Int = 1
      var charMap: [Character: Int] = [string[0]: 1]
      var i: Int = 1
      while i < string.count {

        if let lastIndex = charMap[string[i]] {
          maxArray.append(maxArray[i-1] + 1)
          i = lastIndex
        } else {
          charMap.removeAll()
          maxArray.append(1)
          charMap[string[i]] = i

          i += 1
        }

      }
      return maxArray.max() ?? 0
    }
}

print(Solution().lengthOfLongestSubstring("dvdf"))
print(Solution().lengthOfLongestSubstring("abcabcbb"))

