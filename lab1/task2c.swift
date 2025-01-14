import Foundation

let n = Double(readLine()!)!
let k = Double(readLine()!)!
let p = Double(readLine()!)!
var hashMap: [Double : Double] = [:]

func g(x: Double) -> Double {
    if x < k {
        return 0.0
    } else if x == k {
        return pow(p, k)
    } else if let mapComponent = hashMap[x] {
        return mapComponent
    } else {
        let result =  g(x: x - 1) + pow(p, k) * (1 - p) * (1 - g(x: x - k - 1))
        hashMap[x] = result
        return result
    }
}

print(g(x: n))