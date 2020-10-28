import UIKit


// 1 2 3 4 5 6 7 8 9 10
func isBadVersion(_ version: Int) -> Bool{
    return false
}
 

class Solution {
    
    func firstBadVersion(_ n: Int) -> Int {
        
        var left: Int = 1;
        var right: Int = n;
        
        while (left < right) {
            let mid: Int = left + (right - left) / 2;
            if (isBadVersion(mid)) {
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }
}

/*
class Solution {
    
    func firstBadVersion(_ n: Int) -> Int {
        
        if isBadVersion(1) {
            return 1
        }
        
        var flag: Bool = false
        
        var i: Int = Int(n/2)
        var result: Int = 0
        
        while flag == false {
            
            if isBadVersion(i) == false {
                if isBadVersion(i+1) == true {
                    result = i+1
                    flag = true
                }else {
                    i = i + ((n - i)/2)
                }
            }else {
                
                if isBadVersion(i-1) == false {
                    result = i
                    flag = true
                }else {
                    i = i/2
                }
            }
        }
        
        return result
    }
}

 */



/*
 /**
  * The knows API is defined in the parent class VersionControl.
  *     func isBadVersion(_ version: Int) -> Bool{}
  */

 class Solution: VersionControl {
     
     func firstBadVersion(_ n: Int) -> Int {
         
         if isBadVersion(1) {
             return 1
         }
         
         var flag: Bool = false
         
         var i: Int = Int(n/2)
         
         while flag == false {
             
             let a = isBadVersion(i-1)
             let b = isBadVersion(i)
             let c = isBadVersion(i+1)
             
             if (a == false && b == true) {
                 flag = true
                 return i
             }
             
             if b == false && c == true {
                 flag = true
                 return i+1
             }
             
             if b == false {
                 i = i + ((n - i)/2)
             }
             
             if b == true {
                 i = i/2
             }
         }
         
         return n
     }
 }
 */
