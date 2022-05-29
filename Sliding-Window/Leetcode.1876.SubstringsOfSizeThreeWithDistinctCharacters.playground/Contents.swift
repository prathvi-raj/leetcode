import Foundation

/*
 1876. Substrings of Size Three with Distinct Characters
 A string is good if there are no repeated characters.

 Given a string s​​​​​, return the number of good substrings of length three in s​​​​​​.

 Note that if there are multiple occurrences of the same substring, every occurrence should be counted.

 A substring is a contiguous sequence of characters in a string.



 Example 1:

 Input: s = "xyzzaz"
 Output: 1
 Explanation: There are 4 substrings of size 3: "xyz", "yzz", "zza", and "zaz".
 The only good substring of length 3 is "xyz".
 Example 2:

 Input: s = "aababcabc"
 Output: 4
 Explanation: There are 7 substrings of size 3: "aab", "aba", "bab", "abc", "bca", "cab", and "abc".
 The good substrings are "abc", "bca", "cab", and "abc".


 Constraints:

 1 <= s.length <= 100
 s​​​​​​ consists of lowercase English letters.
 */


class Solution {
  func countGoodSubstrings(_ s: String) -> Int {
    let k = 2
    let string = Array(s)
    guard string.count >= k+1 else { return 0 }
    var result: Int = 0
    for i in 0..<string.count-k {
      result += self.isDistinct(Array(string[i...i+k])) ? 1 : 0
    }
    return result
  }

  private func isDistinct(_ string: [Character]) -> Bool {
    var map: [Character: Bool] = [:]
    for a in string {
      if map[a] != nil {
        return false
      }
      map[a] = true
    }
    return true
  }
}


//print(Solution().hasDistinctCharactersInString("abc"))
print(Solution().countGoodSubstrings("aababcabc"))
