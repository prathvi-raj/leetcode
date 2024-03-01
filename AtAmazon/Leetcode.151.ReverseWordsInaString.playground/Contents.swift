import Foundation

/*
 151. Reverse Words in a String
 Medium
 5.1K
 4.4K
 Companies
 Given an input string s, reverse the order of the words.

 A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

 Return a string of the words in reverse order concatenated by a single space.

 Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.



 Example 1:

 Input: s = "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: s = "  hello world  "
 Output: "world hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: s = "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.


 Constraints:

 1 <= s.length <= 104
 s contains English letters (upper-case and lower-case), digits, and spaces ' '.
 There is at least one word in s.


 Follow-up: If the string data type is mutable in your language, can you solve it in-place with O(1) extra space?
 */

class Solution1 {
    func reverseWords(_ s: String) -> String {
        let s = Array(s)
        var words = [String]()
        var wordStart = -1
        for (index, ch) in s.enumerated() {
            if ch != " " && wordStart == -1 {
                wordStart = index
            } else if ch == " " && wordStart != -1 {
                words.append(String(s[wordStart..<index]))
                wordStart = -1
            }
        }
        if wordStart != -1 {
            words.append(String(s[wordStart..<s.count]))
        }
        return stride(from: words.count-1, through:0, by: -1)
            .reduce("") { $0 + ($0.isEmpty ? $0 : " ") + words[$1] }
    }
}

class Solution2 {
    func reverseWords(_ str: String) -> String {
        var result : String = "" // mutable result string
        var word : String = "" // temp string to keep word

        for c in str.reversed() { // BTW, Apple promises O(1) complexity for reverse() method
            // check if we meet a space or just another character
            if c == " " {
                // if we've already joined the last word to the result string and met the space symbol once again
                if word.isEmpty {
                   continue
                }
                // add the word to the string
                joinWordToString(&word, &result)
                // clear the word buffer
                word = ""
            } else {
                // simply add one another character to the word buffer in reverse order to have a correct string
                word = [c] + word;
            }
        }

        // if the loop has finished, but we have some word in the buffer
        if !word.isEmpty {
            joinWordToString(&word, &result)
        }

        return result
    }

    /**
    *   Add a word to the string along with a space symbol if needed
    */
    private func joinWordToString(_ word : inout String, _ str : inout String) {
        if !str.isEmpty {
           str += " "
        }
        str += word
    }
}



class Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
}


print(Solution1().reverseWords("the sky is blue"))
