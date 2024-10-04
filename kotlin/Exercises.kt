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

// explicit naming for clarity: https://medium.com/@guruprasadhegde4/kotlin-lambda-expressions-bb9d4e15b6fc
// trimming whitespace: https://www.baeldung.com/kotlin/string-remove-whitespace
@Throws(IOException::class)
fun meaningfulLineCount(filename: String): Long {
    BufferedReader(FileReader(filename)).use { reader ->
        return reader.lines()
            .filter { line -> 
                val trimmed = line.trim();
                !trimmed.isBlank() && !trimmed.startsWith("#");
            }
            .count()
    }
}

// Write your Quaternion data class here

// Write your Binary Search Tree interface and implementing classes here
