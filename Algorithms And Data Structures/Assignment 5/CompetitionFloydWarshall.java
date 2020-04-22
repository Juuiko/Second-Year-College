import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

/**
 * A Contest to Meet (ACM) is a reality TV contest that sets three contestants at three random
 * city intersections. In order to win, the three contestants need all to meet at any intersection
 * of the city as fast as possible.
 * It should be clear that the contestants may arrive at the intersections at different times, in
 * which case, the first to arrive can wait until the others arrive.
 * From an estimated walking speed for each one of the three contestants, ACM wants to determine the
 * minimum time that a live TV broadcast should last to cover their journey regardless of the contestants’
 * initial positions and the intersection they finally meet. You are hired to help ACM answer this question.
 * You may assume the following:
 *     Each contestant walks at a given estimated speed.
 *     The city is a collection of intersections in which some pairs are connected by one-way
 * streets that the contestants can use to traverse the city.
 *
 * This class implements the competition using Floyd-Warshall algorithm
 *
 * @author Alex Mahon
 */

public class CompetitionFloydWarshall {
	
    int sA;
    int sB;
    int sC;
    int nV;
    int sN;
    boolean cWS;
    double[][] grid;
	
    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
     * @throws IOException 
     */
    CompetitionFloydWarshall (String filename, int sA, int sB, int sC) {
    	Boolean correctWalkingSpeed = false;
    	if ((sA >= 50 && sA <= 100) && (sB >= 50 && sB <= 100) && (sC >= 50 && sC <= 100)) {
    		correctWalkingSpeed = true;
    	}
    	cWS = correctWalkingSpeed;
    	this.sA = sA;
    	this.sB = sB;
    	this.sC = sC;
        Scanner file;
		if (filename != null) {
			try {
				file = new Scanner(new FileInputStream(filename));
		    	nV = file.nextInt(); //Vertices number 	
		    	
		    	sN = file.nextInt(); //Street number
		    	if (nV >= 3) {
			    	grid = new double[nV][sN];
			    	//make same numbers 0
			    	for (int i = 0; i < nV; i++){
			            for (int j = 0; j < nV; j++){
			                if(i == j ){
			                    grid[i][j] = 0;
			                }
			                grid[i][j] = 1000;
			            }
			        }
			    	
			    	for (int i=0; i<sN; i++) {
			    		grid[file.nextInt()][file.nextInt()] = file.nextDouble();
			    	}
		    	} else {
		    		cWS = false;
		    	}
			} catch (FileNotFoundException e) {
				cWS = false;
			}
		} else {
			cWS = false;
		}
    }

    private double getMax(){
        double maxDist = -1;
        for (int i = 0; i < nV; i++){
            for (int j = 0; j < nV; j++){
                if(grid[i][j] > maxDist && i != j){
                    maxDist = grid[i][j];
                }
            }
        }
        if (maxDist == 1000) maxDist = -1;
        return maxDist;
    }

    /**
     * @return int: minimum minutes that will pass before the three contestants can meet
     */
    public int timeRequiredforCompetition(){
    	if (cWS == false) {
    		return -1;
    	}
    	for (int k = 0; k < nV; k++){
            for (int i = 0; i < nV; i++){
                for (int j = 0; j < nV; j++){
                    if(grid[i][k] + grid[k][j] < grid[i][j]){
                        grid[i][j] = grid[i][k] + grid[k][j];
                    }
                }
            }
        }
    	double maxDist = getMax() * 1000;
        if (maxDist == -1000) return -1;
        
        int slowest = sA;
        if (sA > sB) {
        	slowest = sB;
        }
        if (slowest > sC) {
        	slowest = sC;
        }
        return (int) Math.ceil(maxDist / slowest);    
    }
}