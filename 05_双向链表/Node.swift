//
//  Node.swift
//  05_双向链表
//
//  Created by XFB on 2021/7/1.
//

import Foundation

class Node<T> {
    
    var value: T
    var next: Node?
    weak var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}
