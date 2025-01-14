let n = Double(readLine()!)!
let a = Double(readLine()!)!
let b = Double(readLine()!)!
let c = Double(readLine()!)!
var globalHashMap: [Double: Double] = [:]

func coins(n: Double) -> Double {
    if n < 0 {
        return Double.infinity
    } else if n == 0 {
        return 0.0
    } else if let mapContent = globalHashMap[n] {
        return mapContent
    } else {
        let result = min(Double(n), 1 + coins(n: n - a), 1 + coins(n: n - b), 1 + coins(n: n - c))
        globalHashMap[n] = result
        return result
    }
}

print(Int(coins(n: n)))
