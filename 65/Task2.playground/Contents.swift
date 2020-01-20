import UIKit //1

let serialQueue = DispatchQueue(label: "com.foo.bar") //2
serialQueue.async { //3
    print("Work 1") //4
    serialQueue.sync { //5
        print("Work 2") //6
    } //7
}
//При выполнении строчки 5 блокируется очередь serialQueue до выполнения в ней кложура с 5 по 7 строчку. Кложур с 5 по 7 строчку выполниться не может, поскольку очередь serialQueue заблокирована, а все таски в этой очереди идут последовательно (Serial очередь). 
