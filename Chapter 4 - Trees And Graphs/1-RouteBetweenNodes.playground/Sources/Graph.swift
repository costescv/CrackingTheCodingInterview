import Foundation

public struct Vertex<T: Hashable>: Hashable, CustomStringConvertible {
    public var data: T
    
    public init(data: T) {
        self.data = data
    }
    
    public var description: String {
        return "\(data)"
    }
}

public struct Graph<T: Hashable> {
    public var edges: [Vertex<T>: [Vertex<T>]]
    
    public init() {
        edges = [:]
    }
    
    mutating public func addEdge(from v1:Vertex<T>, to v2: Vertex<T>) {
        var list = edges[v1, default: []]
        list.append(v2)
        
        edges[v1] = list        
    }
}
