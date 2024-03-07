import Foundation

/*
 45. Jump Game II
 Medium
 Topics
 Companies
 You are given a 0-indexed array of integers nums of length n. You are initially positioned at nums[0].

 Each element nums[i] represents the maximum length of a forward jump from index i. In other words, if you are at nums[i], you can jump to any nums[i + j] where:

 0 <= j <= nums[i] and
 i + j < n
 Return the minimum number of jumps to reach nums[n - 1]. The test cases are generated such that you can reach nums[n - 1].



 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Example 2:

 Input: nums = [2,3,0,1,4]
 Output: 2


 Constraints:

 1 <= nums.length <= 104
 0 <= nums[i] <= 1000
 It's guaranteed that you can reach nums[n - 1].

 https://algorithms-digest.medium.com/jump-game-ii-3898a8a2cbb5

 Greedy solutions involve making greedy choices at each step.
 To come up with a greedy algorithm, we need to think about 2 points:

 Defining Choices We Have: What choices are we making? Or in other words, how do you define a choice?
 Defining Greedy Strategy & Proving Correctness: What’s the criteria to make a greedy choice? Prove that your greedy algorithm is optimal (or find a counter-example to prove that it’s not)!
 Defining Choices We Have
 At any given position, the choice we have to make is, which position should we jump to?
 The choices that we have at index i are all positions p such that we i + nums[i] >= p .
 Defining Greedy Strategy & Proving Correctness
 Here are a bunch of possible strategies that sound reasonable. For each, let’s try to prove / disprove it.
 I wish there was an easy to way to tell which one is the correct strategy without a proof or counter-example. However, it’s often a mix of intuition and a formal mathematical proof.

 Strategy A: Jump as far as possible i.e. jump to p = i + nums[i] .


 Strategy A: Jump as far as possible.
 This isn’t optimal.

 What if the biggest jump leads to an index with value 0. We might get stuck and never reach the end.

 Here’s an example: nums = {3, 1, 1, 0, 1} .
 Jumping 3 steps forward from index 0 will lead us to 0 where we’ll get stuck!


 Strategy A might lead us to 0 where we’ll get stuck!
 Strategy B: Jump to a position that allows us to make the biggest jump i.e. maximise nums[p] .


 Strategy B: Jump to position that allows the biggest jump.
 This isn’t optimal.

 Intuitively, a position might allow us to make a big jump, but does that big jump necessarily help us?

 Here’s an example: nums = {3, 3, 1, 2, 0, 1} .
 Out the choices nums[1] = 3, nums[2] = 1 and nums[3] = 2, index 1 has the maximum jump value.
 However, if we jump to index 1, being able to jump 3 steps doesn’t help us. We will land on a 0 and get stuck.


 Strategy B might lead to a jump which doesn’t lead to any useful outcome.
 Therefore, we have to jump from index 1 to index 3 (nums[3] = 2) and then jump to the index. But we could have directly jumped to index 3 instead of reaching there via index 1.

 Strategy C: Jump to position that maximises the reach of the next jump i.e. maximise p + nums[p] .


 Strategy C: Jump to position that maximises the reach of the next jump.
 In strategy B, the big jump might turn out to be not useful. Strategy C, in a way, makes the greed choice based on usefulness of the next jump.

 This seems optimal. But let’s prove it to be sure!

 Suppose our greedy strategy leads us to a path G = {g(0) = 0, g(1), g(2), ... g(k)} . Here g{i} denotes the position we jump to on the i-th jump.


 Greedy solution denoted by a series of positions we jump to.
 Now, assume there’s any arbitrary path that leads us to the end. Let’s call that P .

 Case 1: Assume that P doesn’t involve a jump to position g(1) .


 Arbitrary solution (P) that doesn’t invole a jump to g(1).
 P must involve a jump from a position to the left of g(1) to a position to the right of g(1) , say a jump from p(i) to p(j) .

 Now, since we can jump from p(1) to p(2) . It’s also possible to jump from g(1) to p(2) . This is because, by definition of our greedy strategy, g(1) + nums[g(1)] >= p(1) + nums[p(1)] .


 Case 1 Example of updating an arbitrary solution (P) to match the first greedy choice leads to a solution as good. This proves that we can’t go wrong by taking the greedy decision.
 Therefore, we can replace everything we before p(j) with a jump to g(1) and still have a valid solution that’s better than P .

 Case 2: Assume that P involves a jump to position g(1) .


 Arbitrary solution (P) that involves a jump to g(1).
 In this case, simply eliminate everything before g(1) in P and jump directly to g(1) .


 Case 2 Example updating an arbitrary solution (P) to match the first greedy choice leads to a solution as good. This proves that we can’t go wrong by taking the greedy decision.
 In both cases, we have proven that jumping to g(1) can’t be sub-optimal. Hence, we can safely jump to g(1) .

 Now, we are left with a smaller problem of reaching the last index starting from index g(1) .

 By similar analogy (induction), if we keep repeating this greedy choice, we will eventually end up with a shortest path.

 Algorithm
 If we implement the greedy strategy naively, we will still get a O(n²) algorithm. This is because, we would be comparing nums[i] + i at all positions reachable from position i . This is similar to the DP formulation. However, we can be smarter about it
 Once we have considering nums[i] + i for a position, we don’t need to worry about it again. If we didn’t jump to it on the first attempt, we wouldn’t jump on it later since the greedy strategy is optimal.
 This helps us optimise to a linear solution. See the source code below for reference.
 class Solution {
 public:
     int jump(vector<int>& nums) {
         int n = nums.size();
         if(n == 1)
             return 0;
         int currentPosition = 0; // Tracks where we are currently.
         int jumps = 0;
         int maxReachability = 0;
         int maxReachabilityIndex = 0;
         for(int i=0; i<n; i++) {
             // Make one final leap to the end if possible!
             if(currentPosition + nums[currentPosition] >= n-1)
                 return jumps + 1;
             // If we have come too ahead
             // (i.e. considered all possible jump options),
             // we need to make a jump based on greedy strategy!
             if(i > currentPosition + nums[currentPosition]) {
                 currentPosition = maxReachabilityIndex;
                 jumps++;
             }
             // Evaluating which jump to make next
             // by keep tracking of i + nums[i] for each position reachable
             // from the current position
             int reachability = i + nums[i];
             if(reachability > maxReachability) {
                 maxReachability = reachability;
                 maxReachabilityIndex = i;
             }
         }
         return jumps+1;
     }
 };
 Runtime
 Since we scan through the array at-most once and perform an O(1) operation at each step, the overall runtime is O(n).

 Please endorse the article and follow Algorithms Digest for more such visual Leetcode problem explanations!

 Please let me know in the comments if this explanation helped you understand the problem better. Would love to hear any feedback/suggestions/edits as well.

 Do check out the other posts in the Jump Game series:

 */


/*
 [2,3,1,1,4]


 0 b


 */

class Solution {
    func jump(_ nums: [Int]) -> Int {

        if nums.count == 1 {
            return 0
        }

        let n = nums.count
        var i: Int = 0
        var jumps: Int = 0

        var l: Int = 1
        var r: Int = nums[0]
        var farthest: Int = nums[0]

        while i < nums.count {
            jumps += 1

            if farthest >= n - 1 { return jumps }

            while l <= r {
                farthest = max(farthest, l + nums[l])
                l += 1
            }

            i = l
            r = farthest

        }

        return jumps
    }
}

//print(Solution().jump([3,3,1,2,0,1]))
print(Solution().jump([1,1,2,5,2,1,0,0,1,3]))
//print(Solution().jump([2,3,1,1,4]))
//print(Solution().jump([2,3,0,1,4]))
