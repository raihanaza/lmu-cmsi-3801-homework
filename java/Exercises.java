import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;
import java.util.function.Predicate;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

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

    // for file reader syntax: https://www.baeldung.com/java-filereader
    // for trim method to rid of whitespace: https://www.geeksforgeeks.org/java-string-trim-method-example/
    public static int meaningfulLineCount(String filename) throws IOException {
        try (var reader = new BufferedReader(new FileReader(filename))) {
            return (int) reader.lines()
                .filter(line -> {
                    String trimmed = line.trim();
                    return !trimmed.isBlank() && !trimmed.startsWith("#");
                })
                .count();
        }
    }
}

// Write your Quaternion record class here

// Write your BinarySearchTree sealed interface and its implementations here
