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
Appends the given node to the end of the list. If the list is empty, the head will be the node passed to append(node:). Otherwise, this node will be the tail.
  ```
  |Node 1| <---> |Node 2| <---> |Node 3| <---> |Node 4| <---> |Node 5|    
                                                                           ^
                                                                           |
                                                                        |Node 6|
  |Node 1| <---> |Node 2| <---> |Node 3| <---> |Node 4| <---> |Node 5| <---> |Node 6|                                                                
  
  ```
