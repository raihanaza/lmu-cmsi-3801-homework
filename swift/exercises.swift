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

func firstThenLowerCase(of strings: [String?],satisfying predicate: (String) -> Bool) -> String? {
    for string in strings {
        if predicate(string ?? "") {
            return string?.lowercased()
        }
    }
    return nil
}

struct Sayer {
    let phrase: String

    func and(_ word: String) -> Sayer {
        return Sayer(phrase: phrase + " " + word)
    }
}

func say(_ phrase: String = "") -> Sayer {
    return Sayer(phrase: phrase)
}

func meaningfulLineCount(_ path: String) async -> Result<Int, Error> {
    // for using result: // https://www.hackingwithswift.com/articles/161/how-to-use-result-in-swift
    do {
        let fileURL = URL(fileURLWithPath: path)
        var lineCount = 0

        for try await line in fileURL.lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces) // for trimming text: https://www.hackingwithswift.com/example-code/strings/how-to-trim-whitespace-in-a-string

            if trimmed.isEmpty || trimmed.first == "#" {
                continue
        }
        lineCount += 1
    }
    return .success(lineCount) 

    } catch {
        return .failure(NoSuchFileError())
    }

}

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

indirect enum BinarySearchTree: CustomStringConvertible {
    case empty
    case node(value: Character, left: BinarySearchTree, right: BinarySearchTree)

    // checks how many nodes are on the tree, recursive function that starts at top and counts each going down 
    var size: Int {
        switch self {
        case .empty:
            return 0
        case let .node(_, left, right):
            return 1 + left.size + right.size
        }
    }

    // string representation of the tree
    var description: String {
        switch self {
        case .empty:
            return "()"
        case let .node(value, left, right):
            let leftTreeString = left.description == "()" ? "" : "\(left.description)"
            let rightTreeString = right.description == "()" ? "" : "\(right.description)"
            return "(\(leftTreeString)\(value)\(rightTreeString))"
        }
    }

    // go through each nodes top down, check if equal to each other, if get to bottom, return false if haven't hit true
    func contains(_ valueQuery: Character) -> Bool {
        switch self {
        case .empty:
            return false
        case let .node(value, left, right):
            if valueQuery == value {
                return true
            } else if valueQuery < value {
                return left.contains(valueQuery)
            } else {
                return right.contains(valueQuery)
            }
        }
    }

    // adding new value to the tree
    func insert(_ newValue: Character) -> BinarySearchTree {
        switch self {
            case .empty:
                return .node(value: newValue, left: .empty, right: .empty)
            case let .node(value, left, right):
                if newValue < value {
                    return .node(value: value, left: left.insert(newValue), right: right)
                } else {
                    return .node(value: value, left: left, right: right.insert(newValue))
                }
        }
    }
}