import UIKit

var str = "Hello, playground"
//
//enum Season {
//    case spring(Int, Int, Int)
//    case summer
//    case winner
//
//}
//MemoryLayout<Season>.size
//MemoryLayout<Season>.stride
//MemoryLayout<Season>.alignment

/*
var fn = {
    (v1: Int, v2: Int) -> Int in
    return v1 + v2
}
fn(10,20);

func exec(v1: Int, v2: Int, fn:(Int, Int) -> Int) {
  print(fn(v1,v2))
}

exec(v1: 20, v2: 30) { (v1, v2) -> Int in
    return v1 * 2 + v2 * 2
}

 */

//
//typealias Fn  = (Int) -> Int;
//
//func getFn() -> Fn {
//    var num: Int = 0
//    func plus(_ i:Int) -> Int{
//        num += i;
//        print("num = \(num)")
//        return num;
//    }
//    plus(1000)
//    num += 100;
//    //var fn = getFn()时，构造了num的值，num被改成 「引用类型」，
//    //print(fn(1))
//    print("num*=  = \(num)")
//
//    return plus
//}
//
//var fn = getFn()
//print(fn(1))
//print(fn(2))
//print(fn(3))
//print(fn(4))

//var max = Int8.max;
//var v2 = max &+ 1;
//print(max)
//print(v2)

//var array = [1,2,3]
//var array2:[Int] = []
////for item in array
////{
////    array2.append(item)
////}
//array2 = array.flatMap { (num : Int) -> Int in
//    return num + num
//
//}

var num = 1
//func add(_ v1: Int, _ v2: Int) -> Int { v1 + v2 }
//func sub(_ v1: Int, _ v2: Int) -> Int { v1 - v2 }
//func multiple(_ v1: Int, _ v2: Int) -> Int { v1 * v2 }
//func divide(_ v1: Int, _ v2: Int) -> Int { v1 / v2 }
//func mod(_ v1: Int, _ v2: Int) -> Int { v1 % v2 }
//
//divide(mod(sub(multiple(add(num, 3), 5), 1), 10),2)

func add (_ v: Int) -> ((Int) -> Int) {
    {$0 + v}
}
var fn = add(3)
fn(100)
