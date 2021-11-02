import UIKit

/* Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
 В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 Создать несколько объектов каждого класса. Применить к ним различные действия.
 Вывести значения свойств экземпляров в консоль.
*/
class Car {
    var brand: String
    var colour: UIColor
    var yearOfRelease: Double
    var engine: engineStatus
    let mp3: Bool
    var windows: windowsStatus
    
    enum engineStatus {
        case on, off
    }
    
    enum windowsStatus {
        case open, closed
    }
   
    init(brand: String, colour: UIColor, yearOfRelease: Double, engine: engineStatus, mp3: Bool, windows: windowsStatus) {
        self.brand = brand
        self.colour = colour
        self.yearOfRelease = yearOfRelease
        self.engine = engine
        self.mp3 = mp3
        self.windows = windows
    }
    func engineOn() {
        engine = .on
    }
    func engineOff() {
        engine = .off
    }
}

class SportCar: Car {
    let numberOfSeats: Int
    let maxSpeed: Double
    var nitro: nitroStatus
    
    enum nitroStatus {
        case on, off
    }
    
    init(brand: String, colour: UIColor, yearOfRelease: Double, engine: engineStatus, mp3: Bool, windows: windowsStatus, numberOfSeats: Int, maxSpeed: Double, nitro: nitroStatus) {
        self.numberOfSeats = numberOfSeats
        self.maxSpeed = maxSpeed
        self.nitro = nitro
        super.init(brand: brand, colour: colour, yearOfRelease: yearOfRelease, engine: engine, mp3: mp3, windows: windows)
    }
    
    override func engineOn(){
        engine = .on
        print("Warning! Turn off the engine in 1 hour!")
    }
}

class TrunkCar: Car {
    let maxTonns: Double
    var cameras: camerasStatus
    
    enum camerasStatus {
        case on, off
    }
    
    init(brand: String, colour: UIColor, yearOfRelease: Double, engine: engineStatus, mp3: Bool, windows: windowsStatus, maxTonns: Double, cameras: camerasStatus) {
        self.maxTonns = maxTonns
        self.cameras = cameras
        super.init(brand: brand, colour: colour, yearOfRelease: yearOfRelease, engine: engine, mp3: mp3, windows: windows)
    }
    
    override func engineOn(){
        print("Engine start failed. Bob's Trunk engine is still \(bobTrunk.engine)")
    }
}


var myCar = Car(brand: "Honda", colour: .blue, yearOfRelease: 2014, engine: .off, mp3: true, windows: .closed)
myCar.windows = .open
myCar.engineOn()
print("My engine is \(myCar.engine)")


var angelSuperCar = SportCar(brand: "Ferrari", colour: .white, yearOfRelease: 2021, engine: .off, mp3: true, windows: .open, numberOfSeats: 2, maxSpeed: 210, nitro: .off)
angelSuperCar.engineOn()
angelSuperCar.nitro = .on
print("angelCar nitro is \(angelSuperCar.nitro)")


var bobTrunk = TrunkCar(brand: "Benz", colour: .red, yearOfRelease: 2019, engine: .off, mp3: true, windows: .closed, maxTonns: 5, cameras: .on)
bobTrunk.engineOn()
bobTrunk.cameras = .off
bobTrunk.cameras
