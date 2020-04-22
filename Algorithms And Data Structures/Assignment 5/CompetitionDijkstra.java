import java.io.*;
import java.util.*;

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
 * This class implements the competition using Dijkstra's algorithm
 * 
 *  @author Alex Mahon
 */

public class CompetitionDijkstra {

    int sA;
    int sB;
    int sC;
    boolean cWS;
    TreeMap<Integer, Node> network;
    
    class Node {
        int id;
        double cost = 10000;
        ArrayList<Path> paths = new ArrayList<>();

        Node(int id) {
            this.id = id;
        }

        void addAdjacent(Node node, double cost) {
            paths.add(new Path(node, cost));
        }
    }

    class Path {
        Node dest;
        double cost;

        Path(Node dest, double cost) {
            this.dest = dest;
            this.cost = cost;
        }
    }
    
    /**
     * @param filename: A filename containing the details of the city road network
     * @param sA, sB, sC: speeds for 3 contestants
     * @throws IOException if filename is invalid
    */
    CompetitionDijkstra (String filename, int sA, int sB, int sC) {
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
				int nodeNum = file.nextInt(); // Number of nodes
				
				if (nodeNum < 3) {
					cWS = false;
				}
		    	
		    	int sN = file.nextInt(); //Street number
		    	
		    	network = new TreeMap<>();
		    	for (int i=0; i<sN; i++) {
		    		int pointA = file.nextInt();
		            int pointB = file.nextInt();
		            double dist = file.nextDouble();
		            Node nodeA, nodeB;
		            
		            if (network.get(pointA) == null) {
		                nodeA = new Node(pointA);
		                network.put(pointA, nodeA);
		            } else {
		            	nodeA = network.get(pointA);
		            }


		            if (network.get(pointB) == null) {
		                nodeB = new Node(pointB);
		                network.put(pointB, nodeB);
		            } else {
		            	nodeB = network.get(pointB);
		            }
		            
		            nodeA.addAdjacent(nodeB, dist);
		    	}
		    	file.close();
			} catch (FileNotFoundException e) {
				cWS = false;
			}
		} else {
			cWS = false;
		}
    }
    
    /**
     * @param start: start of path length lookup
     */
    public double shortestPathToFurthestNode(int start){
    	LinkedList<Node> nodes = new LinkedList<>();
        for (Node node : network.values()) {
            if (node.id == start) node.cost = 0;
            else node.cost = 100000;
            
            nodes.add(node);
        }

        for (int i = 0; i < network.values().size(); i++) {
            for (Node node : nodes) {
                for (Path path : node.paths) {
                    double costN = node.cost + path.cost;
                    if (costN < path.dest.cost) {
                        path.dest.cost = costN;
                    }
                }
            }
        }

        double max = 0;
        for (Node node : network.values()) {
            if (node.cost == 100000) return node.cost;
            else if (node.cost > max)
                max = node.cost;
        }
        return max;
    }

    /**
     * @return int: max minutes that will pass before the three contestants can meet if they take the shortest path
     */
    public int timeRequiredforCompetition(){
    	if (cWS == false) {
    		return -1;
    	}
        double maxDist = 0;
        for (Node node : network.values()) {
            double dist = shortestPathToFurthestNode(node.id);
            if (dist == 100000) return -1;
            if (dist > maxDist) maxDist = dist;
        }
        int slowest = sA;
        if (sA > sB) {
        	slowest = sB;
        }
        if (slowest > sC) {
        	slowest = sC;
        }
        return (int) Math.ceil((maxDist*1000) / slowest);
    }

}
