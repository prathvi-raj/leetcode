import Foundation

/*
 1763. Longest Nice Substring
 A string s is nice if, for every letter of the alphabet that s contains, it appears both in uppercase and lowercase. For example, "abABB" is nice because 'A' and 'a' appear, and 'B' and 'b' appear. However, "abA" is not because 'b' appears, but 'B' does not.

 Given a string s, return the longest substring of s that is nice. If there are multiple, return the substring of the earliest occurrence. If there are none, return an empty string.



 Example 1:

 Input: s = "YazaAay"
 Output: "aAa"
 Explanation: "aAa" is a nice string because 'A/a' is the only letter of the alphabet in s, and both 'A' and 'a' appear.
 "aAa" is the longest nice substring.
 Example 2:

 Input: s = "Bb"
 Output: "Bb"
 Explanation: "Bb" is a nice string because both 'B' and 'b' appear. The whole string is a substring.
 Example 3:

 Input: s = "c"
 Output: ""
 Explanation: There are no nice substrings.


 Constraints:

 1 <= s.length <= 100
 s consists of uppercase and lowercase English letters.
 */


class Solution {
    func longestNiceSubstring(_ s: String) -> String {
      return ""
    }

  private func isNiceString(_ str: String) -> Bool {
      return Double(Set(str.lowercased()).count) == (Double(Set(str).count) / 2.0)
  }
}

//class Solution1 {
//  func countGoodSubstrings(_ s: String) -> Int {
//    let k = 2
//    let string = Array(s)
//    guard string.count >= k+1 else { return 0 }
//    var result: Int = 0
//    for i in 0..<string.count-k {
//      result += self.isDistinct(Array(string[i...i+k])) ? 1 : 0
//    }
//    return result
//  }
//
//  private func isDistinct(_ string: [Character]) -> Bool {
//    var map: [Character: Bool] = [:]
//    for a in string {
//      if map[a] != nil {
//        return false
//      }
//      map[a] = true
//    }
//    return true
//  }
//}
