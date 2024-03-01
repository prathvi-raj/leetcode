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

        let s = Array(s)
        var result = 0
        var map: [Character: Int] = [:]
        var right = 0
        var left = 0

        let k = 3

        while right < s.count {
            if let index = map[s[right]] {
                left = left > index ? left : index + 1
            }

            map[s[right]] = right

            if (right-left+1) == k {
                result += 1
                left += 1
            }

            right += 1
        }

        return result
    }
}

class Solution3 {
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

class Solution1 {
    func countGoodSubstrings(_ s: String) -> Int {

        var left: Int = 0
        var right: Int = 0

        var map: Set<Character> = []

        var result: Int = 0
        let s = Array(s)
        while right < s.count {

            if !map.contains(s[right]) {
                if map.count == 3 {
                    result += 1
                    map.remove(s[left])
                    left += 1
                }
                map.insert(s[right])
                right += 1
            }else {

                if map.count == 3 {
                    result += 1
                }

                map.remove(s[left])
                left += 1
            }
        }
        return result
    }
}


class Solution2 {
    func countGoodSubstrings(_ s: String) -> Int {
        var s = Array(s)
        var res = 0

        if s.count < 3 {
            return res
        }

        for i in 0...s.count - 3 {
            if Set(s[i..<i + 3]).count == 3 {
                res += 1
            }
        }

        return res
    }
}

print(Solution().countGoodSubstrings("aababcabc"))
