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
sealed interface BinarySearchTree {
  fun size(): Int
  fun contains(value: String): Boolean
  fun insert(value: String): BinarySearchTree

  object Empty : BinarySearchTree {
    override fun size(): Int = 0
    override fun contains(value: String): Boolean = false
    override fun insert(value: String): BinarySearchTree = Node(value, Empty, Empty)
  }

  data class Node(private val value: String, private val left: BinarySearchTree, private val right: BinarySearchTree) : BinarySearchTree {
    override fun size(): Int = 1 + left.size() + right.size()
    override fun contains(value: String): Boolean = when {
      value == this.value -> true
      value < this.value -> left.contains(value)
      else -> right.contains(value)
    }

    override fun insert(value: String): BinarySearchTree = when {
      value == this.value -> this
      value < this.value -> Node(this.value, left.insert(value), right)
      else -> Node(this.value, left, right.insert(value))
    }
  }
}