import UIKit

//Задание 1. Решение квадратного уравнения 4x^2+10x+6=0

var a = 4.0
var b = 10.0
var c = 6.0

var x1 = 0.0
var x2 = 0.0


var D = pow(b,2) - 4*a*c

if (D < 0) {
    print ("Нет корней")
}

if (D == 0) {
    x1 = (-b+sqrt(D)) / (2*a)
    print("Единственный корень равен \(x1)")
}

if (D > 0) {
    x1 = (-b+sqrt(D)) / (2*a)
    x2 = (-b-sqrt(D)) / (2*a)
    print("Корни равны \(x1) и \(x2)")
}

// Задание 2 Найти площадь, периметр и гипотенузу прямоугольного треугольника(катеты даны)

let kOne = 10.0
let kTwo = 6.0

let square = 1/2*(kOne*kTwo)
print("Площадь равна \(square)")

let hypotenuse = sqrt(pow(kOne,2) + pow(kTwo,2))
print("Гипотенуза равна \(hypotenuse)")

let perimeter = kOne + kTwo + hypotenuse
print("Периметр равен \(perimeter)")

// Задание 3 Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

var deposit = 165000.0
var numberOfYears = 5.0
var yearPercentage = 4.0

var finalDeposit = deposit * (yearPercentage/100) * numberOfYears
print("Пользователь внес \(deposit) рублей под годовой процент \(yearPercentage). Сумма вклада через 5 лет будет составлять \(finalDeposit) рублей")
