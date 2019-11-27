import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for Doubly Linked List
 *
 *  @author Alex Mahon 17335349
 *  @version 13/10/16 18:15
 */
@RunWith(JUnit4.class)
public class DoublyLinkedListTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
      new DoublyLinkedList<Integer>();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check if the insertBefore works
     */
    @Test
    

    
    public void testInsertBefore()
    {
        // test non-empty list
        DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);

        testDLL.insertBefore(0,4);
        assertEquals( "Checking insertBefore to a list containing 3 elements at position 0", "4,1,2,3", testDLL.toString() );
        testDLL.insertBefore(1,5);
        assertEquals( "Checking insertBefore to a list containing 4 elements at position 1", "4,5,1,2,3", testDLL.toString() );
        testDLL.insertBefore(2,6);       
        assertEquals( "Checking insertBefore to a list containing 5 elements at position 2", "4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(-1,7);        
        assertEquals( "Checking insertBefore to a list containing 6 elements at position -1 - expected the element at the head of the list", "7,4,5,6,1,2,3", testDLL.toString() );
        testDLL.insertBefore(7,8);        
        assertEquals( "Checking insertBefore to a list containing 7 elemenets at position 8 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8", testDLL.toString() );
        testDLL.insertBefore(700,9);        
        assertEquals( "Checking insertBefore to a list containing 8 elements at position 700 - expected the element at the tail of the list", "7,4,5,6,1,2,3,8,9", testDLL.toString() );

        // test empty list
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);        
        assertEquals( "Checking insertBefore to an empty list at position 0 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(10,1);        
        assertEquals( "Checking insertBefore to an empty list at position 10 - expected the element at the head of the list", "1", testDLL.toString() );
        testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(-10,1);        
        assertEquals( "Checking insertBefore to an empty list at position -10 - expected the element at the head of the list", "1", testDLL.toString() );
     } 
    
    @Test
    
    public void testEmpty()
    {
        // test empty list
        DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        assertEquals( "Checking isEmpty to an empty list - expected output", true, testDLL.isEmpty());
        // test empty list
        testDLL.insertBefore(0,1);        
        assertEquals( "Checking isEmpty to an empty list - expected output", false, testDLL.isEmpty());
     }
	 
    @Test
    
    public void testGet()
    {
        // test non-empty list
        DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);
        assertEquals( "Checking isEmpty to an empty list - expected output", "1", testDLL.get(0).toString());
        assertEquals( "Checking isEmpty to an empty list - expected output", "3", testDLL.get(2).toString());
        assertEquals( "Checking isEmpty to an empty list - expected output", null, testDLL.get(10));
     }
     
    @Test
    
    public void testDeleteAt()
    {
    	DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);
        testDLL.insertBefore(3,4);
        
        testDLL.deleteAt(2);
        assertEquals( "Deleting element at position 2 - expected output", "1,2,4", testDLL.toString());
        testDLL.deleteAt(0);
        assertEquals( "Deleting element at position 0 - expected output", "2,4", testDLL.toString());
        testDLL.deleteAt(0);
        assertEquals( "Deleting element at position 0 - expected output", "4", testDLL.toString());
        testDLL.deleteAt(0);
        assertEquals( "Deleting last element of the list - expected output", "", testDLL.toString());
        assertEquals( "Checking if list is correctly empty - expected output", true, testDLL.isEmpty());        
    }
    
    @Test
    
    public void testReverse()
    {
    	DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,3);
        testDLL.insertBefore(3,4);
        
        testDLL.reverse();
        assertEquals( "Checking for reversed list - expected output", "4,3,2,1", testDLL.toString());
    }
    
    @Test
    
    public void testMakeUnique()
    {
    	DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
        testDLL.insertBefore(0,1);
        testDLL.insertBefore(1,2);
        testDLL.insertBefore(2,2);
        testDLL.insertBefore(3,1);
        testDLL.insertBefore(4,5);
        testDLL.insertBefore(5,6);
        
        testDLL.makeUnique();
        assertEquals( "Checking for unique list - expected output", "1,2,5,6", testDLL.toString());
    }
    
    @Test
    
    public void testStack()
    {
    	DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
    	testDLL.push(3);
    	testDLL.push(1);
    	testDLL.push(5);
    	
        assertEquals( "Checking the pushed list and popping the first element - expected output", "5", testDLL.pop().toString());
        assertEquals( "Checking the pushed list and popping the next element - expected output", "1", testDLL.pop().toString());
        assertEquals( "Checking the pushed list and popping the last element - expected output", "3", testDLL.pop().toString());

        assertEquals( "Trying to pop an empty list - expected output", null, testDLL.pop());
    }
    
    @Test
    
    public void testQueue()
    {
    	DoublyLinkedList<Integer> testDLL = new DoublyLinkedList<Integer>();
    	testDLL.enqueue(3);
    	testDLL.enqueue(1);
    	testDLL.enqueue(5);
    	
        assertEquals( "Checking the queued list and dequeuing the first element - expected output", "3", testDLL.dequeue().toString());
        assertEquals( "Checking the queued list and dequeuing the next element - expected output", "1", testDLL.dequeue().toString());
        assertEquals( "Checking the queued list and dequeuing the last element - expected output", "5", testDLL.dequeue().toString());

        assertEquals( "Trying ro dequeuing an empty list - expected output", null, testDLL.dequeue());
    }
}

