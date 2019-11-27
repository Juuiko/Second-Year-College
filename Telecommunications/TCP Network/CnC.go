package main
import (
    "fmt"
    "net"
    "bufio"
    "os"
)

func sendToBroker(workDesc string, myAddr *net.UDPAddr, send2Addr *net.UDPAddr) {
   brokerMessage :=  make([]byte, 2048)
   conn, err := net.DialUDP("udp", myAddr, send2Addr)
   if err != nil {
      fmt.Printf("Some error %v", err)
      return
   }
   fmt.Fprintf(conn, workDesc)
   _, err = bufio.NewReader(conn).Read(brokerMessage)
   fmt.Printf("%s\n", brokerMessage)
   conn.Close()
}

func main() {

   addrCnC := net.UDPAddr{
      Port: 1233,
      IP: net.ParseIP("127.0.0.1"),
   }

   addrB := net.UDPAddr{
      Port: 1234,
      IP: net.ParseIP("127.0.0.1"),
   }

   for {
      scanner := bufio.NewScanner(os.Stdin)
      fmt.Print("Entre your next input: ")
      scanner.Scan()
      text := scanner.Text()
      if text == "exit" {
         return;
      } else {
         sendToBroker(text, &addrCnC, &addrB);
      }
   }
}
