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

// Write your Binary Search Tree enum here
