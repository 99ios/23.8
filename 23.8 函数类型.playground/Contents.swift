//: Playground - noun: a place where people can play

import UIKit

/******************1.函数类型*******************/
func addTwo( a : Int, b: Int)-> Int{
    return a+b
}
var sumTwo: (Int, Int)-> Int = addTwo
//也可以简写 var sumTwo = addTwo
sumTwo(1,3)


func printAddTwo(addTwo: (Int,Int)->Int,a: Int, b: Int){
    print("\(addTwo(a,b))")
    //打印结果:3
}
printAddTwo(addTwo: addTwo, a: 1, b: 2)


func returnAddFunc()->((Int,Int)->Int){
    return addTwo
}
let addFunc = returnAddFunc()
addFunc(1,2) //打印结果：3


/******************2.嵌套函数*******************/
func returnMinusFunc()->((Int, Int)->Int){
    func minusFunc(a: Int, b: Int)->Int{
        return a-b
    }
    return minusFunc
}
let minusTwoInt = returnMinusFunc()
print(minusTwoInt(5,1)) //打印：4


/******************3.示例代码*******************/
func avanceFunc(multi: Int, choose: Int)->((Int,Int)->Int){
    var base = 2
    func addFunc(a: Int, b: Int)->Int{
        print("addFunc 函数中 base 变量:\(base)")
        base = a + b //base只是主函数base变量的一个值拷贝
        return base * multi
    }
    
    func minusFunc(a: Int, b: Int)->Int{
        //base只是主函数base变量的一个值拷贝
        print("minusFunc 函数中 base 变量:\(base)")
        base = a - b
        return base * multi
    }
    //base 变量的值不会因为嵌套函数而改变
    print("advanceFunc 函数中 base 变量:\(base)")
    return choose == 1 ? addFunc : minusFunc;
}

let add = avanceFunc(multi: 2, choose: 1)

print(add(2,1))

print()
let minus1 = avanceFunc(multi: 2, choose: 2)

print(minus1(2,1))
