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
    
    var count: Int {
        guard var node = first else {
            return 0
        }
        var nodeCout = 0;
        while let next = node.next {
            node = next
            nodeCout += 1
        }
        return nodeCout
    }
    
    // 查找节点
    func getNode(index: Int) -> Node<T>? {
        
        if index == 0 {
            return first
        }
        if index > count {
            return nil
        }

        var node = first?.next
        for _ in 1..<index {
            node = node?.next
            if node == nil {
                break
            }
        }
        return node
    
    }
    
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
    
    // 头结点插入
    func insertHeadNode(value: T) {
        let newNode = Node(value: value)
        if var head = first {
            newNode.next = head
            head.previous = newNode
            head = newNode
        }
    }
    
    // 插入节点 任意位置
    func insertNode(_ value: T, index: Int) {
        if index < 0 {
            return
        }
        
        let newNode = Node(value: value)
        if count == 0 {
            first = newNode
        } else {
            if index == 0 {
                newNode.next = first
                first?.previous = newNode
                first = newNode
            } else {
                if index > count {
                    return
                }
                
                let previousNode = getNode(index: index-1)  // 上一个节点
                let nextNode = previousNode?.next           // 下一个节点
                
                // 上一个节点 的 next 是 newNode
                previousNode?.next = newNode
                // 下一个节点的previous = newNode
                nextNode?.previous = newNode
                // 新节点的 previous 是 previousNode
                newNode.previous = previousNode
                // 新节点的next 是 nextNode
                newNode.next = nextNode

            }
        }
    }
    
    // 删除节点
    func removeNode(node: Node<T>) -> T? {
        guard first != nil else {
            return nil
        }
        
        let previous = node.previous
        let next = node.next
        
        // 当previous == nil，就是first节点
        if let prev = previous {
            prev.next = next
        } else {
            first = next
        }
        next?.previous = previous
        
        // 清空node节点信息
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    // 删除某个位置的节点
    func removeNode(atIndex index : Int) -> T? {
        if first == nil {
            return nil
        }
        
        let node = getNode(index: index)
        let prevoious = node?.previous
        let next = node?.next
        
        // 当节点 previous == nil，即 first 节点
        if prevoious != nil {
            prevoious?.next = next
        } else {
            first = next
        }
        
        next?.previous = prevoious
        
        // 清空node节点信息
        node?.previous = nil
        node?.next = nil
        
        return node?.value
    }
    
    
    // size 或者 count
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
    func searchNode(indexNode: Node<T>) -> Int {
        if let node = first {   // 如果first存在
            
            if node === indexNode {
                return 0
            } else {
                var index : Int = 0
                var node = first?.next
                
                while node != nil {
                    index += 1
                    if node === indexNode {
                        return index
                    }
                    node = node?.next
                }
                return -1
            }
            
        } else {
            return -1
        }
    }
    
    // 查找指定 位置 节点
    func searchIndex(index: Int) -> Node<T>? {
        guard let node = first else {
            return nil
        }
        
        if index == 0 {
            return node
        } else {
            var node = node.next
            var nodeIndex: Int = 1
            
            while node != nil {
                if nodeIndex == index {
                    return node
                }
                nodeIndex += 1
                node = node?.next
            }
            return nil
        }
    }
    
    
    
    
}
