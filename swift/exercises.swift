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

// Write your meaningfulLineCount function here

// Write your Quaternion struct here

indirect enum BinarySearchTree: CustomStringConvertible {
    case empty
    case node(value: Character, left: BinarySearchTree, right: BinarySearchTree)

    // checks how many nodes are on the tree, recursive function
    // start at top and counts each going down 
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