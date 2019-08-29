import UIKit

// Given a string, write a function to check if it is a permutation of a palindrome.
// A palindrome is a word or phrase that is the same forwards and backwards. A permutation
// is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.
// spaces and other characters that are not letters are ignored


// The simple solution
func isPalindromePermutation(string: String) -> Bool {
    
    var dict = [Character : Int]()
    
    let s = string.lowercased()
    
    for c in s {
        if c.isLetter {
            let value = dict[c, default: 0]
            dict[c] = value + 1
        }
    }
    
    print("\(dict)")
    
    var foundOddNumber = false
    
    for key in dict.keys {
        if dict[key, default: 0] % 2 == 1 {
            if foundOddNumber == false {
                foundOddNumber = true
            } else {
                return false
            }
        }
    }
    
    return true
}

let s = "Tact Coa"
print(isPalindromePermutation(string: s))

