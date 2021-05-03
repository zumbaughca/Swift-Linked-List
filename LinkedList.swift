//
//  LinkedList.swift
//  
//
//  Created by Chuck Zumbaugh on 4/6/21.
//

import Foundation

class LinkedList<T: Comparable & Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    //Create an empty list
    init() {
        self.head = nil
        self.tail = nil
    }
    
    //Create a list from array
    init(from array: [T]) {
        for val in array {
            self.append(node: Node(value: val))
        }
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func printList() {
        if isEmpty {
            print("This list is empty.")
        }
        var currentNode = head
        var string = "[\(String(describing: currentNode?.value))"
        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
            string += ", \(String(describing: currentNode?.value))"
        }
        print(string + "]")
    }
    
    //Adds the given node to the end of the list
    func append(node: Node<T>) {
        guard !isEmpty else {
            head = node
            return
        }
        
        if tail == nil {
            tail = node
            node.previousNode = head
            head?.nextNode = node
            return
        } else {
            let currentLast = tail
            currentLast?.nextNode = node
            node.previousNode = currentLast
            tail = node
            return
        }
    }
    
    //Insert a new node at the given index
    func insert(node: Node<T>, at index: Int) {
        if isEmpty && index == 0 {
            head = node
            return
        }
        
        if index == 0 {
            let currentHead = head
            head = node
            head?.nextNode = currentHead
            currentHead?.previousNode = head
            if tail == nil {
                tail = currentHead
            }
            return
        }
        var currentNode = head
        
        for _ in 0 ..< index {
            currentNode = currentNode?.nextNode
        }
        
        if currentNode != nil {
            let previousNode = currentNode?.previousNode
            previousNode?.nextNode = node
            node.previousNode = previousNode
            node.nextNode = currentNode
            currentNode?.previousNode = node
            return
        }
        //Index exceeds bounds, insert node at the end of the list
        let currentTail = tail
        currentTail?.nextNode = node
        node.previousNode = currentTail
        tail = node
        print("The index provided exceeded the bounds of the list and the node was inserted at the end. Consider using append.")
        return
        
    }
    
    //Removes and returns the first element in the list
    func removeFirst() -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        let currentHead = head
        head = head?.nextNode
        head?.previousNode = nil
        
        currentHead?.nextNode = nil
        return currentHead
        
    }
    
    //Removes and returns the last element in the list
    func removeLast() -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        if tail == nil {
            let node = head
            head = nil
            return node
        }
        
        let currentNode = tail
        let previous = tail?.previousNode
        previous?.nextNode = nil
        if previous?.previousNode == nil {
            tail = nil
        } else {
            tail = previous
        }
        currentNode?.previousNode = nil
        
        return currentNode
    }
    
    //Removes and returns the node at the given index
    func remove(at index: Int) throws -> Node<T>? {
        guard head != nil else {
            throw LinkedListErrors.emptyList
        }
        
        if index == 0 {
            let currentHead = head
            head = head?.nextNode
            return currentHead
        } else {
            var currentNode = head
            for _ in 0 ..< index {
                currentNode = currentNode?.nextNode
                if currentNode == nil {
                    throw LinkedListErrors.indexExceedsBounds
                }
            }
            let previousNode = currentNode?.previousNode
            let nextNode = currentNode?.nextNode
            currentNode?.nextNode = nil
            currentNode?.previousNode = nil
            //We are removing the tail
            if nextNode == nil {
                tail = previousNode
                previousNode?.nextNode = nil
                print("You are removing the last element in the list. Consider using removeLast() instead.")
                return currentNode
            }
            previousNode?.nextNode = nextNode
            nextNode?.previousNode = previousNode
            return currentNode
        }
    }
    
    func clearList() {
        if head == nil {
            return
        }
        while head != nil {
            removeLast()
        }
    }
}

class Node<T: Comparable & Equatable> {
    var value: T
    var nextNode: Node?
    weak var previousNode: Node?
    
    init(value: T) {
        self.value = value
    }
}


//Errors
extension LinkedList {
    private enum LinkedListErrors: Error {
        case indexExceedsBounds
        case emptyList
    }
}
