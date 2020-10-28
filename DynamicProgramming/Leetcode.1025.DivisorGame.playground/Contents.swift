import Foundation

/*
 Alice and Bob take turns playing a game, with Alice starting first.

 Initially, there is a number N on the chalkboard.  On each player's turn, that player makes a move consisting of:

 Choosing any x with 0 < x < N and N % x == 0.
 Replacing the number N on the chalkboard with N - x.
 Also, if a player cannot make a move, they lose the game.

 Return True if and only if Alice wins the game, assuming both players play optimally.

  

 Example 1:

 Input: 2
 Output: true
 Explanation: Alice chooses 1, and Bob has no more moves.
 Example 2:

 Input: 3
 Output: false
 Explanation: Alice chooses 1, Bob chooses 1, and Alice has no more moves.
 */

class Solution {
    
    func divisorGame(_ N: Int) -> Bool {
        
        if N == 1 {
            return false
        }
        
        var dp: [Bool] = [Bool](repeating: false, count: N + 1)
        
        for i in 3...N {
            for j in 1..<i {
                if i % j == 0 {
                    dp[i] = !dp[i-j] || dp[i];
                }
            }
        }
        
        return dp[N]
    }
}

/*
class Solution {
    
    func divisorGame(_ N: Int) -> Bool {
        var N = N
        var flag: Int = 0
        var i: Int = N - 1
        while N != 1 && i > 0  {
            print(N)
            print(i)
            print(flag)
            if N % i == 0 {
                flag += 1
                N = N - i
                i = N - 1
            }
            i -= 1
            
        }
        if flag % 2 == 1 {
            return true
        }
        
        return false
    }
    
    
}
*/

Solution().divisorGame(3)
