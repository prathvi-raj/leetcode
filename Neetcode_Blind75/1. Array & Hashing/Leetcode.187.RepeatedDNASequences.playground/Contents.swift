import Foundation

/*

 187. Repeated DNA Sequences
 Medium
 Topics
 Companies
 The DNA sequence is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T'.

 For example, "ACGAATTCCG" is a DNA sequence.
 When studying DNA, it is useful to identify repeated sequences within the DNA.

 Given a string s that represents a DNA sequence, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.



 Example 1:

 Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 Output: ["AAAAACCCCC","CCCCCAAAAA"]
 Example 2:

 Input: s = "AAAAAAAAAAAAA"
 Output: ["AAAAAAAAAA"]


 Constraints:

 1 <= s.length <= 105
 s[i] is either 'A', 'C', 'G', or 'T'.

 */

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else { return [] }
        var map: [String: [String]] = [:]
        var s = Array(s)
        var i: Int = 0

        while i + 10 <= s.count {
            let seq = String(s[i..<(i+10)])
            if seq.count < 10 {
                break
            }
            map[seq] = (map[seq] ?? []) + [seq]
            i = i + 1
        }
        map = map.filter { (key: String, value: [String]) in value.count > 1 }
        return map.keys.map { $0 }
    }
}


print(Solution().findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
print(Solution().findRepeatedDnaSequences("AAAAAAAAAAAAA"))
print(Solution().findRepeatedDnaSequences("AAAAAAAAAAA"))
