import UIKit

// Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings,
// s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring.

func isRotation(s1: String, s2: String) -> Bool {
    
    guard s1.count == s2.count else {
        return false
    }
    
    let ss2 = s2 + s2
    
    return isSubstring(s1: s1, s2: ss2)
}

func isSubstring(s1: String, s2: String) -> Bool {
    return s2.contains(s1)
}

let s1 = "waterbottle"
let s2 = "erbottlewat"

print("\(isRotation(s1: s1, s2: s2))")

let ss1 = "asvsdg"
let ss2 = "sdvsdg"

print(isRotation(s1: ss1, s2: ss2))
