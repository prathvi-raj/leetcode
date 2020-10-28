import Foundation

/*
 Largest Sum Contiguous Subarray
 Last Updated: 01-08-2020
 Write an efficient program to find the sum of contiguous subarray within a one-dimensional array of numbers which has the largest sum.
 kadane-algorithm

 Recommended: Please solve it on “PRACTICE ” first, before moving on to the solution.
 Kadane’s Algorithm:

 Initialize:
     max_so_far = 0
     max_ending_here = 0

 Loop for each element of the array
   (a) max_ending_here = max_ending_here + a[i]
   (b) if(max_so_far < max_ending_here)
             max_so_far = max_ending_here
   (c) if(max_ending_here < 0)
             max_ending_here = 0
 return max_so_far
 Explanation:
 Simple idea of the Kadane’s algorithm is to look for all positive contiguous segments of the array (max_ending_here is used for this). And keep track of maximum sum contiguous segment among all positive segments (max_so_far is used for this). Each time we get a positive sum compare it with max_so_far and update max_so_far if it is greater than max_so_far

     Lets take the example:
     {-2, -3, 4, -1, -2, 1, 5, -3}

     max_so_far = max_ending_here = 0

     for i=0,  a[0] =  -2
     max_ending_here = max_ending_here + (-2)
     Set max_ending_here = 0 because max_ending_here < 0

     for i=1,  a[1] =  -3
     max_ending_here = max_ending_here + (-3)
     Set max_ending_here = 0 because max_ending_here < 0

     for i=2,  a[2] =  4
     max_ending_here = max_ending_here + (4)
     max_ending_here = 4
     max_so_far is updated to 4 because max_ending_here greater
     than max_so_far which was 0 till now

     for i=3,  a[3] =  -1
     max_ending_here = max_ending_here + (-1)
     max_ending_here = 3

     for i=4,  a[4] =  -2
     max_ending_here = max_ending_here + (-2)
     max_ending_here = 1

     for i=5,  a[5] =  1
     max_ending_here = max_ending_here + (1)
     max_ending_here = 2

     for i=6,  a[6] =  5
     max_ending_here = max_ending_here + (5)
     max_ending_here = 7
     max_so_far is updated to 7 because max_ending_here is
     greater than max_so_far

     for i=7,  a[7] =  -3
     max_ending_here = max_ending_here + (-3)
     max_ending_here = 4
 */


class Solution {
    func maxSubArraySum(a: [Int]) -> Int {
        var size: Int = a.count
        var maxSoFar = Int.min
        var maxEndingHere = 0
        
        for i in 0..<size {
            maxEndingHere = maxEndingHere + a[i]
            
            if maxSoFar < maxEndingHere {
                maxSoFar = maxEndingHere
            }
            
            if maxEndingHere < 0 {
               maxEndingHere = 0
            }
        }
        
        return maxSoFar
    }
}

Solution().maxSubArraySum(a: [-2, -3, 4, -1, -2, 1, 5, -3])
