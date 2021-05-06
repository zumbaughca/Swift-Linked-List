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
        testList.append(value: 1)
        XCTAssertEqual(testList.head?.value, 1, "Head is not correctly set after first append")
        testList.append(value: 2)
        XCTAssertEqual(testList.tail?.value, 2, "Tail is not correctly set after second append")
        XCTAssertEqual(testList.head?.value, 1, "Head incorrectly changed after second append")
        testList.append(value: 3)
        XCTAssertEqual(testList.tail?.value, 3, "Tail incorrectly modified during append")
        XCTAssertEqual(testList.head?.value, 1, "Head incorrectly modified")
        XCTAssertEqual(testList.head?.nextNode?.value, 2, "Previous tail incorrectly modified")
    }
    
    func testClear() {
        testList.clearList()
        XCTAssertNil(testList.head)
    }
    
    func testRemoveLast() {
        testList.append(value: 1)
        testList.append(value: 2)
        testList.append(value: 3)
        XCTAssertEqual(testList.removeLast(), 3, "\(String(describing: testList.removeLast())) is not equal to 3")
        XCTAssertEqual(testList.removeLast(), 2, "\(testList.removeLast()) is not equal to 2")
        XCTAssertEqual(testList.removeLast(), 1, "\(testList.removeLast()) is not equal to 1")
        XCTAssert(testList.head == nil, "\(testList.head?.value) is not nil")
    }
    
    func testInsert() {
        testList.clearList()
        testList.insert(value: 1, at: 0)
        XCTAssert(testList.head?.value == 1, "\(testList.head?.value) is not 1)")
        testList.insert(value: 2, at: 0)
        XCTAssert(testList.head?.value == 2, "\(testList.head?.value) is not 2")
        XCTAssertEqual(testList.head?.nextNode?.value, 1, "\(testList.head?.nextNode?.value) is not 1")
        testList.insert(value: 3, at: 1)
        XCTAssert(testList.head?.nextNode?.value == 3, "\(testList.head?.nextNode?.value) is not 3")
        XCTAssert(testList.head?.value == 2, "\(testList.head?.value) is not 2")
        XCTAssert(testList.head?.nextNode?.nextNode?.value == 1, "\(testList.head?.nextNode?.nextNode?.value) is not 1")
        XCTAssertEqual(testList.head?.nextNode?.nextNode?.previousNode?.value, 3)
        XCTAssertEqual(testList.tail?.value, 1)
        testList.insert(value: 4, at: 4)
        XCTAssertEqual(testList.tail?.value, 4)
        XCTAssertEqual(testList.tail?.previousNode?.value, 1)
    }
    
    func testRemove() {
        testList.clearList()
        testList.append(value: 1)
        testList.append(value: 2)
        testList.append(value: 3)
        testList.append(value: 4)
        XCTAssertThrowsError(try testList.remove(at: 4))
        XCTAssertEqual(try testList.remove(at: 2), 3)
        XCTAssertEqual(testList.tail?.previousNode?.value, 2)
        XCTAssertEqual(try testList.remove(at: 2), 4)
        XCTAssertEqual(testList.tail?.value, 2)
        try? testList.remove(at: 1)
        try? testList.remove(at: 0)
        XCTAssertNil(testList?.head)
        XCTAssertThrowsError(try testList.remove(at: 0))
    }
    
    func testRemoveFirst() {
        testList.clearList()
        testList.append(value: 1)
        testList.append(value: 2)
        testList.append(value: 3)
        XCTAssertEqual(testList.removeFirst(), 1)
        XCTAssertEqual(testList.head?.value, 2)
        testList.removeFirst()
        testList.removeFirst()
        XCTAssertNil(testList.head)
    }
    
    func testInitFromArray() {
        let testIntArray = [1, 2, 3, 4, 5]
        let intList = LinkedList(from: testIntArray)
        XCTAssertEqual(intList.head?.value, 1)
        XCTAssertNil(intList.head?.previousNode)
        XCTAssertEqual(intList.head?.nextNode?.value, 2)
        XCTAssertEqual(intList.tail?.value, 5)
        XCTAssertEqual(intList.tail?.previousNode?.value, 4)
        let testStringArray = ["one", "two", "three", "four"]
        let stringList = LinkedList(from: testStringArray)
        XCTAssertEqual(stringList.head?.value, "one")
        XCTAssertNil(stringList.head?.previousNode)
        XCTAssertEqual(stringList.head?.nextNode?.value, "two")
        XCTAssertEqual(stringList.tail?.value, "four")
        XCTAssertEqual(stringList.tail?.previousNode?.value, "three")
    }
    
    func testInitWithValue() {
        let list = LinkedList(value: 2)
        XCTAssertEqual(list.head?.value, 2)
    }

}
