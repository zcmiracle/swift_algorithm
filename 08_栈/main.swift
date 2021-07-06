//
//  main.swift
//  08_栈
//
//  Created by XFB on 2021/7/5.
//

import Foundation

func isValid(_ s: String) -> Bool {
    
    var stack = Stack<String>()
    for char in s {
        
        if char == "(" || char == "[" || char == "{" { // 左括号
            stack.push("\(char)")
            
        } else { // 右括号
            
            if stack.isEmpty {
                return false
            }
            
            let left = stack.pop()
            if left == "(" && char != ")" {
                return false
            }
            
            if left == "[" && char != "]" {
                return false
            }
            
            if left == "{" && char != "}" {
                return false
            }
            
        }
        
    }
    return stack.count == 0
}

