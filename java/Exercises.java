import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;
import java.util.function.Predicate;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLSyntaxErrorException;

public class Exercises {
    static Map<Integer, Long> change(long amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Amount cannot be negative");
        }
        var counts = new HashMap<Integer, Long>();
        for (var denomination : List.of(25, 10, 5, 1)) {
            counts.put(denomination, amount / denomination);
            amount %= denomination;
        }
        return counts;
    }

    // Write your first then lower case function here

    // Write your say function here
    static record Sayer(String phrase) {
        Sayer and(String word) {
            return new Sayer(phrase + " " + word);
        }
    }

    public static Sayer say() {
        return new Sayer("");
    }

    public static Sayer say(String word) {
        return new Sayer(/*TODO: Supposed to add something else here*/ word);
    }

    // Write your line count function here
}

// Write your Quaternion record class here

// Write your BinarySearchTree sealed interface and its implementations here
