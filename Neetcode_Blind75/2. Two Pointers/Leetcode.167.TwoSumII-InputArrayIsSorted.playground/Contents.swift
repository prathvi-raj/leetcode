import Foundation

/*

 167. Two Sum II - Input Array Is Sorted
 Solved
 Medium
 Topics
 Companies
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

 The tests are generated such that there is exactly one solution. You may not use the same element twice.

 Your solution must use only constant extra space.



 Example 1:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 Example 2:

 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
 Example 3:

 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].


 Constraints:

 2 <= numbers.length <= 3 * 104
 -1000 <= numbers[i] <= 1000
 numbers is sorted in non-decreasing order.
 -1000 <= target <= 1000
 The tests are generated such that there is exactly one solution.

 */

/*

 The solution provided uses a two-pointer approach where a low pointer and a high pointer are initialized at the start and end of the array respectively.

 Then, a while loop is used to iterate through the array, and in each iteration, the sum of the values at the low and high pointers is computed. If the sum is equal to the target, the indices of the numbers are returned as an integer array. If the sum is less than the target, the low pointer is incremented to move towards larger values, and if the sum is greater than the target, the high pointer is decremented to move towards smaller values.

 This approach works because the array is sorted, and by moving the low and high pointers based on the sum of their values, we can find the two numbers that add up to the target. Since the problem statement guarantees that there is exactly one solution, the while loop will always terminate with the correct indices being returned.

 Complexity
 This solution has a time complexity of O(n)O(n)O(n) since we only make a single pass through the array, and a space complexity of O(1)O(1)O(1) since we are only using a constant amount of extra space to store the low and high pointers.

 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        guard numbers.count > 1 else { return [] }
        var l: Int = 0
        var r: Int = numbers.count - 1

        while l < r {

            if numbers[l] + numbers[r] == target { return [l+1,r+1] }

            if numbers[l] + numbers[r] < target {
                l += 1
            } else {
                r -= 1
            }
        }

        return []
    }
}
