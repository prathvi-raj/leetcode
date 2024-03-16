import Foundation

/*

 274. H-Index
 Medium
 Topics
 Companies
 Hint
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

 According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.



 Example 1:

 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
 Example 2:

 Input: citations = [1,3,1]
 Output: 1


 Constraints:

 n == citations.length
 1 <= n <= 5000
 0 <= citations[i] <= 1000

 */

class Solution0 {
    func hIndex(_ citations: [Int]) -> Int {
        guard citations.count > 1 else { return citations.count }
        var citations = citations.sorted()

        var result = 0
        for i in 0..<citations.count {
            if citations.count - i >= citations[i] &&  citations[i] > result {
                result += 1
            }
        }

        return result
    }
}

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        var dict = [Int:Int]()
        citations.forEach { c in
            for i in 0...c {
                dict[i, default: 0] = min(dict[i, default: 0] + 1, i)
            }
        }
        return dict.values.max() ?? 0
    }
}

print(Solution().hIndex([3,0,6,1,5]))

