import UIKit

// Implement a method to perform basic string compression using the countrs of repeated characters. For example,
// the string aabcccccaaa would become a2b1c5a3. If the "compressed" string would not become smaller than the original string,
// your method should return the original string. You can assume the string has only uppercase and lowercase letters (a-z).

// Solution 1: count while traversing string
func compress(s: String) -> String {
    var sum = 1
    var index = s.startIndex
    var result = String(s[index])
    var prevChar = s[index]
    index = s.index(after: index)
    
    while index < s.endIndex {
        let c = s[index]
        if c != prevChar {
            result += "\(sum)\(c)"
            sum = 1
            prevChar = c
        } else {
            sum += 1
        }
        
        index = s.index(after: index)
    }
    
    result += "\(sum)"
    
    if result.count > s.count {
        return s
    } else {
        return result
    }
}


let s = "aabcccccaaa"
print("\(compress(s: s))")
