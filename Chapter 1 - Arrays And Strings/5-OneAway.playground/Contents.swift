import UIKit

// There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given
// two strings, write a function to check if they are on edit (or zero edits) away.


// Use a dictionary to keep track of the number of times a character appears in the string
func oneAway(s1: String, s2: String) -> Bool {
    let n = s1.count
    let m = s2.count
    
    guard abs(n - m) <= 1 else {
        return false
    }
    
    var dict = [Character: Int]()
    
    countChars(s: s1, dict: &dict, operation: +)
    countChars(s: s2, dict: &dict, operation: -)
    
    let sum = dict.values.compactMap{ abs($0) }.reduce(0, +)
    
    return sum <= 1 || (abs(n-m) == 0 && sum == 2)
}

func countChars(s: String, dict: inout [Character: Int], operation: (Int, Int) -> Int) {
    let n = s.count
    var index = s.startIndex
 
    for _ in 0..<n {
        let char = s[index]
        let value = dict[char, default: 0]
        dict[char] = operation(value, 1)
        index = s.index(after: index)
    }
}


var s1 = "pale"
var s2 = "ple"

print(oneAway(s1: s1, s2: s2))

s1 = "pales"
s2 = "pale"

print(oneAway(s1: s1, s2: s2))

s1 = "pale"
s2 = "bale"

print(oneAway(s1: s1, s2: s2))

s1 = "pale"
s2 = "bake"

print(oneAway(s1: s1, s2: s2))


// Solution 2: Decide which operation we should look for first and don't use additional data structure

func oneAwayV2(s1: String, s2: String) -> Bool {
    if s1.count == s2.count {
        return oneAwayReplace(s1: s1, s2: s2)
    } else if s1.count + 1 == s2.count {
        return oneAwayEdit(s1: s1, s2: s2)
    } else if s1.count == s2.count + 1 {
        return oneAwayEdit(s1: s2, s2: s1)
    } else {
        return false
    }
}

func oneAwayReplace(s1: String, s2: String) -> Bool {
    var foundDifference = false
    let n = s1.count
    var index = s1.startIndex
    
    for _ in 0..<n {
        if s1[index] != s2[index] {
            if foundDifference {
                return false
            }
            foundDifference = true
        }
        index = s1.index(after: index)
    }
    
    return true
}

func oneAwayEdit(s1: String, s2: String) -> Bool {
    var index1 = s1.startIndex
    var index2 = s2.startIndex
    
    while index1 < s1.endIndex && index2 < s2.endIndex {
        if s1[index1] != s2[index2] {
            if index1 != index2 {
                return false
            }
            index2 = s2.index(after: index2)
        } else {
            index1 = s1.index(after: index1)
            index2 = s2.index(after: index2)
        }
    }
    return true
}


s1 = "pale"
s2 = "ple"

print(oneAwayV2(s1: s1, s2: s2))

s1 = "pales"
s2 = "pale"

print(oneAwayV2(s1: s1, s2: s2))

s1 = "pale"
s2 = "bale"

print(oneAwayV2(s1: s1, s2: s2))

s1 = "pale"
s2 = "bake"

print(oneAwayV2(s1: s1, s2: s2))
