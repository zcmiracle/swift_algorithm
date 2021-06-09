//
//  main.swift
//  01_Fibonacci
//
//  Created by XFB on 2021/6/9.
//

import Foundation

// 斐波拉契
// 0 1 1 2 3 5 8 13 21 34 55 89 ...

func fib(n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fib(n: n-1) + fib(n: n-2)
}

func fib1(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fib1(n-1) + fib1(n-2)
}


func fib2(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    // 从2开始
    var first = 0
    var second = 1
    var sum = 0;
    for _ in 1..<n {
        sum = first + second
        first = second
        second = sum
    }
    return second
}


// reduce 计算，可以对数组的元素进行计算
typealias Fibonacci = (last: Int, next: Int)
func fib3(_ n: Int) -> Int {
    return (Array(1..<n).reduce(Fibonacci(last:0, next:1)) { acci, _ in
        return (acci.next, acci.last + acci.next)
    }).next
}


//print(fib(n: 64))
//print(fib1(64))

print(fib2(64))
print(fib3(64))


