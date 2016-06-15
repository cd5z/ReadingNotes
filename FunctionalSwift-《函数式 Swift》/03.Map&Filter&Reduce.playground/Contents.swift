//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func makeIncrementer() ->(Int->Int) {
    func addOne(number:Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list:[Int],condition:Int ->Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(numner:Int) ->Bool {
    return numner < 10
}

var numbers = [20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen)



numbers.map({
    (number:Int) -> Int in
    if number % 2 == 1 {
        
    }
    let result = 3 * number
    return result
})

func applyTwice(f:(Float ->Float),x:Float) ->Float {
    f(x);
    return f(x)
}

var dictionary = ["name" : "tom","age" : "21"]
var array = [10,20,45,32]
let arr = array.map({_ in "($0)?"})
print(arr)



let mappedNumbers = numbers.map({number in 3 * number})
print(mappedNumbers)

let scortedNumbers = numbers.sort({$0 > $1})
print(scortedNumbers)

class Shape {
    var numberOfSides = 0
    func simpleDescription() ->String{
        return "A Shape with \(numberOfSides) sides"
    }
}

//

let numberArray = [1,2,3,4,5]
var resultArray = ["1只","2只","3只","4只","5只"]


var stringsArray : [String] = []

for number in numberArray {
    stringsArray.append("\(number)只")
}
print(stringsArray)

resultArray = numberArray.map({"\($0)只"})
print(resultArray)


var oldArray1 = [10,20,45,32]
var newArray1 = numberArray.flatMap({
    ["\($0)个","\($0 )只"]
})
print(newArray1)

print(newArray1) // [￥10, $10,￥20, $20, ￥45, $45, ￥32, $32]


//定义数组；
var arr1 = [1,2,3,4,5]

//需要对数组中的每一个值+10操作；
func fmap(a : Int) -> Int{
    return a + 10
}

//这是采用函数的方式
//map函数里面可以直接使用函数作为参数；
var arr2 = arr1.map(fmap)
print("arr = \(arr)")
print("arr2 = \(arr2)")


// Swift语言的数组提供了一个map函数很好用，可建立一个a数组的映射数组b，即数学上的y = f(x).
//数组的操作就简洁了很多。将示例数组，每个数字都加10，获得一个新的数组：



//每个数字加10
var result = numberArray.map({($0) + 10})
print(result)

var oldArray = [10,20,45,32]
var newArray = oldArray.flatMap{
    ["￥\($0)","$\($0 )"]
}
print(newArray) // [￥10, $10,￥20, $20, ￥45, $45, ￥32, $32]

//找出大于2的
var filteredArray : [Int] = []
for number in numberArray {
    if number > 2 {
        filteredArray.append(number)
    }
}
print(filteredArray)

filteredArray = numberArray.filter({$0 > 2})
print(filteredArray)

//{$0 > 30}为筛选闭包，我们忽略了参数名而使用默认参数$0，返回类型隐式推断为Bool

var sum = 0
for number in numberArray {
    sum += number
}
print(sum)

var product = 1
for number in numberArray {
    product = product * number
}
print(product)


sum = numberArray.reduce(0, combine: {$0 + $1})
print(sum)

sum = numberArray.reduce(0, combine: +)