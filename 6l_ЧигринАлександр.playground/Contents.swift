import UIKit
import CoreFoundation
import Foundation

// 1. Реализовать очередь (с дженериками)
// 2. Добавить методы высшего порядка(пример filter для массива)
// 3. добавить свой сабскрипт который будет возвращать nil в случае обращения к несущ. индексу

struct Queue<Obj: Comparable> {
    
    var elements = [Obj]()
    
    mutating func add (_ element: Obj) {
        elements.append(element)
    }
    
    mutating func remove() -> Obj {
        elements.removeFirst()
    }
    
    mutating func surnameSort() {
        elements = elements.sorted()
    }
    
    subscript(index: Int?) -> Obj? {
        get {
            if index != nil && index! < elements.count {
                return elements[index!]
            } else {
                return nil
            }
        }
        set {
            elements.append(newValue!)
        }
    }
   
}

var peopleQ = Queue<String>()
peopleQ.add("Alex")
peopleQ.add("Bob")
peopleQ.add("Nancy")
peopleQ.add("Antony")
peopleQ.add("Andrew")
peopleQ.add("Katrin")
peopleQ.add("Max")

print(peopleQ)
peopleQ.remove()
print(peopleQ)

peopleQ[2]
peopleQ[10]

peopleQ[10] = "Loli"
print(peopleQ)

peopleQ.surnameSort()
print(peopleQ)
