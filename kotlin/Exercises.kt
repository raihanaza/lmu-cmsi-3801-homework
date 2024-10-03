import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun change(amount: Long): Map<Int, Long> {
    require(amount >= 0) { "Amount cannot be negative" }
    
    val counts = mutableMapOf<Int, Long>()
    var remaining = amount
    for (denomination in listOf(25, 10, 5, 1)) {
        counts[denomination] = remaining / denomination
        remaining %= denomination
    }
    return counts
}

// Write your first then lower case function here

// Write your say function here
// TODO: need to see how to chain calls in kotlin
data class Sayer(val phrase: String = "") {
  fun and(word: String): Sayer {
    return Sayer("$phrase $word")
  }
}

fun say(word: String = ""): Sayer {
  return Sayer(word)
}

// Write your meaningfulLineCount function here

// Write your Quaternion data class here

// Write your Binary Search Tree interface and implementing classes here
