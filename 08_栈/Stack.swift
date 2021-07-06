//
//  Stack.swift
//  08_栈
//
//  Created by XFB on 2021/7/5.
//

import Foundation

// 栈
struct Stack<Element> {
    var array: [Element] = []
    
    var isEmpty:Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }

    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
       return array.popLast()
    }
}
