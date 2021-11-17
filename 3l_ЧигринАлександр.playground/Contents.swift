import UIKit

/*1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
 
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.*/

enum engineStatus {
    case eOn, eOff
}

enum windowsStatus {
    case wOpen, wClosed
}

enum trunkStatus {
    case tFull, tEmpty
}

enum trunkSizeActions {
    case add(liter: Double)
    case minus(liter: Double)
}



struct sportCar {
    let carBrand:String
    let yearOfRelease: Int
    var color: String
    mutating   func newColor(c: String) {
        switch c {
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        case "black":
            self.color = "black"
        case "white":
            self.color = "white"
        default:
            print("Error")
        }
    }
    var trunkSize: Double {
        willSet(newValue) {
            if (trunkSize>0) && (newValue<trunkSize) && (trunkFull == .tEmpty) && (trunkSize != 0) {
                let newSize = trunkSize - newValue
                print("free space is \(newSize)")
            } else {
                print("Trunk is already full")
            }
        }
    }
    var engineStatus: engineStatus {
        willSet(newValue) {
            if newValue == .eOn {
                print("\(carBrand) Engine is on")
            } else if newValue == .eOff {
                print ("\(carBrand) Engine is off")
            } else {
                print("Unknown engine status")}
        }
    }
    var windowsOpen: windowsStatus {
        willSet(newValue) {
            if newValue == .wOpen {
                print("\(carBrand) Windows are open")
            } else {
                print ("\(carBrand) Windows are closed")}
        }
    }
    var trunkFull: trunkStatus {
        willSet {
            if newValue == .tEmpty {
                print("Trunk is empty")
            } else {
                print("Trunk is full")
            }
        }
    }
}

struct trunkCar {
    let carBrand:String
    let yearOfRelease: Int
    var color: String
    mutating   func newColor(c: String) {
        switch c {
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        case "black":
            self.color = "black"
        case "white":
            self.color = "white"
        default:
            print("Error")
        }
    }
    let trunkSize: Double
    var engineStatus: engineStatus {
        willSet(newValue) {
            if newValue == .eOn {
                print("\(carBrand) Engine is on")
            } else if newValue == .eOff {
                print ("\(carBrand) Engine is off")
            } else {
                print("Unknown engine status")}
        }
    }
    var windowsOpen: windowsStatus {
        willSet(newValue) {
            if newValue == .wOpen {
                print("\(carBrand) Windows are open")
            } else {
                print ("\(carBrand) Windows are closed")}
        }
    }
    var bodyFull:trunkSizeActions
}

var myCar = sportCar(carBrand: "Honda", yearOfRelease: 2014, color: "red", trunkSize: 300, engineStatus: .eOn, windowsOpen: .wClosed, trunkFull: .tEmpty)

myCar.engineStatus = .eOff
myCar.newColor(c: "blue")
myCar.color
myCar.trunkSize = 200
myCar.windowsOpen = .wOpen
myCar.newColor(c: "black")
myCar.color

var eddieTruck = trunkCar(carBrand: "Man", yearOfRelease: 2019, color: "pink", trunkSize: 560, engineStatus: .eOff, windowsOpen: .wClosed, bodyFull: trunkSizeActions.add(liter: 20))

eddieTruck.bodyFull = trunkSizeActions.add(liter: 20)
eddieTruck.bodyFull
eddieTruck.engineStatus = .eOn
eddieTruck.color
eddieTruck.newColor(c: "white")
eddieTruck.color
eddieTruck.windowsOpen = .wOpen







