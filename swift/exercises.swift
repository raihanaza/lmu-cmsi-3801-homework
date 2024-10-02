import Foundation

struct NegativeAmountError: Error {}
struct NoSuchFileError: Error {}

func change(_ amount: Int) -> Result<[Int:Int], NegativeAmountError> {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    var (counts, remaining) = ([Int:Int](), amount)
    for denomination in [25, 10, 5, 1] {
        (counts[denomination], remaining) = 
            remaining.quotientAndRemainder(dividingBy: denomination)
    }
    return .success(counts)
}

// Write your first then lower case function here

// Write your say function here

// Write your meaningfulLineCount function here

// Write your Quaternion struct here
struct Quaternion: CustomStringConvertible {
    let a: Double 
    let b: Double
    let c: Double 
    let d: Double

    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }

    static let ZERO = Quaternion(a: 0, b: 0, c: 0, d: 0)
    static let I = Quaternion(a: 0, b: 1, c: 0, d: 0)
    static let J = Quaternion(a: 0, b: 0, c: 1, d: 0)
    static let K = Quaternion(a: 0, b: 0, c: 0, d: 1)

    var coefficients: [Double] {
        return [a, b, c, d]
    }

    var conjugate: Quaternion {
        return Quaternion(a: a, b: -b, c: -c, d: -d)
    }

    var description: String {
        var output = ""

        if a != 0 {
            output += "\(a)"
        }

        if b != 0 {
            if b == 1 {
                output += (output.isEmpty ? "i" : "+i")
            } else if b > 1 {
                output += "+\(b)i"
            } else if b == -1 {
                output += "-i"
            } else {
                output += "\(b)i"
            }
        }

        if c != 0 {
            if c == 1 {
                output += (output.isEmpty ? "j" : "+j")
            } else if c > 1 {
                output += "+\(c)j"
            } else if c == -1 {
                output += "-j"
            } else {
                output += "\(c)j"
            }
        }

        if d != 0 {
            if d == 1 {
                output += (output.isEmpty ? "k" : "+k")
            } else if d > 1 {
                output += "+\(d)k"
            } else if d == -1 {
                output += "-k"
            } else {
                output += "\(d)k"
            }
        }

        return output.isEmpty ? "0" : output
    }

}

func +(q1: Quaternion, q2: Quaternion) -> Quaternion {
    return Quaternion(a: q1.a + q2.a, b: q1.b + q2.b, c: q1.c + q2.c, d: q1.d + q2.d)
}   

func * (q1: Quaternion, q2: Quaternion) -> Quaternion {     
    return Quaternion(a: ((q1.a * q2.a) - (q1.b * q2.b) - (q1.c * q2.c) - (q1.d * q2.d)),
                      b: ((q1.a * q2.b) + (q1.b * q2.a) + (q1.c * q2.d) - (q1.d * q2.c)),
                      c: ((q1.a * q2.c) - (q1.b * q2.d) + (q1.c * q2.a) + (q1.d * q2.b)),
                      d: ((q1.a * q2.d) + (q1.b * q2.c) - (q1.c * q2.b) + (q1.d * q2.a)))
}

func == (q1: Quaternion, q2: Quaternion) -> Bool {
    return (q1.a == q2.a) && (q1.b == q2.b) && (q1.c == q2.c) && (q1.d == q2.d)
}

// Write your Binary Search Tree enum here
