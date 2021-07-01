//
//  main.swift
//  04_删除链表中的节点
//
//  Created by XFB on 2021/6/19.
//  https://leetcode-cn.com/problems/delete-node-in-a-linked-list/

import Foundation


/**
 请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点。传入函数的唯一参数为 要被删除的节点 。

 现有一个链表 -- head = [4,5,1,9]，它可以表示为:

 示例 1：
 输入：head = [4,5,1,9], node = 5
 输出：[4,1,9]
 解释：给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
 
 示例 2：
 输入：head = [4,5,1,9], node = 1
 输出：[4,5,9]
 解释：给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
  

 提示：
 链表至少包含两个节点。
 链表中所有节点的值都是唯一的。
 给定的节点为非末尾节点并且一定是链表中的一个有效节点。
 不要从你的函数中返回任何结果。

 */


func deleteNode(_ node: ListNode?) {
    
    guard let currentNode = node, let next = node?.next else {
        return
    }
    
    currentNode.val = next.val
    currentNode.next = next.next
    
//    if node != nil && node?.next != nil {
////        node!.val = (node?.next!.val)!
//        node?.val = node?.next?.val ?? -1
//        node?.next = node?.next?.next
//    }
    
}




/**
 
 双指针：
 1、定义两个指针，分别指向 当前遍历的节点 和 上一次遍历的节点
 2、遍历原链表，当且仅当 遍历完 整条链表 或是 找到目标节点，结束遍历
 3、根据当前节点 的情况，对 前驱节点的next属性 进行尾加
 
 */
func deleteNode1(_ head: ListNode?, _ val: Int) -> ListNode? {
    
    if head == nil {
        return head
    }
    
    if head?.val == val {
        return head?.next
    }
    
    // 上一个节点
    var preNode = head
    // 当前节点
    var curNode = head?.next
    
    // 如果不相等就往后延，如果找到相等的，就跳出循环，处理将相等的节点干掉
    while curNode != nil, curNode?.val != val {
        preNode = curNode
        curNode = curNode?.next
    }
    
    preNode?.next = curNode?.next

    return head
}

