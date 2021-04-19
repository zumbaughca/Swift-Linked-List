# Swift Doubly Linked List Data Structure
A doubly linked list is a set of nodes that contain pointers to the previous and next node. This data structure allows for constant time O(1) insertion/removal from the beginning or end of the list.
```

|Node 1| <---> |Node 2| <---> |Node 3| <---> |Node 4| <---> |Node 5|

```
## Methods:
* printList()
* append(node:)
* insert(node:at:)
* removeFirst()
* removeLast()
* remove(at:)
* clearList()

## Implementation details:

## printList()
Prints the list in order from head to tail
  ```
  [Node 1, Node 2, Node 3, Node 4, Node 5]
  ```
## append(node:)
Appends the given node to the end of the list. If the list is empty, the head will be the node passed to append(node:). Otherwise, this node will be the tail. The time complexity for this operation is O(1)
  ```
  |Node 1| <---> |Node 2| <---> |Node 3| <---> |Node 4| <---> |Node 5|    
                                                                           ^
                                                                        |Node 6|
                                                                        
  |Node 1| <---> |Node 2| <---> |Node 3| <---> |Node 4| <---> |Node 5| <---> |Node 6|                                                                
  
  ```

## insert(node:at:)
Inserts the node at the given index. If the index is greater than the length of the list, the node will be appended to the list and a warning message will be generated that suggests using the append method instead. The worst-case time complexity of this operation is O(n).
  ```
  |Node 1| <---> |Node 2| <---> |Node 3|
             ^
          |Node 4|
          
  |Node 1| <---> |Node 4| <---> |Node 2| <---> |Node 3|
  ```
## removeFirst()
Remove and returns the first node of the list. The time complexity for this operation is O(1).
  ```
  |Node 1| <---> |Node 2| <---> |Node 3|
  list.removeFirst() -> |Node 1|
  ```
The list is now:
  ```
  |Node 2| <---> |Node 3|
  ```

## RemoveLast()
Removes and returns the last node in the list. The time complexity for this operation is O(1).
  ```
  |Node 1| <---> |Node 2| <---> |Node 3|
  list.removeLast() -> |Node 3|
  ```
The list is now:
  ```
  |Node 1| <---> |Node 2|
  ```

## remove(at:)
Removes and returns the node at the given index. If the index is out of range an error is thrown. The worst case time complexity of this operation is O(n).
  ```
  |Node 1| <---> |Node 2| <---> |Node 3|
  list.remove(at: 1) -> |Node 2|
  ```
The list is now:
  ```
  |Node 1| <---> |Node 3|
  ```
  
## clearList()
Clears the list of all nodes. 
