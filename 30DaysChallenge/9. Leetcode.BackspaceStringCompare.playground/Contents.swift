import Foundation

/*
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 Note that after backspacing an empty text, the text will continue empty.

 Example 1:

 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 Example 2:

 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 Example 3:

 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 Example 4:

 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 */

class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let s = sanitize(S)
        let t = sanitize(T)
        return s == t
    }
    
    private func sanitize(_ str: String) -> String {
        var res = [Character]()
        for char in str {
            if char == "#" {
                res.popLast()
            } else {
                res.append(char)
            }
        }
        
        return String(res)
    }
}

/*
class Solution {
    class func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var sA = Array(S)
        var tA = Array(T)
        
        var c: Int = 0
        
        while c < sA.count {
            if sA[c] == Character("#") {
                sA.remove(at: c)
                sA.remove(at: c-1)
                c -= 1
            }else {
                c += 1
            }
        }
        
        c = 0
        
        while c < tA.count {
            if tA[c] == Character("#") {
                tA.remove(at: c)
                tA.remove(at: c-1)
                c -= 1
            }else {
                c += 1
            }
        }
        
        if String(sA) == String(tA) {
            return true
        }
        
        return false
    }
}
*/

Solution().backspaceCompare("ab#c", "ad#c")
Solution().backspaceCompare("ab##", "c#d#")
Solution().backspaceCompare("a#c", "b")
