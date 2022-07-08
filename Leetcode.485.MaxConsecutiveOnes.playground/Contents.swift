import Foundation

/*
 Given a binary array nums, return the maximum number of consecutive 1's in the array.



 Example 1:

 Input: nums = [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
 Example 2:

 Input: nums = [1,0,1,1,0,1]
 Output: 2


 Constraints:

 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 */


//class A: NSObject {
//    let a: Int
//
//    init(v: Int) {
//        a = v
//        super.init()
//    }
//
//    func output() {
//        print(a)
//    }
//}
//
//A(v: 2).output()

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var gMax: Int = 0
        var lMax: Int = 0

        for i in 0..<nums.count {
            lMax = nums[i] == 1 ? lMax + 1 : 0
            gMax = max(gMax, lMax)
        }
        return gMax
    }
    func findMaxConsecutiveOnesWithOneFlip(_ nums: [Int]) -> Int {
        var dp1: [Int] = []
        var dp2: [Int] = []

        var ans = 0

        for i in 0..<nums.count {
            print(i)
            if nums[i] == 1 {
                dp1.append(i >= 1 ? dp1[i - 1] + 1 : 1)
                dp2.append(i >= 1 ? dp2[i - 1] + 1 : 1)
            }else {
                dp1.append(0)
                dp2.append(i >= 1 ? dp1[i - 1] + 1 : 1)
            }
            print(dp1)
            print(dp2)
            ans = max(ans, dp2[i])
        }
        return ans
    }

    func findMaxConsecutiveOnesWithOneFlip2(_ nums: [Int]) -> Int {
        var res = 0, cur = 0, cnt = 0
        for i in 0..<nums.count {
            cnt += 1
            if (nums[i] == 0) {
                cur = cnt
                cnt = 0
            }
            res = max(res, cnt + cur);
        }
        return res
    }
}


print(Solution().findMaxConsecutiveOnes([1,1,0,1,1,0,1,1,0,1,1,1,0]))
print(Solution().findMaxConsecutiveOnesWithOneFlip2([1,1,0,1,1,0,1,1,0,1,1,1,0]))


