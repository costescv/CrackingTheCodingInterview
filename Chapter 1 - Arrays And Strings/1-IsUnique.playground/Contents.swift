import UIKit

// Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

// With additional data structures (set, but also dictionary would work)
func allUniqueCharacters(string: String) -> Bool {
    var charSet = Set<Character>()
    
    for c in string {
        if charSet.contains(c) {
            return false
        } else {
            charSet.insert(c)
        }
    }
    
    return true
}


let firstString = "maria has apples"
let secondString = "abcdefgh"

print(allUniqueCharacters(string: firstString))
print(allUniqueCharacters(string: secondString))


// Another solution with additional data structures
// If I could sort the string in place then it could be a solution for the without extra data structure
func hasUniqueCharacters(string: String) -> Bool {
    let ss = string.sorted()
    let n = ss.count
    let startIndex = ss.startIndex
    
    for i in 0..<n-1 {
        let index1 = ss.index(startIndex, offsetBy: i)
        let index2 = ss.index(startIndex, offsetBy: i+1)
        if ss[index1] == ss[index2] {
            return false
        }
    }
    
    return true
}

print(hasUniqueCharacters(string: firstString))
print(hasUniqueCharacters(string: secondString))

// Brute force
func bruteUniqueCharacters(string: String) -> Bool {
    let n = string.count
    let startIndex = string.startIndex
    
    for i in 0..<n-1 {
        let index1 = string.index(startIndex, offsetBy: i)
        for j in i+1..<n {
            let index2 = string.index(startIndex, offsetBy: j)
            if string[index1] == string[index2] {
                return false
            }
        }
    }
    
    return true
}

print(bruteUniqueCharacters(string: firstString))
print(bruteUniqueCharacters(string: secondString))
