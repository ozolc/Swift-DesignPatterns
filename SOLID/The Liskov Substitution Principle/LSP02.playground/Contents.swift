import Foundation

protocol Polygon {
    var area: Float { get }
}

class Rectangle: Polygon {
    
    private let width: Float
    private let length: Float
    
    init(width: Float, length: Float) {
        self.width = width
        self.length = length
    }
    
    var area: Float {
        return width * length
    }
}

class Square: Polygon {
    
    private let side: Float
    
    init(side: Float) {
        self.side = side
    }
    
    var area: Float {
        return pow(side, 2)
    }
}

// Client Method

func printArea(of polygon: Polygon) {
    print(polygon.area)
}

// Usage

let rectangle = Rectangle(width: 2, length: 5)
printArea(of: rectangle)

let square = Square(side: 2)
printArea(of: square)
