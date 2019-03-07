import Foundation

protocol Shape {
    func area() -> Double
}

class Rectangle: Shape {
    var width: Double = 0
    var height: Double = 0
    
    init(inWidth: Double, inHeight: Double) {
        self.width = inWidth
        self.height = inHeight
    }
    
    internal func area() -> Double {
        return width * height
    }
}

class Circle: Shape {
    let radius: Double = 0
    
    internal func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Triangle: Shape {
    let length: Double = 0
    let breath: Double = 0
    
    internal func area() -> Double {
        return 1/2 * length * breath
    }
}

class AreaCalculator {
    func area(shape: Shape) -> Double {
        return shape.area()
    }
}
