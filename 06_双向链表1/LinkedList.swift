//
//  LinkedList.swift
//  06_双向链表1
//
//  Created by XFB on 2021/7/2.
//

import Foundation

class LinkedList<T> {
    
    typealias Node = ListNode<T>

    private var first: Node?    // 头节点
    private var last: Node?     // 尾节点
    private var size = 0
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    // MARK: - 删除所有节点
    func clear() {
        size = 0
        first = nil
        last = nil
    }

    // MARK: - 获取index位置对应的节点对象
    func getNode(index: Int) -> Node? {
        // size >> 1 是 size的一半
        if index < (size >> 1) { // 从左侧开始找
            var node = first
            for _ in 0..<index {
                node = node?.next
            }
            return node
        } else { // 从右侧开始找
            var node = last
            for _ in (index+1 ... (size-1)).reversed() {
                node = node?.previous
            }
            return node
        }
    }
    
    
    // MARK: - 添加节点到指定位置
    func add(element: T?, index: Int) {
        
        if index < 0 || index > size {
            fatalError("Index out of range in add LinkeList")
        }
        
        if index == size {  // 往最后添加元素(节点)
            
            let oldLast = last
            last = Node.init(element: element, next: nil, previous: oldLast)
            if size == 0 { // 添加第一个元素
                first = last
            } else {
                oldLast?.next = last
            }
            
        } else {
            
            // 添加新节点的next，就是当前index所在的节点
            let current = getNode(index: index)
            // 添加新节点的previous，就是当前所在节点的previous
            let previous = current?.previous
            
            // 创建新节点
            let new_node = Node.init(element: element, next: current, previous: previous)
            // 当前节点的previous 是新创建的节点
            current?.previous = new_node
            
            // 判断边界or临界值
            if previous == nil { // 等价于 index == 0
                first = new_node
            } else {
                // 上一个节点的next 是新创建的节点
                previous?.next = new_node
            }
            
        }
        size += 1
    }
    
    // MARK: - 删除指定位置节点
    func remove(index: Int) {
        
        let currentNode = getNode(index: index)
        let previous = currentNode?.previous
        let next = currentNode?.next

        // 边界处理
        if previous == nil { // 等价于index == 0
            first = next
        } else {
            previous?.next = currentNode
        }
        
        if next == nil {  // 等价于 index = size-1
            last = previous
        } else {
            next?.previous = previous
        }
        size -= 1
    }
    
}
