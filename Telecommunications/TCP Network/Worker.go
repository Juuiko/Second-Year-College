package main
import (
    "fmt"
    "net"
    "bufio"
    "os"
    "strconv"
)

var availableForWork bool = false;

func sendResponse(conn *net.UDPConn, addr *net.UDPAddr) {
    //conn.WriteToUDP([]byte("From broker: message recived o7 "), addr)
}

func sendCompletedTask(addr *net.UDPAddr, myAddr *net.UDPAddr, task string){
   conn, err := net.DialUDP("udp", myAddr, addr)
   if err != nil {
      fmt.Printf("Some error %v", err)
      return
   }
   fmt.Fprintf(conn, task)
   conn.Close()
}

func sendToBroker(portNum string, myAddr *net.UDPAddr, addr *net.UDPAddr) {
   brokerMessage :=  make([]byte, 2048)
   conn, err := net.DialUDP("udp", myAddr, addr)
   if err != nil {
      fmt.Printf("Some error %v", err)
      return
   }
   fmt.Fprintf(conn, portNum)
   _, err = bufio.NewReader(conn).Read(brokerMessage)
   if err == nil {
      fmt.Printf("%s\n", brokerMessage)
   } else {
      fmt.Printf("Some error %v\n", err)
   }
   conn.Close()
}

func main() {

   portNumber := 1111;


   scanner := bufio.NewScanner(os.Stdin)
   fmt.Print("Entre port number: ")
   scanner.Scan()
   text := scanner.Text()
   portNumber,_=strconv.Atoi(text);
   myAddr := net.UDPAddr{
      Port: portNumber,
      IP: net.ParseIP("127.0.0.1"),
   }
   brokerAddr := net.UDPAddr{
       Port: 1234,
       IP: net.ParseIP("127.0.0.1"),
   }
   sendToBroker(text, &myAddr, &brokerAddr);
   availableForWork = true;
   for {
      if availableForWork == true {
         ser, err := net.ListenUDP("udp", &myAddr)
         if err != nil {
             fmt.Printf("Some error %v\n", err)
             return
         }
         p := make([]byte, 2048)
          _,remoteaddr,err := ser.ReadFromUDP(p)
         fmt.Printf("Message from C&C: %s \n", p)
         if err !=  nil {
              fmt.Printf("Some error  %v", err)
              continue
         }
         availableForWork = false
         sendResponse(ser, remoteaddr)
         ser.Close()
      } else {
         fmt.Print("Completed task: ")
         scanner := bufio.NewScanner(os.Stdin)
         scanner.Scan()
         text := scanner.Text()
         sendCompletedTask(&brokerAddr, &myAddr, text)
         availableForWork = true
      }

   }
}
