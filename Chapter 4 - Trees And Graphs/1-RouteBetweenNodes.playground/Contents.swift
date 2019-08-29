import UIKit

// Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

var explored = Set<Vertex<Int>>()
var found = false

//Using the recursive DFS

func dfs(graph: Graph<Int>, start: Vertex<Int>, end: Vertex<Int>) -> Bool {
    if start == end {
        return true
    }
    
    explored.insert(start)
    
    for node in graph.edges[start, default: []] {
        if !explored.contains(node) {
            found = found || dfs(graph: graph, start: node, end: end)
        }
    }
    
    return found
}


let graph = read(from: "input")
let start = Vertex(data: 1)
let end = Vertex(data: 4)

let result = dfs(graph: graph, start: start, end: end)

explored = []
found = false

let graph2 = read(from: "input2")
let start2 = Vertex(data: 1)
let end2 = Vertex(data: 5)

let result2 = dfs(graph: graph2, start: start2, end: end2)
