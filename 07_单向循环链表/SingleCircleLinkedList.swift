//
//  SingleCircleLinkedList.swift
//  07_单向循环链表
//
//  Created by XFB on 2021/7/3.
//

import Foundation

class SingleCircleLinkedList<T> {

    typealias Node = ListNode<T>
    private var first: Node?    // 头节点
    private var last: Node?     // 尾节点
    
    private var size = 0
    
    func getSize() -> Int {
        return size;
    }
    
    func isEmpty() -> Bool {
        return first == nil
    }
    
    func clear() {
        size = 0
        first = nil
    }

    func getNode(index: Int) -> Node? {
        // 边界判断
        if index < 0 || index >= size {
            return nil
        }
        var node = first?.next
        for _ in 0..<index {
            node = node?.next
        }
        return node
    }
    
    // MARK: - 指定位置添加节点
    func add(element: T?, index: Int) {
        if index < 0 || index >= size {
            return
        }
        
        if index == 0 {
            let new_First = Node(element: element, next: first)
            let last = (size == 0) ? new_First : getNode(index: size-1)
            last?.next = new_First
            first = new_First
        } else {
            let previous = getNode(index: index-1)
            previous?.next = Node(element: element, next: previous?.next)
        }
        size += 1
    }
    
    func remove(index: Int) {
        if index < 0 || index >= size {
            return
        }
        
        var node = first;
        if index == 0 {

            if size == 1 {
                first = nil
            } else {
                last = getNode(index: size-1);
                first = first?.next
                last?.next = first
            }

        } else {
            let previous = getNode(index: index - 1)
            node = previous?.next
            previous?.next = node?.next
        }
        
        size -= 1
    }
    
}
