import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

//-------------------------------------------------------------------------
/**
 *  Test class for SortComparison.java
 *
 *  @author
 *  @version HT 2020
 */
@RunWith(JUnit4.class)
public class SortComparisonTest
{
    //~ Constructor ........................................................
    @Test
    public void testConstructor()
    {
        new SortComparison();
    }

    //~ Public Methods ........................................................

    // ----------------------------------------------------------
    /**
     * Check that the methods work for empty arrays
     */
    @Test
    public void testEmpty()
    {
        double input[] = { };
        double empty[] = { };
        assertArrayEquals(empty, SortComparison.insertionSort(input), 0);
        assertArrayEquals(empty, SortComparison.selectionSort(input), 0);
        assertArrayEquals(empty, SortComparison.quickSort(input), 0);
        assertArrayEquals(empty, SortComparison.mergeSortIterative(input), 0);
        assertArrayEquals(empty, SortComparison.mergeSortRecursive(input), 0); 
    }

    @Test
    public void testOne()
    {	
        double input[] = { 1.0 };
        double one[] = { 1.0 };
        assertArrayEquals(one, SortComparison.insertionSort(input), 0);
        assertArrayEquals(one, SortComparison.selectionSort(input), 0);
        assertArrayEquals(one, SortComparison.quickSort(input), 0);
        assertArrayEquals(one, SortComparison.mergeSortIterative(input), 0);
        assertArrayEquals(one, SortComparison.mergeSortRecursive(input), 0); 
    }
    
    @Test
    public void testTwo()
    {	
        double a[] = { 12.0, 11.0 };
        double sorted[] = { 11.0, 12.0 };
        assertArrayEquals(sorted, SortComparison.insertionSort(a), 0);
        
        double e[] = { 12.0, 11.0 };
        assertArrayEquals(sorted, SortComparison.selectionSort(e), 0);
        
        double b[] = { 12.0, 11.0 };
        assertArrayEquals(sorted, SortComparison.quickSort(b), 0);
        
        double c[] = { 12.0, 11.0 };
        assertArrayEquals(sorted, SortComparison.mergeSortIterative(c), 0);
        
        double d[] = { 12.0, 11.0 };
        assertArrayEquals(sorted, SortComparison.mergeSortRecursive(d), 0); 
    }
    
    @Test
    public void testFullArray()
    {	
        double a[] = { 12.0, 11.0, 13.0, 5.0, 6.0 };
        double sorted[] = { 5.0, 6.0, 11.0, 12.0, 13.0 };
        assertArrayEquals(sorted, SortComparison.insertionSort(a), 0);
        
        double e[] = { 12.0, 11.0, 13.0, 5.0, 6.0 };
        assertArrayEquals(sorted, SortComparison.selectionSort(e), 0);
        
        double b[] = { 12.0, 11.0, 13.0, 5.0, 6.0 };
        assertArrayEquals(sorted, SortComparison.quickSort(b), 0);
        
        double c[] = { 12.0, 11.0, 13.0, 5.0, 6.0 };
        assertArrayEquals(sorted, SortComparison.mergeSortIterative(c), 0);
        
        double d[] = { 12.0, 11.0, 13.0, 5.0, 6.0 };
        assertArrayEquals(sorted, SortComparison.mergeSortRecursive(d), 0); 
    }
    // ----------------------------------------------------------
    /**
     *  Main Method.
     *  Use this main method to create the experiments needed to answer the experimental performance questions of this assignment.
     *
     */
    public static void main(String[] args)
    {
        //TODO: implement this method
    }

}

