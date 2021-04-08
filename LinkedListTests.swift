//
//  LinkedListTests.swift
//  
//
//  Created by Chuck Zumbaugh on 4/6/21.
//

import Foundation
import XCTest

class LinkedListTests: XCTestCase {
    var testList: LinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        testList = LinkedList<Int>()
    }

    func testAppend() {
        XCTAssertNil(testList.head)
        testList.append(node: Node(value: 1))
        XCTAssertEqual(testList.head?.value, 1, "Head is not correctly set after first append")
        testList.append(node: Node(value: 2))
        XCTAssertEqual(testList.tail?.value, 2, "Tail is not correctly set after second append")
        XCTAssertEqual(testList.head?.value, 1, "Head incorrectly changed after second append")
        testList.append(node: Node(value: 3))
        XCTAssertEqual(testList.tail?.value, 3, "Tail incorrectly modified during append")
        XCTAssertEqual(testList.head?.value, 1, "Head incorrectly modified")
        XCTAssertEqual(testList.head?.nextNode?.value, 2, "Previous tail incorrectly modified")
    }
    
    func testClear() {
        testList.clearList()
        XCTAssertNil(testList.head)
    }
    
    func testRemoveLast() {
        testList.append(node: Node(value: 1))
        testList.append(node: Node(value: 2))
        testList.append(node: Node(value: 3))
        XCTAssertEqual(testList.removeLast()?.value, 3, "\(String(describing: testList.removeLast()?.value)) is not equal to 3")
        XCTAssertEqual(testList.removeLast()?.value, 2, "\(testList.removeLast()?.value) is not equal to 2")
        XCTAssertEqual(testList.removeLast()?.value, 1, "\(testList.removeLast()?.value) is not equal to 1")
        XCTAssert(testList.head == nil, "\(testList.head?.value) is not nil")
    }
    
    func testInsert() {
        testList.clearList()
        testList.insert(node: Node(value: 1), at: 0)
        XCTAssert(testList.head?.value == 1, "\(testList.head?.value) is not 1)")
        testList.insert(node: Node(value: 2), at: 0)
        XCTAssert(testList.head?.value == 2, "\(testList.head?.value) is not 2")
        XCTAssertEqual(testList.head?.nextNode?.value, 1, "\(testList.head?.nextNode?.value) is not 1")
        testList.insert(node: Node(value: 3), at: 1)
        XCTAssert(testList.head?.nextNode?.value == 3, "\(testList.head?.nextNode?.value) is not 3")
        XCTAssert(testList.head?.value == 2, "\(testList.head?.value) is not 2")
        XCTAssert(testList.head?.nextNode?.nextNode?.value == 1, "\(testList.head?.nextNode?.nextNode?.value) is not 1")
        XCTAssertEqual(testList.head?.nextNode?.nextNode?.previousNode?.value, 3)
        XCTAssertEqual(testList.tail?.value, 1)
        testList.insert(node: Node(value: 4), at: 4)
        XCTAssertEqual(testList.tail?.value, 4)
        XCTAssertEqual(testList.tail?.previousNode?.value, 1)
    }
    
    func testRemove() {
        testList.clearList()
        testList.append(node: Node(value: 1))
        testList.append(node: Node(value: 2))
        testList.append(node: Node(value: 3))
        testList.append(node: Node(value: 4))
        XCTAssertThrowsError(try testList.remove(at: 4))
        XCTAssertEqual(try testList.remove(at: 2)?.value, 3)
        XCTAssertEqual(testList.tail?.previousNode?.value, 2)
        XCTAssertEqual(try testList.remove(at: 2)?.value, 4)
        XCTAssertEqual(testList.tail?.value, 2)
        try? testList.remove(at: 1)
        try? testList.remove(at: 0)
        XCTAssertNil(testList?.head)
        XCTAssertThrowsError(try testList.remove(at: 0))
    }
    
    func testRemoveFirst() {
        testList.clearList()
        testList.append(node: Node(value: 1))
        testList.append(node: Node(value: 2))
        testList.append(node: Node(value: 3))
        XCTAssertEqual(testList.removeFirst()?.value, 1)
        XCTAssertEqual(testList.head?.value, 2)
        testList.removeFirst()
        testList.removeFirst()
        XCTAssertNil(testList.head)
    }
}
