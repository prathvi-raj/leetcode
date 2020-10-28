import Foundation

/*
 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:

 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 */



class TrieNode {
    var word: String = ""
    var children: [Character: TrieNode] = [:]
}

class Trie {
    var root = TrieNode()
    
    func insert(_ word: String) {
        var currentNode = root
        
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            }else {
                let newNode = TrieNode()
                currentNode.children[char] = newNode
                currentNode = newNode
            }
        }
        currentNode.word = word
    }
    
    func search(_ word: String) -> Bool {
        var currentNode = root
        
        for char in word {
            if let node = currentNode.children[char] {
                currentNode = node
            } else {
                return false
            }
        }
        
        return currentNode.word.isEmpty ? false : true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        
        for char in prefix {
            if let node = currentNode.children[char] {
                currentNode = node
            } else {
                return false
            }
        }
        return currentNode.children.isEmpty && currentNode.word.isEmpty ? false : true
    }
}
