import Foundation
import Darwin

/*
 Given a sequence of words written in the alien language, and the order of the alphabet, return true if and only if the given words are sorted lexicographically in this alien language.
 Input: words = ["word","world","row"], order = "worldabcefghijkmnpqstuvxyz"
 Output: false
 Explanation: As 'd' comes after 'l' in this language, then words[0] > words[1], hence the sequence is unsorted.
 */

/*
 func isLexicographical(wordds: [String], order: "worldabcefghijkmnpqstuvxyz") -> Bool {

     let chracterIntMap: [Character: Int] = [:]
     let i = 1
     for w in Words {
         chracterIntMap[w] = i
         i += 1
     }


 }

 extension String {
     func isLexicographical(word: String, chracterIntMap: [Character: Int]) -> Bool {

         let minI = min(word.count, self.count)

         for i in 0..<minI {
             if self[i] word[i]
         }

         while c1 != nil && c2 != nil {
             guard c1 > c2 else {
                 return false
             }
             c1 =

         }
         return true
     }
 }

 */


/*

 class Node {
     var next: Node?
     var value: Int
     init(_ value: Int) {
         self.value = value
     }
 }

 111111111
 123334668
 12334668
 123468

 func deleteDuplicates(_ head: Node?) {
     var current: Node? = head
     while current != nil {
         if let temp = current.next {}
         if current.value == temp.value ?? Int.min {
             current.next = temp?.next
         } else {
             current = current.next
         }
     }
     return head
 }

 */








var i = 0
var closureArray = [()->()]()
closureArray = []
for _ in 1...5 {
closureArray.append {
print(i)
}
i += 1
}


closureArray[0]() // 1
closureArray[1]() // 2
closureArray[4]() // 5
