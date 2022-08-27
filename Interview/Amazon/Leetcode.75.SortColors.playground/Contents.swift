import Foundation

/*
 75. Sort Colors
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

 We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

 You must solve this problem without using the library's sort function.



 Example 1:

 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Example 2:

 Input: nums = [2,0,1]
 Output: [0,1,2]


 Constraints:

 n == nums.length
 1 <= n <= 300
 nums[i] is either 0, 1, or 2.


 Follow up: Could you come up with a one-pass algorithm using only constant extra space?
 */




//1 0 2 1 2 0 0 1 2 1 0 2
//0 1 2 1 2 0 0 1 2 1 0 2
//0 1 1 2 0 0 1 2 1 0 2 2
//0 1 1 0 0 1 2 1 0 2 2 2
//0 0 1 1 0 1 2 1 0 2 2 2
//0 0 0 1 1 1 2 1 0 2 2 2
//0 0 0 1 1 1 1 0 2 2 2 2
//0 0 0 0 1 1 1 1 2 2 2 2


class Solution {
    func sortColors(_ nums: inout [Int]) {
        let n = nums.count
        var low = 0, high = n - 1, mid = 0
        while mid <= high {
            print(nums)
            switch nums[mid] {
            case 2:
                (nums[mid], nums[high]) = (nums[high], nums[mid])
                high -= 1
            case 0:
                (nums[mid], nums[low]) = (nums[low], nums[mid])
                low += 1
                mid += 1
            case 1:
                mid += 1
            default: continue
            }
        }
    }
}





//void sortColors(vector<int>& nums) {
//        int lo = 0;
//        int hi = nums.size() - 1;
//        int mid = 0;
//
//        while (mid <= hi) {
//            switch (nums[mid]) {
//
//            // If the element is 0
//            case 0:
//                swap(nums[lo++], nums[mid++]);
//                break;
//
//            // If the element is 1 .
//            case 1:
//                mid++;
//                break;
//
//            // If the element is 2
//            case 2:
//                swap(nums[mid], nums[hi--]);
//                break;
//            }
//        }
//
//    }


var x = [1, 0, 2, 1, 2, 0, 0, 1, 2, 1, 0, 2]
Solution().sortColors(&x)
