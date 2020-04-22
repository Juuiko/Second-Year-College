import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * 
 * @author Alex Mahon
 * No extra files bar the ones provided (tinyEWD.txt & input-A.txt)
 */

public class CompetitionTests {

    @Test
    public void testDijkstraConstructor() {
        CompetitionDijkstra d = new CompetitionDijkstra("tinyEWD.txt", 100,80,100);
        assertEquals("Error free test", 24, d.timeRequiredforCompetition());
        

        CompetitionDijkstra d2 = new CompetitionDijkstra("tinyEWD.txt", 0, 100, 100);
        assertEquals("Speed less than 50", -1, d2.timeRequiredforCompetition());
        

        CompetitionDijkstra d3 = new CompetitionDijkstra("tinyEWD.txt", 150, 100, 100);
        assertEquals("Speed more than 100", -1, d3.timeRequiredforCompetition());
        
        CompetitionDijkstra d4 = new CompetitionDijkstra("test.txt", 100, 100, 100);
        assertEquals("No file", -1, d4.timeRequiredforCompetition());
        
        CompetitionDijkstra d5 = new CompetitionDijkstra(null, 150, 100, 100);
        assertEquals("No file", -1, d5.timeRequiredforCompetition());
        
        CompetitionDijkstra d6 = new CompetitionDijkstra("input-A.txt", 150, 100, 100);
        assertEquals("Too small network", -1, d6.timeRequiredforCompetition());
        
        CompetitionDijkstra d7 = new CompetitionDijkstra("input-C.txt", 50, 100, 67);
        assertEquals("No file", -1, d7.timeRequiredforCompetition());
        
        CompetitionDijkstra d8 = new CompetitionDijkstra("input-C.txt", 50, 100, 100);
        assertEquals("No file", -1, d8.timeRequiredforCompetition());
        
        CompetitionDijkstra d9 = new CompetitionDijkstra("input-B.txt", 60, 80, 50);
        assertEquals("Network size 3", 10000, d9.timeRequiredforCompetition());
    }

    @Test
    public void testFWConstructor() {
        CompetitionFloydWarshall fw = new CompetitionFloydWarshall("tinyEWD.txt", 100,80,100);
        assertEquals("Error free test", 24, fw.timeRequiredforCompetition());
        
        CompetitionFloydWarshall fw2 = new CompetitionFloydWarshall("tinyEWD.txt", 0, 80, 100);
        assertEquals("Speed less than 50", -1, fw2.timeRequiredforCompetition());
        
        CompetitionFloydWarshall fw3 = new CompetitionFloydWarshall("tinyEWD.txt", 150, 80, 100);
        assertEquals("Speed more than 100", -1, fw3.timeRequiredforCompetition());    
        
        CompetitionFloydWarshall fw4 = new CompetitionFloydWarshall("test.txt", 100, 80, 100);
        assertEquals("No file", -1, fw4.timeRequiredforCompetition());  
        
        CompetitionFloydWarshall fw5 = new CompetitionFloydWarshall(null, 100, 80, 100);
        assertEquals("No file", -1, fw5.timeRequiredforCompetition());  
        
        CompetitionFloydWarshall fw6 = new CompetitionFloydWarshall("input-A.txt", 100, 80, 100);
        assertEquals("Too small network", -1, fw6.timeRequiredforCompetition()); 
        
        CompetitionFloydWarshall fw7 = new CompetitionFloydWarshall("input-C.txt", 100, 80, 100);
        assertEquals("No file", -1, fw7.timeRequiredforCompetition()); 
        
        CompetitionFloydWarshall fw8 = new CompetitionFloydWarshall("input-C.txt", 100, 80, 100);
        assertEquals("No file", -1, fw8.timeRequiredforCompetition()); 
        
        CompetitionFloydWarshall fw9 = new CompetitionFloydWarshall("input-B.txt", 60, 80, 50);
        assertEquals("Network size 3", 10000, fw9.timeRequiredforCompetition()); 
    }
}
