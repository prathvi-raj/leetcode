import Foundation

/*
 
 Given an array of strings, group anagrams together.

 Example:

 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 Note:

 All inputs will be in lowercase.
 The order of your output does not matter
 
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        for str in strs {
            let ss = String(str.sorted())
            if map[ss] == nil {
                map[ss] = []
            }
            map[ss]!.append(str)
        }
        
        return Array(map.values)
    }
}

/*
class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var maps: [[Character: Int]: [String]] = [:]
        var mapsOnly: [[Character: Int]] = []
        
        for i in 0..<strs.count {
            if !strs[i].isEmpty {
                
                if i == 0 {
                    var map: [Character: Int] = [:]
                    
                    for c in strs[i] {
                        map[c] = (map[c] == nil) ? 1: map[c]! + 1
                    }
                    
                    maps[map] = [strs[i]]
                    
                    mapsOnly.append(map)
                }else {
                    
                    var isMatching: Bool = false
                    var matchValue: [Character: Int]? = nil
                    
                    for j in 0..<mapsOnly.count {
                        var lastMap = mapsOnly[j]
                        let original = lastMap
                        
                        let count = lastMap.values.reduce(0) { (r, i) -> Int in return r + i }
                        if count == strs[i].count {
                            for c in strs[i] {
                                let v = lastMap[c]
                                if v != nil {
                                    if v! == 1 {
                                        lastMap.removeValue(forKey: c)
                                    }else {
                                        lastMap[c] = v! - 1
                                    }
                                }else {
                                    isMatching = false
                                    break
                                }
                            }
                            
                            if lastMap.isEmpty {
                                isMatching = true
                                matchValue = original
                                break
                            }
                        }
                    }
                    
                    if isMatching == true {
                        var v = maps[matchValue!]!
                        v.append(strs[i])
                        maps[matchValue!] = v
                    }else {
                        
                        var map: [Character: Int] = [:]
                        
                        for c in strs[i] {
                            map[c] = (map[c] == nil) ? 1: map[c]! + 1
                        }
                        
                        maps[map] = [strs[i]]
                        mapsOnly.append(map)
                    }
                }
            }
        }
        var emptyStrings: [String] = []
        var allEmpty: Bool = true
        
        for s in strs {
            if s.isEmpty {
                emptyStrings.append(s)
            }else {
                allEmpty = false
            }
        }
        
        var result: [[String]] = []
        
        if !emptyStrings.isEmpty || allEmpty {
            if !emptyStrings.isEmpty {
                result.append(emptyStrings)
            }
        }
        
        for v in maps.values {
            result.append(v)
        }
        
        
        return result
    }
}
*/

print(Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
print(Solution().groupAnagrams(["", "b"]))
