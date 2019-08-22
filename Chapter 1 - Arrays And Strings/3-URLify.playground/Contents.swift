import UIKit

// Write a method to replace all spaces in a string with '%20'. You may assume that the string
// has sufficient space at the end to hold the additional characters, and that you are given the
// "true" lenght of the string.

// The "algorithmic" way which is not as fun in Swift
func urlify(s: String, trueLenght: Int) -> String {
    var charArray = Array(s)
    var index = s.startIndex
    var i = 1
    var numberOfSpaces = 0
    
    while i < trueLenght {
        if s[index] == " " {
            numberOfSpaces += 1
        }
        index = s.index(after: index)
        i += 1
    }
    
    let n = charArray.count
    var j = n-1
    for i in (0..<trueLenght).reversed() {
        if charArray[i] == " " {
            charArray[j] = "0"
            charArray[j-1] = "2"
            charArray[j-2] = "%"
            j -= 3
        } else {
            charArray[j] = charArray[i]
            j -= 1
        }
    }
    
    
    return String(charArray)
}


let s = "Mr John Smith    "
let string = urlify(s: s, trueLenght: 13)

print(string)


// The cheeky way
func simpleUrlify(s: String, trueLenght: Int) -> String {
    let index = s.index(s.startIndex, offsetBy: trueLenght)
    return s.replacingOccurrences(of: " ", with: "%20", options: [], range: s.startIndex..<index)
}

let s2 = simpleUrlify(s: s, trueLenght: 13)

print(s2)
