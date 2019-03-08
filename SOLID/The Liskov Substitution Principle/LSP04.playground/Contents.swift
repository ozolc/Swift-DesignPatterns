import Foundation

protocol Bird {
    var altitudeToFly: Double? { get }
    func setLocation(longitude: Double, latitude: Double)
}

protocol Flying {
    mutating func setAltitude(altitude: Double)
}

protocol FlyingBird: Bird, Flying { }

struct Owl: FlyingBird {
    var altitudeToFly: Double?
    
    func setLocation(longitude: Double, latitude: Double) {
        // Set location
    }
    
    mutating func setAltitude(altitude: Double) {
        self.altitudeToFly = altitude
    }
}

struct Penguin: Bird {
    var altitudeToFly: Double?
    
    func setLocation(longitude: Double, latitude: Double) {
        // Set location value
    }
}
