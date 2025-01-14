let n = Int(readLine()!)!
let k = Int(readLine()!)!
let p = Double(readLine()!)!

func f(x: Int, y: Int) -> Double {
    if y == 0 {
        return 1.0
    } else if x == 0 && y > 0 {
        return 0.0
    } else {
        return p * f(x: x - 1, y: y - 1) + (1 - p) * f(x: x - 1, y: k)
    }
}

print(f(x: n, y: k))