import UIKit

enum engine {
    case on, off
}

enum windows {
    case open, close
}

protocol Car {
    var brand : String {get}
    var year : Int {get}
    var colour : String {get}
    
    func startMovement(e: engine)
    func oldNew()
}

extension Car {
    
    func toggleEngine(e: engine) {
        if e == .off {
            e == .on
            print("EngineStatus was reversed to status ON")
        }
        else if e == .on {
            e == .off
            print("EngineStatus was reversed to status OFF")
        }
    }
    
    func windowsStatus(value: windows) {
        switch value {
        case windows.open: print("\(brand)'s windows are open")
        case windows.close: print("\(brand)'s windows are closed")
        }
    }
}

class sportCar : Car {
    var name : String
    var releaseDate : Int
    var carColour : String
    var maxSpeed : Int
    var nitroOnBoard : Bool
    
    init(name: String, releaseDate: Int, carColour: String, maxSpeed: Int, nitroOnBoard: Bool) {
        self.name = name
        self.releaseDate = releaseDate
        self.carColour = carColour
        self.maxSpeed = maxSpeed
        self.nitroOnBoard = nitroOnBoard
    }
    
    func startMovement(e: engine) {
        switch e {
        case engine.on:  print("You can go")
        case engine.off:  print("Turn on the engine and repeat")
        }
    }
    
    func oldNew() {
        if releaseDate >= 2020 {
            print("This car is new")
        } else {
            print("This car is old")
        }
    }
    
    
    var brand: String {
        return name
    }
    
    var year: Int {
        return releaseDate
    }
    
    var colour: String {
        return carColour
    }
}

class trunkCar : Car {
    var name : String
    var releaseDate : Int
    var carColour : String
    var maxWeight : Int
    var airCleaner : Bool
    
    init (name: String, releaseDate: Int, carColour: String, maxWeight: Int, airCleaner: Bool){
        self.name = name
        self.releaseDate = releaseDate
        self.carColour = carColour
        self.maxWeight = maxWeight
        self.airCleaner = airCleaner
    }
    
    func startMovement(e: engine) {
        switch e {
        case engine.on: print("You can go")
        case engine.off: print("Turn on the engine and repeat")
        }
    }
    
    func oldNew() {
        if releaseDate >= 2020 {
            print("This trunk is new")
        } else {
            print("This trunk is old")
        }
    }
    
    var brand: String {
        return name
    }
    
    var year: Int {
        return releaseDate
    }
    
    var colour: String {
        return carColour
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return String("This is \(carColour) \(name) of \(year) year edition")
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return ("\(name) \(releaseDate)")
    }
}
var alexCar = sportCar(name: "Honda", releaseDate: 2019, carColour: "Black", maxSpeed: 180, nitroOnBoard: true)
var secondCar = sportCar(name: "Kia", releaseDate: 2014, carColour: "Red", maxSpeed: 120, nitroOnBoard: false)

alexCar.windowsStatus(value: windows.open)
alexCar.startMovement(e: engine.off)
alexCar.toggleEngine(e: .off)
secondCar.toggleEngine(e: .on)
print(alexCar)
print(secondCar)

var bobbyTrunk = trunkCar(name: "MAN", releaseDate: 2017, carColour: "Gray", maxWeight: 5, airCleaner: false)
var secondTrunk = trunkCar(name: "Benz", releaseDate: 2021, carColour: "White", maxWeight: 3, airCleaner: true)

bobbyTrunk.toggleEngine(e: .off)
bobbyTrunk.windowsStatus(value: windows.close)
bobbyTrunk.startMovement(e: engine.on)
print(bobbyTrunk)
print(secondTrunk)
bobbyTrunk.oldNew()
secondTrunk.oldNew()
