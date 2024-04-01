import Foundation

/*

 345. Reverse Vowels of a String
 Easy
 Topics
 Companies
 Given a string s, reverse only all the vowels in the string and return it.

 The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.



 Example 1:

 Input: s = "hello"
 Output: "holle"
 Example 2:

 Input: s = "leetcode"
 Output: "leotcede"


 Constraints:

 1 <= s.length <= 3 * 105
 s consist of printable ASCII characters.

 */


class Solution {
    func reverseVowels(_ s: String) -> String {
        var s =  Array(s)

        var l: Int = 0
        var r: Int = s.count - 1

        while l < r {

            if s[l].isVowel && s[r].isVowel {
                s.swapAt(l, r)
                l += 1
                r -= 1
            } else if s[l].isVowel && !s[r].isVowel {
                r -= 1
            } else if !s[l].isVowel && s[r].isVowel {
                l += 1
            } else {
                l += 1
                r -= 1
            }
        }

        return String(s)
    }
}

extension Character {

    var isVowel: Bool {
        switch String(self.lowercased()) {
        case "a", "e", "i", "o", "u" :
            return true
        default:
            return false
        }
    }
}


