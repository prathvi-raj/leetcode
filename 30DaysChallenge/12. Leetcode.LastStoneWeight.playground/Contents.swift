import Foundation

/*
 We have a collection of stones, each stone has a positive integer weight.

 Each turn, we choose the two heaviest stones and smash them together.  Suppose the stones have weights x and y with x <= y.  The result of this smash is:

 If x == y, both stones are totally destroyed;
 If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y-x.
 At the end, there is at most 1 stone left.  Return the weight of this stone (or 0 if there are no stones left.)

  

 Example 1:

 Input: [2,7,4,1,8,1]
 Output: 1
 Explanation:
 We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
 we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
 we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
 we combine 1 and 1 to get 0 so the array converts to [1] then that's the value of last stone.
  

 Note:

 1 <= stones.length <= 30
 1 <= stones[i] <= 1000
 */


class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones
        
        if stones.count == 0 {
            return 0
        }
        
        if stones.count == 1 {
            return stones[0]
        }
        
        if stones.count == 2 {
            return abs(stones[0] - stones[1])
        }
        
        let d = getStones(v: stones)
        
        let h = stones[d.0]
        let sh = stones[d.1]
        
        if d.0 > d.1 {
            stones.remove(at: d.0)
            stones.remove(at: d.1)
        }else {
            stones.remove(at: d.1)
            stones.remove(at: d.0)
        }
        
        if h != sh {
            stones.append(abs(h-sh))
        }
        
        
        
        return lastStoneWeight(stones)
    }
    
    
    func getStones(v: [Int]) -> (Int, Int) {
        
        var h: Int = Int.min
        var hi: Int = 0
        var sh: Int = Int.min
        var shi: Int = 0
        
        for a in 0..<v.count{
            if v[a] > sh {
                if v[a] > h {
                    sh = h
                    shi = hi
                    
                    h = v[a]
                    hi = a
                }else {
                    sh = v[a]
                    shi = a
                }
            }
        }
        
        return (hi, shi)
    }
}

print(Solution().lastStoneWeight([9, 3, 2, 10]))
