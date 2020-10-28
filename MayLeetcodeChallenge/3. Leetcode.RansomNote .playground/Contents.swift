import Foundation

/*
 Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.

 Each letter in the magazine string can only be used once in your ransom note.

 Note:
 You may assume that both strings contain only lowercase letters.

 canConstruct("a", "b") -> false
 canConstruct("aa", "ab") -> false
 canConstruct("aa", "aab") -> true
 */

class Solution {
    
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var magazine = magazine
        
        for r in ransomNote {
            if let f = magazine.firstIndex(of: r) {
                magazine.remove(at: f)
            }else {
                return false
            }
        }
        return true
    }
}

/*
class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var store: [Int] = Array(repeating: 0, count: 26)
        
        for m in magazine {
            store[Int((m.asciiValue! - 97))] += 1
        }
        
        for r in ransomNote {
            
            if store[Int((r.asciiValue! - 97))] == 0 {
                return false
            }
            
            store[Int((r.asciiValue! - 97))] -= 1
        }
        
        return true
    }
}
*/

/*
class Solution {
    
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        var store: [Character: Int] = [:]
        
        for m in magazine {
            store[m] = (store[m] ?? 0) + 1
        }
        
        for r in ransomNote {
            if let v = store[r], v > 0 {
                store[r] = v - 1
            }else {
                return false
            }
        }
        
        return true
    }
}
*/
