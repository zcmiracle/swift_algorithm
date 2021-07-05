//
//  ListNode.swift
//  07_单向循环链表
//
//  Created by XFB on 2021/7/3.
//

import Foundation

class ListNode<T>: CustomStringConvertible {
    var element: T?
    var next: ListNode?
    
    init(element: T?, next: ListNode?) {
        self.element = element
        self.next = next
    }
    
    var description: String {
        guard let next = next else {
            return "\(element)"
        }
        return "\(element)->" + String(describing: next) + " "
    }
}

