
// -------------------------------------------------------------------------
/**
 *  This class contains the methods of Doubly Linked List.
 *
 *  @author  Alex Mahon 17335349
 *  @version 09/10/18 11:13:22
 */


/**
 * Class DoublyLinkedList: implements a *generic* Doubly Linked List.
 * @param <T> This is a type parameter. T is used as a class name in the
 * definition of this class.
 *
 * When creating a new DoublyLinkedList, T should be instantiated with an
 * actual class name that extends the class Comparable.
 * Such classes include String and Integer.
 *
 * For example to create a new DoublyLinkedList class containing String data: 
 *    DoublyLinkedList<String> myStringList = new DoublyLinkedList<String>();
 *
 * The class offers a toString() method which returns a comma-separated sting of
 * all elements in the data structure.
 * 
 * This is a bare minimum class you would need to completely implement.
 * You can add additional methods to support your code. Each method will need
 * to be tested by your jUnit tests -- for simplicity in jUnit testing
 * introduce only public methods.
 */
class DoublyLinkedList<T extends Comparable<T>>
{

    /**
     * private class DLLNode: implements a *generic* Doubly Linked List node.
     */
    private class DLLNode
    {
        public final T data; // this field should never be updated. It gets its
                             // value once from the constructor DLLNode.
        public DLLNode next;
        public DLLNode prev;
    
        /**
         * Constructor
         * @param theData : data of type T, to be stored in the node
         * @param prevNode : the previous Node in the Doubly Linked List
         * @param nextNode : the next Node in the Doubly Linked List
         * @return DLLNode
         */
        public DLLNode(T theData, DLLNode prevNode, DLLNode nextNode) 
        {
          data = theData;
          prev = prevNode;
          next = nextNode;
        }
    }
    
    private final int MAX_LIST_SIZE = 1000000;

    // Fields head and tail point to the first and last nodes of the list.
    private DLLNode head, tail;

    /**
     * Constructor of an empty DLL
     * @return DoublyLinkedList
     */
    public DoublyLinkedList() 
    {
      head = null;
      tail = null;
    }

    /**
     * Tests if the doubly linked list is empty
     * @return true if list is empty, and false otherwise
     *
     * Worst-case asymptotic running time cost: Θ(1)
     *
     * Justification:
     *  Since the method is always one command long the running time is always O(1).
     */
    public boolean isEmpty()
    {
      if (head == null) {
    	  return true;
      }
      else return false;
    }

    /**
     * Inserts an element in the doubly linked list
     * @param pos : The integer location at which the new data should be
     *      inserted in the list. We assume that the first position in the list
     *      is 0 (zero). If pos is less than 0 then add to the head of the list.
     *      If pos is greater or equal to the size of the list then add the
     *      element at the end of the list.
     * @param data : The new data of class T that needs to be added to the list
     * @param listSize 
     * @return none
     *
     * Worst-case asymptotic running time cost: Θ(n)
     *
     * Justification:
     *  worst case running time: the new element is inserted at the end (or if the int pos is out of the bounds 
     *  of the list, which makes it cycle through all of n)
     */
    public void insertBefore( int pos, T data ) 
    {
		DLLNode node = new DLLNode(data, null, head);
    	if (isEmpty()==false && pos>0){
			while(pos!=0&&node.next!=null) {
				node.prev=node.next;
				node.next=node.next.next;
				pos--;
			}
    	}
		if(node.prev!=null) {
			node.prev.next=node;
		}
		else head=node;
		if(node.next!=null) {
			node.next.prev=node;
		}
		else tail=node;
    }


	/**
     * Returns the data stored at a particular position
     * @param pos : the position
     * @return the data at pos, if pos is within the bounds of the list, and null otherwise.
     *
     * Worst-case asymptotic running time cost: Θ(n)
     *
     * Justification:
     *  The worst case is if the position is not in the list since the object 'pointer' will have to cycle through
     *  the entire n sized list resulting in the running time cost equaling to O(n).
     *
     */
    public T get(int pos) 
    {
    	DLLNode pointer = head;			// create pointer
    	while (pos!=0) {				// while pos is not reached
    		pointer=pointer.next;		// move pointer along once
    		pos--;						// pointer one closer to final pos
    		if(pointer==tail&&pos!=0) {	// if the pointer reaches the end and the pos is not finished
    			return null;			// return null
    		}
    	}
    	return pointer.data;			// after pos is reached, output data
    }

    /**
     * Deletes the element of the list at position pos.
     * First element in the list has position 0. If pos points outside the
     * elements of the list then no modification happens to the list.
     * @param pos : the position to delete in the list.
     * @return true : on successful deletion, false : list has not been modified. 
     *
     * Worst-case asymptotic running time cost: Θ(n)
     *
     * Justification:
     *  if the deletion is at the very end the entire list needs to ran through
     */
    public boolean deleteAt(int pos) 
    {
    	DLLNode pointer = head;
    	while(pos!=0) {						//move pointer to del point
    		pointer=pointer.next;
        	if(pointer==tail) return false;	//if end of list reached peace out
    		pos--;
    	}
    	if(pointer==head&&pointer==tail) {
    		head=null;
    		tail=null;
    	}
    	else {
	    	if(pointer!=head) pointer.prev.next=pointer.next;
	    	else head=pointer.next;
	    	if(pointer!=tail) pointer.next.prev=pointer.prev;		//delete references to the pos node
	    	else tail=pointer.prev;
    	}

    	return true;
    }

    /**
     * Reverses the list.
     * If the list contains "A", "B", "C", "D" before the method is called
     * Then it should contain "D", "C", "B", "A" after it returns.
     *
     * Worst-case asymptotic running time cost: Θ(n)
     *
     * Justification: 
     *  Since it iterates through the whole list twice it would run 2n times which in
     *  in big O notation simplifies to n
     */
    public void reverse()
    {	
    	if(head!=tail) {
    		DLLNode swapNode = head;
    		boolean endReached = false;
    		while(!endReached) {
        		DLLNode temp = swapNode.prev;
    			swapNode.prev = swapNode.next;
        		swapNode.next = temp;
        		if (swapNode == tail) endReached = true;
        		else swapNode = swapNode.prev;
    		}
    		tail = head;
    		head = swapNode;
    	}
    }

    /**
     * Removes all duplicate elements from the list.
     * The method should remove the _least_number_ of elements to make all elements uniqueue.
     * If the list contains "A", "B", "C", "B", "D", "A" before the method is called
     * Then it should contain "A", "B", "C", "D" after it returns.
     * The relative order of elements in the resulting list should be the same as the starting list.
     *
     * Worst-case asymptotic running time cost: Θ((n^2)/2)
     *
     * Justification:
     *  since the pointer loops make a triangular shape as it goes through the list, this means that using the 
     *  1/2*base*height triangle formula gives us the worst case running time (as the worst case running time 
     *  if the second loop was checking through the entire list too would be a square and a formula of n^2)
     */
     public void makeUnique()
    {
    	 int posCounter;
    	 int p1PosCounter=0;
    	 DLLNode p1 = head;
    	 while(p1.next!=tail) {
    		 p1PosCounter++;
    		 DLLNode p2 = p1.next;
    		 posCounter=p1PosCounter;
    		 while(p2!=tail) {
    			 if(p2.data==p1.data) {
    				 p2=p2.next;
    				 deleteAt(posCounter);
    			 }
    			 else{
    				 p2=p2.next;
    				 posCounter++;
    			 }
    		 }
    		 p1=p1.next;
    		 
    	 }
    }


    /*----------------------- STACK API 
     * If only the push and pop methods are called the data structure should behave like a stack.
     */

    /**
     * This method adds an element to the data structure.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @param item : the item to push on the stack
     *
     * Worst-case asymptotic running time cost: Θ(7)
     *
     * Justification:
     *  since it always inserts at the location of the head (which is a given location in the 'insertBefore' method
     *  it means that push will only ever have a set number of commands (1. create node, 2. check if the list is empty,
     *  3. check if the given position is more than 0, 4. check if there's a node before (if it's the head), 5. either set
     *  the prev node field to null if it's the head or to the node that comes before if it's any other node, 6. check if 
     *  there's a node after (if it's the tail), 7. either set the next node field to null if it's the tail or to the node 
     *  that comes after if it's any other node) -> Θ(7)
     */
    public void push(T item) 
    {
    	insertBefore(0, item);
    }

    /**
     * This method returns and removes the element that was most recently added by the push method.
     * @return the last item inserted with a push; or null when the list is empty.
     *
     * Worst-case asymptotic running time cost: Θ(10)
     *
     * Justification:
     *  since the method is always removing an element from the 0th position of the list it's running time is the same as the
     *  deleteAt method's best case plus 2 -> (1. check if list is empty, 2. create data storing node, 3. create
     *  deletion pointer node, 4. check if pos is equal to 0, 5. check if pointer is equal to head, 6. check if 
     *  pointer is equal to tail, 7. check if pointer is equal to head, 8. update prev node's references to deleted
     *  node, 9. check if pointer is equal to tail, 10. update next node's references to deleted node, 10. return value)
     */
    public T pop() 
    {
      if (head == null) {
    	  return null;
      }
      else {
    	  T dataOut = head.data;
          deleteAt(0);
    	  return dataOut;
      }
    }

    /*----------------------- QUEUE API
     * If only the enqueue and dequeue methods are called the data structure should behave like a FIFO queue.
     */
 
    /**
     * This method adds an element to the data structure.
     * How exactly this will be represented in the Doubly Linked List is up to the programmer.
     * @param item : the item to be enqueued to the stack
     *
     * Worst-case asymptotic running time cost: Θ(n)
     *
     * Justification:
     *  Since it inserts the data into the tail while only knowing the location of the head, this method will
     *  will always have a runtime of Θ(n) as it needs to run through the entire list (same as the worst case
     *  for insertBefore)
     */
    public void enqueue(T item) 
    {
    	insertBefore(MAX_LIST_SIZE, item);
    }

     /**
     * This method returns and removes the element that was least recently added by the enqueue method.
     * @return the earliest item inserted with an equeue; or null when the list is empty.
     *
     * Worst-case asymptotic running time cost: Θ(10)
     *
     * Justification:
     *  since the method is always removing an element from the 0th position of the list it's running time is the same as the
     *  deleteAt method's best case plus 2 -> (1. check if list is empty, 2. create data storing node, 3. create
     *  deletion pointer node, 4. check if pos is equal to 0, 5. check if pointer is equal to head, 6. check if 
     *  pointer is equal to tail, 7. check if pointer is equal to head, 8. update prev node's references to deleted
     *  node, 9. check if pointer is equal to tail, 10. update next node's references to deleted node, 10. return value)
     */
    public T dequeue() 
    {
        if (head == null) {
      	  return null;
        }
        else {
      	  T dataOut = head.data;
            deleteAt(0);
      	  return dataOut;
        }
    }
 

    /**
     * @return a string with the elements of the list as a comma-separated
     * list, from beginning to end
     *
     * Worst-case asymptotic running time cost:   Theta(n)
     *
     * Justification:
     *  We know from the Java documentation that StringBuilder's append() method runs in Theta(1) asymptotic time.
     *  We assume all other method calls here (e.g., the iterator methods above, and the toString method) will execute in Theta(1) time.
     *  Thus, every one iteration of the for-loop will have cost Theta(1).
     *  Suppose the doubly-linked list has 'n' elements.
     *  The for-loop will always iterate over all n elements of the list, and therefore the total cost of this method will be n*Theta(1) = Theta(n).
     */
    public String toString() 
    {
      StringBuilder s = new StringBuilder();
      boolean isFirst = true; 

      // iterate over the list, starting from the head
      for (DLLNode iter = head; iter != null; iter = iter.next)
      {
        if (!isFirst)
        {
          s.append(",");
        } else {
          isFirst = false;
        }
        s.append(iter.data.toString());
      }

      return s.toString();
    }


}



