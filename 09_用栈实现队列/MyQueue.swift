//
//  MyQueue.swift
//  09_用栈实现队列
//
//  Created by XFB on 2021/7/6.
//

import Foundation

class MyQueue {
    
    var inStack: [Int] = []
    var outStack: [Int] = []

    init() {

    }
    
    // 入队
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    // 出队
    func pop() -> Int {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
        return outStack.popLast() ?? -1
    }
    
    // 获取队头元素
    func peek() -> Int {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.append(inStack.removeLast())
            }
        }
        return outStack.last ?? -1
    }
    
    // 是否为空格
    func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
    }
}
