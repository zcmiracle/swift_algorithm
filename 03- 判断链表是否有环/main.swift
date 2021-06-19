//
//  main.swift
//  03- 判断链表是否有环
//
//  Created by XFB on 2021/6/16.
//  https://leetcode-cn.com/problems/linked-list-cycle/

import Foundation

// 快慢指针
func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil || head?.next == nil {
        return false
    }
    
    var slow = head
    var fast = head?.next
    
    while fast != nil && fast?.next != nil {
        // Operator function '==' requires that 'ListNode' conform to 'Equatable'
        // 3个等号 ===
        if slow === fast {
            return true
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return false
    
}
