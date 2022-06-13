import Foundation

let arr1: [Int] = [12,2,5,7,10,6,4,12]


func secondLargest(_ arr: [Int]) -> Int {

    var sl: Int = Int.min
    var l: Int = Int.min

    for i in 0..<arr.count {
        if arr[i] > l {
            sl = l
            l = arr[i]
        }else if arr[i] > sl {
            if arr[i] < l {
                sl = arr[i]
            }
        }
    }

    return sl
}


print(secondLargest(arr1))

