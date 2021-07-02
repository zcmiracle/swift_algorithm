//
//  ListNode.swift
//  06_双向链表1
//
//  Created by XFB on 2021/7/2.
//

import Foundation


class ListNode<T> {
    var element: T?
    var next: ListNode?
    weak var previous: ListNode?
    
    init(element: T?, next: ListNode?, previous: ListNode?) {
        self.element = element
        self.next = next
        self.previous = previous
    }
    
    var description: String {
        return element.debugDescription
    }
}
