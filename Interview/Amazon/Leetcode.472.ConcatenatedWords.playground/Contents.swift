import Foundation

/*
 472. Concatenated Words

 Given an array of strings words (without duplicates), return all the concatenated words in the given list of words.

 A concatenated word is defined as a string that is comprised entirely of at least two shorter words in the given array.



 Example 1:

 Input: words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
 Output: ["catsdogcats","dogcatsdog","ratcatdogcat"]
 Explanation: "catsdogcats" can be concatenated by "cats", "dog" and "cats";
 "dogcatsdog" can be concatenated by "dog", "cats" and "dog";
 "ratcatdogcat" can be concatenated by "rat", "cat", "dog" and "cat".
 Example 2:

 Input: words = ["cat","dog","catdog"]
 Output: ["catdog"]


 Constraints:

 1 <= words.length <= 104
 1 <= words[i].length <= 30
 words[i] consists of only lowercase English letters.
 All the strings of words are unique.
 1 <= sum(words[i].length) <= 105
 */

class Solution {

    class TrieNode: Equatable {
        var word: String = ""
        var children: [TrieNode?] = []
        var end: Bool = false
        init() {
            for _ in 0..<26 {
                children.append(nil)
            }
        }

        static func == (lhs: TrieNode, rhs: TrieNode) -> Bool {
            return lhs.word == rhs.word
        }
    }

    class Trie {
        var root: TrieNode?
        /** Initialize your data structure here. */
        init() {
            root = TrieNode()
        }

        /** Inserts a word into the trie. */
        func insert(_ word: String) {
            var node = root
            for c in word {
                let idx = Int(c.asciiValue! - Character("a").asciiValue!)
                if node?.children[idx] == nil {
                    node?.children[idx] = TrieNode()
                }

                node = node?.children[idx]
            }

            node?.end = true
            node?.word = word
        }

    }

    var concats: Set<String> = []
    var ctrie: Trie = Trie()

    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        ctrie = Trie()
        for word in words {
            ctrie.insert(word)
        }

        concats = []

        for word in words {
            if !word.isEmpty {
                if findAllConcatenatedWordsInADict(Array(word), 0, ctrie.root, 0) {
                    concats.insert(word)
                }
            }
        }

        return Array(concats)
    }

    func findAllConcatenatedWordsInADict(_ word: [Character], _ i: Int, _ node: TrieNode?, _ count: Int) -> Bool {

        if i == word.count {
            return false
        }

        // see if node exists at i
        let c = word[i]
        let ascii = Int(c.asciiValue! - Character("a").asciiValue!)
        guard let node = node?.children[ascii] else {
            return false
        }

        // base case
        if node.end && i == word.count-1 {
            // the last sub word from the root should not be equal to the main word
            return node.word != String(word) && count > 0
        }

        if node.end {
            // start from the root for the second word
            if findAllConcatenatedWordsInADict(word, i+1, ctrie.root, count+1) {
                return true
            }
        }
        // find another word
        return findAllConcatenatedWordsInADict(word, i+1, node, count)
    }
}


class Solution1 {

    class TrieNode {
        var key: Character?
        var isWord = false
        var children = [Character: TrieNode]()

        func insert(_ char: Character) -> TrieNode {
            if let node = children[char] { return node }
            let node = TrieNode()
            node.key = char
            children[char] = node
            return node
        }
    }

    class Trie {
        var root = TrieNode()

        func addWord(_ word: String) {
            var currNode = root

            for char in word {
                currNode = currNode.insert(char)
            }

            currNode.isWord = true
        }

        func isConcatenated(_ word: [Character], _ start: Int, _ root: TrieNode, _ count: Int) -> Bool {

            if word.count == start { return count  > 1 }

            var currNode = root

            for index in start..<word.count {
                let char = word[index]

                guard let node = currNode.children[char] else {
                    return false
                }

                if node.isWord {
                    if isConcatenated(word, index + 1, root, count + 1) {
                        return true
                    }
                }

                currNode = node
            }

            return false
        }
    }

    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var result = [String]()
        let trie = Trie()

        for word in words {
            if !word.isEmpty {
                trie.addWord(word)
            }
        }

        for word in words {
            if !word.isEmpty {
                let wordArr = Array(word)
                if trie.isConcatenated(wordArr, 0,trie.root, 0) {
                    result.append(word)
                }
            }
        }

        return result
    }
}

print(Solution1().findAllConcatenatedWordsInADict(["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]))
