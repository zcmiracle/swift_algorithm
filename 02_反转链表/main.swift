//
//  main.swift
//  02_反转链表
//
//  Created by XFB on 2021/6/16.
//  https://leetcode-cn.com/problems/reverse-linked-list/

import Foundation

func reverseList(_ head: ListNode?) -> ListNode? {
    var head = head
    var new_head : ListNode?
    while head != nil {
        // temp指向头结点的下一个
        let temp = head?.next
        // head.next 指向 new_head
        head?.next = new_head
        // new_head 指向 head
        new_head = head
        // head 指向 temp
        head = temp
    }
    return new_head
}

var one = ListNode(1)
let two = ListNode(2)
let three = ListNode(3)
let four = ListNode(4)
let five = ListNode(5)

one.next = two
two.next = three
three.next = four
four.next = five



