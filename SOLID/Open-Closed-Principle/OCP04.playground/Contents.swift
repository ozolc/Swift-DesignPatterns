import Foundation

protocol Draw {
    func draw()
}

class Circle: Draw {
    func draw() {
        print("Circle is drawn")
    }
}

class Rectangle: Draw {
    func draw() {
        print("Rectangle is drawn")
    }
}

class DrawGraphic {
    func drawShape(shape: Draw) {
        shape.draw()
    }
}

let circle = Circle()
let rectangle = Rectangle()
let drawGraphic = DrawGraphic()

drawGraphic.drawShape(shape: circle)
drawGraphic.drawShape(shape: rectangle)
