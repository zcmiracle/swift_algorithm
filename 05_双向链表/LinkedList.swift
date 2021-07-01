//
//  LinkList.swift
//  05_双向链表
//
//  Created by XFB on 2021/7/1.
//

import Foundation

class LinkedList<T> {
    
    var first: Node<T>?
    var last: Node<T>?
    
    // add 添加节点到末尾 画图分析
    func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = last { // 有尾节点
            newNode.previous = tailNode
            tailNode.next = newNode
        } else { // 暂无节点
            first = newNode
        }
        last = newNode
    }
    
    // size
    func linkedListSize() -> Int {
        if let node = first {
            var index = 1
            var node = node.next
            while node != nil {
                index += 1
                node = node?.next
            }
            return index
        } else {
            return 0
        }
    }
    
    
    // search
    func searchNode(indexNode: Node) -> Int {
        if let node = first {
            if node === indexNode {
                return 0
            }
        } else {
            
        }
    }
    
    
}
