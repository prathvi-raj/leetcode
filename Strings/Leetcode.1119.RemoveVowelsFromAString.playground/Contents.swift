import Foundation

/*
 Given a string S, remove the vowels ‘a’, ‘e’, ‘i’, ‘o’, and ‘u’ from it, and return the new string.

 Example 1:

 Input: "leetcodeisacommunityforcoders"
 Output: "ltcdscmmntyfrcdrs"
 Example 2:

 Input: "aeiou"
 Output: ""
 Note:

 S consists of lowercase English letters only.
 1 <= S.length <= 100
 */


class Solution {

  /// Using an array
  func removeVowelsFromString1(_ string: String) -> String {
    var result: String = ""
    let vowels = "aeiou"
    for i in string {
      if !vowels.contains(i) {
        result += String(i)
      }
    }
    return result
  }

  /// Using Hash map
  func removeVowelsFromString(_ string: String) -> String {
    var result: String = ""
    let vowels: [Character: Bool] = ["a": true, "e": true, "i": true, "o": true, "u": true]
    for i in string {
      if !(vowels[i] ?? false) {
        result += String(i)
      }
    }
    return result
  }


}

print(Solution().removeVowelsFromString("leetcodeisacommunityforcoders") == "ltcdscmmntyfrcdrs")
