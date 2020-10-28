import Foundation

/*
 Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

 Note:
 The length of num is less than 10002 and will be ≥ k.
 The given num does not contain any leading zero.
 Example 1:

 Input: num = "1432219", k = 3
 Output: "1219"
 Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
 Example 2:

 Input: num = "10200", k = 1
 Output: "200"
 Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
 Example 3:

 Input: num = "10", k = 2
 Output: "0"
 Explanation: Remove all the digits from the number and it is left with nothing which is 0.
 */

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k >= num.count || num.count < 1 { return "0" }
        let chars = Array(num)
        var stackChar = [chars[0]], l = k, i = 1
        while i < chars.count {
            if l > 0, let v = stackChar.last, v > chars[i] {
                stackChar.popLast(); l -= 1
            } else {
                stackChar.append(chars[i]); i += 1
            }
        }
        for _ in 0..<l { stackChar.popLast() }
        while let c = stackChar.first, c == "0" {
            stackChar.removeFirst()
        }
        if stackChar.isEmpty { stackChar.append("0") }
        return String(stackChar)
    }
}

/*
class Solution {
    
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let array = Array(num)
        var data = Array(num)
        var p = k
        
        if k == num.count {
            return "0"
        }
        
        var i: Int = 0
        
        while Int(String(data[i]))! > Int(String(data[i+1]))! || i+1 < data.count {
            print(data)
            if Int(String(data[i]))! > Int(String(data[i+1]))! {
                print("Remove: \(data[i-k+p])")
                data.remove(at: i - (k - p))
                p -= 1
                if p == 0 {
                    break
                }
            }else {
                if i == data.count- {
                    print("Remove: \(data[i + 2 - k + p])")
                    data.remove(at: i + 2 - (k - p))
                    p -= 1
                    if p == 0 {
                        break
                    }
                }
            }
            i += 1
            if !(i < data.count - 1) && k != 0 {
                i = 0
            }
        }
        
        print(data)
        
        while true {
            if Int(String(data[0]))! != 0 {
                break
            }else {
                data.remove(at: 0)
                if data.isEmpty {
                    break
                }
            }
        }
        
        if data.isEmpty {
            return "0"
        }
        
        return String(data)
    }
}
*/

print(Solution().removeKdigits("1173", 2))
