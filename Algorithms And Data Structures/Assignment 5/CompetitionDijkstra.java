import java.io.*;
import java.util.StringTokenizer;

/*
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
 * This class implements the competition using Dijkstra's algorithm
 */

public class CompetitionDijkstra {

    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
     * @throws IOException 
    */
    CompetitionDijkstra (String filename, int sA, int sB, int sC) throws IOException{
    	BufferedReader file = new BufferedReader(new FileReader(filename));
    	
    	String arraySize = file.readLine();
    	int aS = Integer.parseInt(arraySize);
    	
    	String streetNumber = file.readLine();
    	int sN = Integer.parseInt(streetNumber);
    	
    	float[][] network = new float[aS][aS];
    	for (int i=0; i<sN; i++) {
    		StringTokenizer streetInfo = new StringTokenizer(file.readLine());
    		int x = Integer.parseInt(streetInfo.nextToken());
    		int y = Integer.parseInt(streetInfo.nextToken());
    		network[x][y] = Float.parseFloat(streetInfo.nextToken());
    		System.out.println(x);
    		System.out.print(" ");
    		System.out.print(y);
    		System.out.print(" ");
    		System.out.print(network[x][y]);
    	}
    	
    	file.close();
    }


    /**
    * @return int: minimum minutes that will pass before the three contestants can meet
     */
    public int timeRequiredforCompetition(){

        //TO DO
        return -1;
    }

}
