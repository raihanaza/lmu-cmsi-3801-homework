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

// Write your meaningfulLineCount function here

// Write your Quaternion data class here
data class Quaternion (val a: Double = 0.0, val b: Double = 0.0, val c: Double = 0.0, val d: Double = 0.0) {
    
    companion object {
        val ZERO = Quaternion(0.0, 0.0, 0.0, 0.0)
        val I = Quaternion(0.0, 1.0, 0.0, 0.0)
        val J = Quaternion(0.0, 0.0, 1.0, 0.0)
        val K = Quaternion(0.0, 0.0, 0.0, 1.0)
    }
    
    operator fun plus(q: Quaternion): Quaternion {
        return Quaternion(a + q.a, b + q.b, c + q.c, d + q.d)
    }

    operator fun times(q: Quaternion): Quaternion {
        return Quaternion(((a * q.a) - (b * q.b) - (c * q.c) - (d * q.d)),
                          ((a * q.b) + (b * q.a) + (c * q.d) - (d * q.c)),
                          ((a * q.c) - (b * q.d) + (c * q.a) + (d * q.b)),
                          ((a * q.d) + (b * q.c) - (c * q.b) + (d * q.a)))
    }

    fun coefficients(): List<Double> {
        return listOf(a, b, c, d)
    }

    fun conjugate(): Quaternion {
        return Quaternion(a, -b, -c, -d)
    } 

    fun equals(other: Quaternion): Boolean {
        return (a == other.a) && (b == other.b) && (c == other.c) && (d == other.d)
    }

    override fun toString(): String {
        var output = ""

        if (a != 0.0) {
            output += "$a"
        }

        if (b != 0.0) {
            output += when {
                (b == 1.0) -> if (output.isEmpty()) "i" else "+i"
                (b == -1.0) -> "-i"
                (b > 0.0) -> "+${b}i"
                else -> "${b}i"
            }
        }

        if (c != 0.0) {
            output += when {
                (c == 1.0) -> if (output.isEmpty()) "j" else "+j"
                (c == -1.0) -> "-j"
                (c > 0.0) -> "+${c}j"
                else -> "${c}j"
            }
        }

        if (d != 0.0) {
            output += when {
                (d == 1.0) -> if (output.isEmpty()) "k" else "+k"
                (d == -1.0) -> "-k"
                (d > 0.0) -> "+${d}k"
                else -> "${d}k"
            }
        }
        return if (output.isEmpty()) "0" else output
    }
}

// Write your Binary Search Tree interface and implementing classes here
