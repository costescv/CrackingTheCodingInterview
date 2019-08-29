import Foundation

public func read(from fileName: String) -> Graph<Int> {
    var graph = Graph<Int>()
    
    guard let path = Bundle.main.path(forResource: fileName, ofType: "txt") else {
        return graph
    }
    
    do {
        _ = try String(contentsOfFile: path).components(separatedBy: "\n")
            .map {
                let a = $0.split(separator: " ")
                
                guard !a.isEmpty else {
                    return
                }
                guard
                    let value1 = Int(String(a[0])),
                    let value2 = Int(String(a[1]))
                    else {
                        return
                }
                
                let v1 = Vertex(data: value1)
                let v2 = Vertex(data: value2)
                
                graph.addEdge(from: v1, to: v2)
        }
        return graph
    } catch {
        return graph
    }
}
