import UIKit

enum mouseStoreError: Error {
    case invalidSelection
    case outOfStock
    case notEnoughMoney(moneyNeeded: Double)
}

enum mouses {
    case logitech
    case zowie
    case razer
    case steelseries
}

struct Mouses {
    var brand: mouses
    var count: Int
    var price: Double
}

class Store {
    var mouseType = ["Logitech": Mouses(brand: .logitech, count: 9, price: 505.5),
                     "Zowie": Mouses(brand: .zowie, count: 2, price: 190),
                      "Razer": Mouses(brand: .razer, count: 7, price: 460),
                      "SteelSeries": Mouses(brand: .steelseries, count: 0, price: 150)]
    
    var moneyDeposit: Double = 0
    
    func buyMouse(mouse name: String) throws {
        guard var value = mouseType[name] else {
            throw mouseStoreError.invalidSelection
        }
        guard value.count > 0 else {
            throw mouseStoreError.outOfStock
        }
        guard value.price <= moneyDeposit else {
            throw mouseStoreError.notEnoughMoney(moneyNeeded: value.price - moneyDeposit)
        }
        moneyDeposit -= value.price
        value.count -= 1
        mouseType[name] = value
        print("\(name) was succesfully bought")
    }
}

var wonnaBuyMouse = Store()
wonnaBuyMouse.moneyDeposit = 199


do {
    try wonnaBuyMouse.buyMouse(mouse: "X7")
} catch mouseStoreError.invalidSelection {
    print("Wrong choice")
} catch mouseStoreError.outOfStock {
    print("No more devices")
} catch mouseStoreError.notEnoughMoney(let moneyNeeded) {
    print("Not enough money, add \(moneyNeeded)")
}


do {
    try wonnaBuyMouse.buyMouse(mouse: "SteelSeries")
} catch mouseStoreError.invalidSelection {
    print("Wrong choice")
} catch mouseStoreError.outOfStock {
    print("No more devices")
} catch mouseStoreError.notEnoughMoney(let moneyNeeded) {
    print("Not enough money, add \(moneyNeeded)")
}

do {
    try wonnaBuyMouse.buyMouse(mouse: "Logitech")
} catch mouseStoreError.invalidSelection {
    print("Wrong choice")
} catch mouseStoreError.outOfStock {
    print("No more devices")
} catch mouseStoreError.notEnoughMoney(let moneyNeeded) {
    print("Not enough money, add \(moneyNeeded)")
}

try wonnaBuyMouse.buyMouse(mouse: "Zowie")

