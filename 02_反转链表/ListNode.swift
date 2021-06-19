//
//  ListNode.swift
//  02_反转链表
//
//  Created by XFB on 2021/6/16.
//

import Foundation

public class ListNode {

    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//public class ListNode: Equatable {
//    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
//        return lhs === rhs
//    }
//    
//    public var val: Int
//    public var next: ListNode?
//    public init() {
//        self.val = 0
//        self.next = nil
//    }
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//    public init(_ val: Int, _ next: ListNode?) {
//        self.val = val
//        self.next = next
//    }
//}
