// Given two strings, write a method to decide if one is a permutation of the other.

// Solution 1 (runtime is O(n*log(n))

func isPermutated(s: String, t: String) -> Bool {
    let n = s.count
    let m = t.count
    
    guard n == m else {
        return false
    }
    
    let s1 = s.sorted()
    let t1 = t.sorted()
    
    if s1 == t1 {
        return true
    } else {
        return false
    }
}

let string1 = "Hello World!"
let string2 = "World Hello!"
let string3 = "Swift is awesome!"
let string4 = "Same number of ch"

print(isPermutated(s: string1, t: string2))
print(isPermutated(s: string1, t: string3))
print(isPermutated(s: string3, t: string4))


// Solution 2 (runtime is O(n))

func isPermutation(s: String, t: String) -> Bool {
    let n = s.count
    let m = t.count
    
    guard n == m else {
        return false
    }
    
    var chars = [Character: Int]()
    
    modifyValue(string: s, chars: &chars, sign: +)
    modifyValue(string: t, chars: &chars, sign: -)
    
    return checkAllZeroes(dict: chars)
}

func checkAllZeroes(dict: [Character : Int]) -> Bool {
    for c in dict.keys {
        if dict[c, default: 0] != 0 {
            return false
        }
    }
    return true
}

func modifyValue(string: String, chars: inout [Character: Int], sign: (Int,Int) -> Int) {
    for c in string {
        let value = chars[c, default: 0]
        chars[c] = sign(value, 1)
    }
}

print(isPermutation(s: string1, t: string2))
print(isPermutation(s: string1, t: string3))
print(isPermutation(s: string3, t: string4))



