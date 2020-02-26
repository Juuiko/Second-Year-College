// -------------------------------------------------------------------------

/**
 *  This class contains static methods that implementing sorting of an array of numbers
 *  using different sort algorithms.
 *
 *  @author Alex Robert Mahon
 *  @version HT 2020
 */

 class SortComparison {

	 
	 static void printArray(double arr[]) 
	    { 
	        int n = arr.length; 
	        for (int i = 0; i < n; ++i) 
	            System.out.print(arr[i] + " "); 
	  
	        System.out.println(); 
	    } 
	 
    /**
     * Sorts an array of doubles using InsertionSort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order.
     *
     */
    static double [] insertionSort (double a[]){
    	double key = 0;
    	for(int i = 0; i < a.length; i++) {
    		key = a[i];
    		int j = i - 1;
    		while(j >= 0 && a[j] > key) {
    			a[j+1] = a[j];
				j--;
    		}
    		a[j+1] = key;
    	}
		return a;
    }//end insertionsort
	
	    /**
     * Sorts an array of doubles using Selection Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    static double [] selectionSort (double a[]){
    	int minValLoc;
    	double temp;
		for (int i = 0; i < a.length; i++) {
			minValLoc = i;
			for (int j = i + 1; j < a.length; j++) {
				if (a[j]<a[minValLoc]) {
					minValLoc = j;
				}
			}
			temp = a[minValLoc];
			a[minValLoc] = a[i];
			a[i] = temp;
		}
    	return a;
    }//end selectionsort

    /**
     * Sorts an array of doubles using Quick Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    
    static double [] quickSort (double a[]){
    	 

    	return a;
    }//end quicksort
    
    /**
     * Sorts an array of doubles using Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     * @param a: An unsorted array of doubles.
     * @return array sorted in ascending order
     *
     */
    /**
     * Sorts an array of doubles using iterative implementation of Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     *
     * @param a: An unsorted array of doubles.
     * @return after the method returns, the array must be in ascending sorted order.
     */

    static double[] mergeSortIterative (double a[]) {
		return a;

		 //todo: implement the sort
	
    }//end mergesortIterative
    
    
    
    /**
     * Sorts an array of doubles using recursive implementation of Merge Sort.
     * This method is static, thus it can be called as SortComparison.sort(a)
     *
     * @param a: An unsorted array of doubles.
     * @return after the method returns, the array must be in ascending sorted order.
     */
    static double[] mergeSortRecursive (double a[]) {
		return a;
    	

    	//todo: implement the sort
	
   }//end mergeSortRecursive
    	
    


   


    public static void main(String[] args) {
        double arr[] = { 12, 11, 13, 5, 6 };
        printArray(arr); 
        printArray(selectionSort(arr)); 
        }

 }//end class

