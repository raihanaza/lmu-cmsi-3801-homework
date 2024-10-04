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

public static Optional<String> firstThenLowerCase(List<String> strings, Predicate<String> predicate) {
    return strings.stream() 
        .filter(s -> s != null && predicate.test(s))
        .map(String::toLowerCase)
        .findFirst();
}
    static record Sayer(String phrase) {
        Sayer and(String word) {
            return new Sayer(phrase + " " + word);
        }
    }

    public static Sayer say() {
        return new Sayer("");
    }

    public static Sayer say(String word) {
        return new Sayer(word);
    }

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

record Quaternion(double a, double b, double c, double d) {
    public final static Quaternion ZERO = new Quaternion(0, 0, 0, 0);
    public final static Quaternion I = new Quaternion(0, 1, 0, 0);
    public final static Quaternion J = new Quaternion(0, 0, 1, 0);
    public final static Quaternion K = new Quaternion(0, 0, 0, 1);

    // learned how to do compact contructor from https://howtodoinjava.com/java/java-record-type/
    public Quaternion {
        if (Double.isNaN(a) || Double.isNaN(b) || Double.isNaN(c) || Double.isNaN(d)) {
            throw new IllegalArgumentException("Coefficients cannot be NaN");
        }
    }

    Quaternion plus(Quaternion other) {
        return new Quaternion(a + other.a, b + other.b, c + other.c, d + other.d);
    }

    Quaternion subtract(Quaternion q) {
        return new Quaternion(a - q.a, b - q.b, c - q.c, d - q.d);
    }

    Quaternion times(Quaternion q) {
        return new Quaternion(
                a * q.a - b * q.b - c * q.c - d * q.d,
                a * q.b + b * q.a + c * q.d - d * q.c,
                a * q.c - b * q.d + c * q.a + d * q.b,
                a * q.d + b * q.c - c * q.b + d * q.a);
    }

    public Quaternion conjugate() {
        return new Quaternion(a, -b, -c, -d);
    }

    public List<Double> coefficients() {
        return List.of(a, b, c, d);
    }

    @Override
    public String toString() {
        String quaternionString = "";
        // get formatted coefficient and remove 0, 1.0, or -1.0 so that either value doesn't show, just coefficient, or just negative coefficient
        quaternionString = quaternionString + formatCoefficient(this.a, "");
        quaternionString = quaternionString + formatCoefficient(this.b, "i");
        quaternionString = quaternionString + formatCoefficient(this.c, "j");
        quaternionString = quaternionString + formatCoefficient(this.d, "k");
        if (quaternionString.indexOf("+") == 0) {
            quaternionString = quaternionString.substring(1);
        }
        return quaternionString.equals("") ? "0" : quaternionString;
    }

    private String formatCoefficient(double coefficient, String basisVector) {
        String coefficientFormatted = "";
        if (coefficient > 1 && basisVector != "") {
            coefficientFormatted = "+" + Double.toString(coefficient);
        } else if (coefficient == 1 && basisVector != "") {
            coefficientFormatted = "+";
        } else if (coefficient == -1 && basisVector != "") {
            coefficientFormatted = "-";
        } else {
            // number formatted is the number itself if number negative or if basisVector equals ""
            coefficientFormatted = Double.toString(coefficient);
        }

        if (coefficient != 0) {
            return coefficientFormatted + basisVector;
        } 
        return "";
    }
}

sealed interface BinarySearchTree permits Empty, Node {
    int size();
    boolean contains(String value);
    BinarySearchTree insert(String value);
}

final record Empty() implements BinarySearchTree {
    @Override
    public int size() {
        return 0;
    }

    @Override
    public boolean contains(String value) {
        return false;
    }

    @Override
    public BinarySearchTree insert(String value) {
        return new Node(value, this, this);
    }

    @Override
    public String toString() {
        return "()";
    }
}

final class Node implements BinarySearchTree {
    private final String value;
    private final BinarySearchTree left;
    private final BinarySearchTree right;

    Node(String value, BinarySearchTree left, BinarySearchTree right) {
        this.value = value;
        this.left = left;
        this.right = right;
    }

    @Override
    public int size() {
        return left.size() + right.size()  + 1;
    }

    @Override
    public boolean contains(String value ) {
        return this.value.equals(value) || left.contains(value) || right.contains(value);
    }

    @Override 
    public BinarySearchTree insert(String value) {
        if (value.compareTo(this.value) < 0) {
            return new Node(this.value, left.insert(value), right);
        } else {
            return new Node(this.value, left, right.insert(value));
        }
    }

    @Override 
    public String toString() {
        String leftStr = left instanceof Empty ? "" : left.toString();
        String rightStr = right instanceof Empty ? "" : right.toString();

        return "(" + leftStr + value + rightStr + ")";
    }
}
