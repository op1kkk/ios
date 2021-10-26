import UIKit

//Задание 1.

func oddEven (number a: Int) {
    if a%2==0 {
        print("Число \(a) - четное")
    } else {
        print("Число \(a) - нечетное")
    }
}
oddEven(number: 10)
oddEven(number: 7)

//Задание 2.

func dividedBy3 (_ a: Int) {
    if a%3==0 {
        print("Число \(a) делится на 3 без остатка")
    } else {
        print("Число \(a) не делится на 3 без остатка")
    }
}
dividedBy3(9)
dividedBy3(10)

//3. Создать возрастающий массив из 100 чисел.
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var numArray = Array(1...100)

numArray = numArray.filter{$0%2 != 0 && $0%3 == 0}
print(numArray)

/* 2 вариант
 for value in numArray{
 if value%2 == 0 {
 numArray.remove(at: numArray.firstIndex(of: value)!)
 }
 }
 print(numArray)
 for value in numArray{
 if value%3 != 0 {
 numArray.remove(at: numArray.firstIndex(of: value)!)
 }
 }
 print(numArray)
 
 */

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.

func fibonacci (n: Int) -> Int {
    var a = 0
    var b = 1
    for _ in 0..<n {
        let tmp = a
        a = b
        b = tmp + b
    }
   return b
}

var fibArray: [Int] = []
for i in 1...50 {
    fibArray.append(fibonacci(n: i))
}
print(fibArray)

/*6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно*/

var newArray = Array(2...100)
var p = newArray[0]

while (p<100) {
    for element in newArray {
        if (element>=p+2) && (element % p == 0) {
            newArray.remove(at: newArray.firstIndex(of: element)!)
        }
    }
    p+=1
}
print(newArray)
