import Foundation

/*

 917. Reverse Only Letters
 Easy
 Topics
 Companies
 Hint
 Given a string s, reverse the string according to the following rules:

 All the characters that are not English letters remain in the same position.
 All the English letters (lowercase or uppercase) should be reversed.
 Return s after reversing it.



 Example 1:

 Input: s = "ab-cd"
 Output: "dc-ba"
 Example 2:

 Input: s = "a-bC-dEf-ghIj"
 Output: "j-Ih-gfE-dCba"
 Example 3:

 Input: s = "Test1ng-Leet=code-Q!"
 Output: "Qedo1ct-eeLg=ntse-T!"


 Constraints:

 1 <= s.length <= 100
 s consists of characters with ASCII values in the range [33, 122].
 s does not contain '\"' or '\\'.

 */


class Solution {
    func reverseOnlyLetters(_ s: String) -> String {
        var s =  Array(s)

        var l: Int = 0
        var r: Int = s.count - 1

        while l < r {

            if s[l].isEnglishChar && s[r].isEnglishChar {
                s.swapAt(l, r)
                l += 1
                r -= 1
            } else if s[l].isEnglishChar && !s[r].isEnglishChar {
                r -= 1
            } else if !s[l].isEnglishChar && s[r].isEnglishChar {
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

    var isEnglishChar: Bool {
        let chars = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        return self.unicodeScalars.allSatisfy(chars.contains(_:))
    }
}


print(Solution().reverseOnlyLetters("ab-cd"))
print(Solution().reverseOnlyLetters("a-bC-dEf-ghIj"))
print(Solution().reverseOnlyLetters("Test1ng-Leet=code-Q!"))
