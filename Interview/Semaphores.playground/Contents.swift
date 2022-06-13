import Foundation
/*
let semaphore = DispatchSemaphore(value: 1)

DispatchQueue.global().async {
   print("Kid 1 - wait")
   semaphore.wait()
   print("Kid 1 - wait finished")
   sleep(1) // Kid 1 playing with iPad
   semaphore.signal()
   print("Kid 1 - done with iPad")
}

DispatchQueue.global().async {
   print("Kid 2 - wait")
   semaphore.wait()
   print("Kid 2 - wait finished")
   sleep(1) // Kid 1 playing with iPad
   semaphore.signal()
   print("Kid 2 - done with iPad")
}

DispatchQueue.global().async {
   print("Kid 3 - wait")
   semaphore.wait()
   print("Kid 3 - wait finished")
   sleep(1) // Kid 1 playing with iPad
   semaphore.signal()
   print("Kid 3 - done with iPad")
}
*/

/*
let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 3)


for i in 0..<15 {
   queue.async {
      let songNumber = i + 1
      semaphore.wait()
      print("Downloading song", songNumber)
      sleep(2) // Download take ~2 sec each
      print("Downloaded song", songNumber)
      semaphore.signal()
   }
}
*/


/*
func performUsingSemaphore() {
    let dq1 = DispatchQueue(label: "q1", attributes: .concurrent)
    let dq2 = DispatchQueue(label: "q2", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 1)

    for i in 1...3 {
        dq1.async {
          print("Wait DispatchQueue 1: \(i)")
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
            sleep(1)
          print("\(#function) DispatchQueue 1: \(i)")
            semaphore.signal()
        }
    }
    for i in 1...3 {
        dq2.async {
          print("Wait DispatchQueue 2: \(i)")
            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
            sleep(1)
          print("\(#function) DispatchQueue 2: \(i)")
          semaphore.signal()
        }
    }
}

performUsingSemaphore()
RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 1))
*/

/*
let workItem = DispatchWorkItem {
  print("Start the job")
  sleep(5)
  print("Done with job")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: workItem)

workItem.cancel()

*/



var array: [Int] = []
/*
// Race condition
DispatchQueue.concurrentPerform(iterations: 100) { index in
  let last = array.last ?? 0
  array.append(last+1)
  print("Index: \(index) Count: \(array.count)")
}
 */

// Race condition fix:
let lock = NSLock()
DispatchQueue.concurrentPerform(iterations: 100) { index in
  lock.lock()
  let last = array.last ?? 0
  array.append(last+1)
  lock.unlock()
  print("Index: \(index) Count: \(array.count)")
}
