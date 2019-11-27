package main
import (
    "fmt"
    "net"
)

type workers struct {
   portNum int
   isFree bool
}

var workerList = [3]workers{};

func sendResponse(conn *net.UDPConn, addr *net.UDPAddr) {
    conn.WriteToUDP([]byte("From broker: message recived o7 "), addr)
}
func sendWork(conn *net.UDPConn, addr *net.UDPAddr, workInstruction []byte) {
    for freeWorker := 0; freeWorker<len(workerList); freeWorker++{
      if workerList[freeWorker].isFree == true {

         workerList[freeWorker].isFree=false
         addrW := net.UDPAddr{
             Port: workerList[freeWorker].portNum,
             IP: net.ParseIP("127.0.0.1"),
         }
         conn.WriteToUDP([]byte("Instruction sent to worker!"), addr)
         conn.WriteToUDP([]byte(workInstruction), &addrW)
         return
      }
   }
   noWorkersFreeResponse(conn, addr)
}
func addWorker(conn *net.UDPConn, addr *net.UDPAddr) {
    for freeSlot := 0; freeSlot<len(workerList); freeSlot++{
      if workerList[freeSlot].portNum == 0 {
         fmt.Printf("Adding new worker in slot: %v at port No: %v \n", freeSlot ,addr.Port)
         workerList[freeSlot].portNum=addr.Port;
         workerList[freeSlot].isFree=true;
         conn.WriteToUDP([]byte("New worker confirmed"), addr);
         return
      }
   }
}
func noWorkersFreeResponse(conn *net.UDPConn, addr *net.UDPAddr) {
    conn.WriteToUDP([]byte("Sorry, no workers are availbe at this time, please try again later!"), addr);
}
func replyCompletedWork(conn *net.UDPConn, addrCnC *net.UDPAddr, work []byte) {
   fmt.Printf("%v", addrCnC)
    conn.WriteToUDP(work, addrCnC)
}


func main() {
    addr := net.UDPAddr{
        Port: 1234,
        IP: net.ParseIP("127.0.0.1"),
    }

    addrCnC := net.UDPAddr{
        Port: 1233,
        IP: net.ParseIP("127.0.0.1"),
    }


    ser, err := net.ListenUDP("udp", &addr)
    if err != nil {
        fmt.Printf("Some error %v\n", err)
        return
    }
    for {
        p := make([]byte, 2048)
        _,remoteaddr,err := ser.ReadFromUDP(p)
        if err !=  nil {
            fmt.Printf("Some error  %v", err)
            continue
        }
        if remoteaddr.Port == addrCnC.Port {
           fmt.Printf("Message from C&C: %s \n", p)
           sendWork(ser, remoteaddr, p)
        } else {
           for workerOnList := 0; workerOnList<len(workerList); workerOnList++{
             if remoteaddr.Port == workerList[workerOnList].portNum {
                workerList[workerOnList].isFree = true
                fmt.Printf("Work done: %s \n", p)
                replyCompletedWork(ser, &addrCnC, p)
                break
             } else if workerOnList<=len(workerList) {
                addWorker(ser, remoteaddr)
                break
             }
           }
        }
    }
}
