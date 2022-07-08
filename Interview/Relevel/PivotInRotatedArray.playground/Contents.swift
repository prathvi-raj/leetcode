import Foundation

/*
 5,6,7,8,9,10, 11, 12, 13, 1,2,3,4


 8, 9, 10, 1, 2,    3, 4, 5, 6, 7

 Output - 8
 */


//func search(_ array:[Int], target: Int) -> Int {
//
//}


func findPivot(_ array:[Int]) -> Int {

    var l = 0
    var r = array.count - 1

    while l < r {
        let mid = l + (r-l)/2

        if r-l == 1 {
            if array[l] > array[r] {
                return r
            }else {
                return l
            }
        }

        if array[mid-1] > array[mid] {
            return mid
        }

        if array[mid] >  array[l] {
            l = mid
        }else {
            r = mid
        }
    }

    return -1
}


findPivot([5,6,7,8,9,10, 11, 12, 13, 1,2,3,4])
findPivot([8, 9, 10, 1, 2, 3, 4, 5, 6, 7])

findPivot([8,9,1])
