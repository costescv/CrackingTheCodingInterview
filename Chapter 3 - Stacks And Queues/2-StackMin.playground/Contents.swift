import UIKit

// How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop and min should all operate in O(1) time.

// Option 0: The stack could keep track of the minimum element. However, if the minimum elements
// is poped out of the stack, we'd have to do a lookup for the new minimum and we'd break the
// requirement of a O(1) running time => not great

// Option 1: Have a field on each node that keeps track of the minimum of each level

struct StackNode {
    var value: Int
    var minValue: Int
}

struct Stack {
    
    var elements: [StackNode]
    
    init() {
        elements = []
    }
    
    mutating func push(item: Int) {
        
        var newMin = min() ?? Int.max
        if elements.isEmpty {
            newMin = item
        } else if item < newMin {
            newMin = item
        }
        
        let node = StackNode(value: item, minValue: newMin)
        
        elements.append(node)
    }
    
    mutating func pop() -> Int? {
        return elements.removeLast().value
    }
    
    func min() -> Int? {
        guard !elements.isEmpty else {
            return nil
        }
        
        return elements.last?.minValue
    }
}

// quick test
var stack = Stack()

stack.push(item: 2)
stack.min()
stack.push(item: 3)
stack.min()
stack.push(item: 1)
stack.push(item: 4)
stack.min()
stack.pop()
stack.pop()
stack.min()
print("stack el \(stack.elements)")


//Option 3 - Keep the mins in a separate stack and when we pop the current min we pop it out of the
// min stack too. The advantage over the previous solution is that is uses less space (it only keeps
// one copy of each min, rather than each element having the value of the previous min

struct StackNode2 {
    var value: Int
}

struct Stack2 {
    
    var elements: [StackNode2]
    var minimums: [Int] //will act like a stack of mins
    
    init() {
        elements = []
        minimums = []
    }
    
    mutating func push(item: Int) {
        elements.append(StackNode2(value: item))
        
        if minimums.isEmpty {
            minimums.append(item)
        } else if item < (minimums.last ?? Int.max) {
            minimums.append(item)
        }
    }
    
    mutating func pop() -> Int? {
        if let el = elements.last {
            if el.value == (minimums.last ?? Int.max) {
                minimums.removeLast()
            }
        }
        return elements.removeLast().value
    }
    
    func min() -> Int? {
        return minimums.last
    }
}


// quick test
var stack2 = Stack2()

stack2.push(item: 2)
stack2.min()
stack2.push(item: 3)
stack2.min()
stack2.push(item: 1)
stack2.push(item: 4)
stack2.min()
stack2.pop()
stack2.pop()
stack2.min()

