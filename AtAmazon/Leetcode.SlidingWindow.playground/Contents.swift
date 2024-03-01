import Foundation

/*
 3. Longest Substring Without Repeating Characters

 Given a string s, find the length of the longest substring without repeating characters.



 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }

        var map: [Character: Int] = [:]
        var left: Int = 0
        var right: Int = 0

        var result: Int = 0

        let s = Array(s)

        while right < s.count {
            print(map, left, right)
            if let index = map[s[right]] {
                left = max(index + 1, left )
            }
            map[s[right]] = right
            result = max(result, right - left + 1)
            right += 1
        }
        return result
    }
}

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

class Solution1876 {
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


/*
 643. Maximum Average Subarray I
 You are given an integer array nums consisting of n elements, and an integer k.

 Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10-5 will be accepted.



 Example 1:

 Input: nums = [1,12,-5,-6,50,3], k = 4
 Output: 12.75000
 Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75
 Example 2:

 Input: nums = [5], k = 1
 Output: 5.00000


 Constraints:

 n == nums.length
 1 <= k <= n <= 105
 -104 <= nums[i] <= 104
 */

class Solution643 {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var left: Int = 0
        var right: Int = 0

        var result: Double = -Double.greatestFiniteMagnitude

        while right < nums.count {
            if right - left + 1 == k {
                let subArray: [Int] = Array(nums[left...right])
                result = max(result, Double(subArray.reduce(0, { $0 + $1 })))
                left += 1
            }
            right += 1
        }
        return result / Double(k)
    }
}
