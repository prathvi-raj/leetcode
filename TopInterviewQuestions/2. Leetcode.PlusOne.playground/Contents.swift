import Foundation

/*
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.

 Example 1:

 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:

 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digitsVar = digits
        
        for i in 0..<digitsVar.count {
            print(digitsVar)
            let j = digitsVar.count - i - 1
            if digitsVar[j] + 1 < 10 {
                digitsVar[j] += 1
                return digitsVar
            } else {
                digitsVar[j] = 0
            }
        }
        
        return [1] + digitsVar
    }
}

/*
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result: [Int] = digits
        let last: Int = result.last!
        if last != 9 {
            result[result.count - 1] = last + 1
            return result
        }
        
        var carry: Int = 1
        var index: Int = result.count - 1
        
        while carry != 0  && index >= 0 {
            if result[index] != 9 {
                result[index] = result[index] + carry
                carry = 0
                break
            }else {
                result[index] = 0
                index -= 1
                carry = 1
            }
        }
        
        if index == -1 {
            result.insert(1, at: 0)
        }
        
        return result
    }
}
*/

Solution().plusOne([1, 9, 9])


//print([1] + [1, 2, 3])
