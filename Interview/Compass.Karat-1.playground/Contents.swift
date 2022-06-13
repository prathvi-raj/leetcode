import Foundation

/*
 /*
  /*
  You work in an automated robot factory. Once robots are assembled, they are sent to the shipping center via a series of autonomous delivery carts, each of which moves packages on a one-way route.

  Given input that provides the (directed) steps that each cart takes as pairs, write a function that identifies all the start locations, and a collection of all of the possible ending locations for each start location.

  In this diagram, starting locations are at the top and destinations are at the bottom - i.e. the graph is directed exclusively downward.

     A         E      J       Key:  [Origins]
    / \       / \      \             \
   B   C     F   L      M            [Destinations]
    \ /  \  /
     K     G
          / \
         H   I

  paths = [
    ["A", "B"],
    ["A", "C"],
    ["B", "K"],
    ["C", "K"],
    ["E", "L"],
    ["F", "G"],
    ["J", "M"],
    ["E", "F"],
    ["G", "H"],
    ["G", "I"],
    ["C", "G"]
  ]

  Expected output (unordered):
  [ "A": ["K", "H", "I"],
    "E:" ["H", "L", "I"],
    "J": ["M"] ]

  N: Number of pairs in the input.
  */

  import Foundation;


  let paths = [
    ["A", "B"],
    ["A", "C"],
    ["B", "K"],
    ["C", "K"],
    ["E", "L"],
    ["F", "G"],
    ["J", "M"],
    ["E", "F"],
    ["G", "H"],
    ["G", "I"],
    ["C", "G"]
  ]



  func get_robots(all_parts: [String], required_parts: [String]) -> [String] {

    var store: [String: [String]] = [:]
    var robotsSet: Set<String> = Set([])
    for element in  all_parts {
      let underScoreSepearatedValues: [String] = element.components(separatedBy: "_")
      var temp: [String] =  store[underScoreSepearatedValues[1]] ?? []
      temp.append(underScoreSepearatedValues[0])
      store[underScoreSepearatedValues[1]] =  temp
      robotsSet.insert(underScoreSepearatedValues[0])
    }

    var result: [String] = Array(robotsSet)
    for  required_part in required_parts {
      result = Array(Set(result).intersection(Set(store[required_part] ?? [])))
    }
    return result
  }


  print(get_robots(all_parts: all_parts, required_parts: required_parts_1.components(separatedBy: ",")))
  print(get_robots(all_parts: all_parts, required_parts: required_parts_2.components(separatedBy: ",")))
  */

 */

class Solution {
    func get_robots(all_parts: [String], required_parts: [String]) -> [String] {
        var robotsMap: [String: [String]] = [:]
        for part in all_parts {
            let comps = part.components(separatedBy: "_")
            var temp =  robotsMap[comps[0]] ?? []
            temp.append(comps[1])
            robotsMap[comps[0]] = temp
        }

        var result: [String] = []
        for (k,v) in robotsMap {
            if self.isValidRobot(all_parts: v, required_parts: required_parts) {
                result.append(k)
            }
        }
        return result
    }

    func isValidRobot(all_parts: [String], required_parts: [String]) -> Bool {
        for required_part in required_parts {
            if !all_parts.contains(required_part) { return false }
        }
        return true
    }
}
