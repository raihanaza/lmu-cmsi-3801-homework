import java.util.List;
import java.util.Map;
import java.util.Objects;
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
record Quaternion(double a, double b, double c, double d) {
    // when do quaternion.something, that something has to be static
    public final static Quaternion ZERO = new Quaternion(0, 0, 0, 0);
    public final static Quaternion I = new Quaternion(1, 0, 0, 0);
    public final static Quaternion J = new Quaternion(0, 1, 0, 0);
    public final static Quaternion K = new Quaternion(0, 0, 1, 0);
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

    // times is an instance method
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
        var sb = new StringBuilder();
        if (a != 0) {
            sb.append(a);
        }
        if (b != 0) {
            if (sb.length() > 0) {
                sb.append(b > 0 ? "+" : "-");
            }
            sb.append(Math.abs(b)).append("i");
        }
        if (c != 0) {
            if (sb.length() > 0) {
                sb.append(c > 0 ? "+" : "-");
            }
            sb.append(Math.abs(c)).append("j");
        }
        if (d != 0) {
            if (sb.length() > 0) {
                sb.append(d > 0 ? "+" : "-");
            }
            sb.append(Math.abs(d)).append("k");
        }
        return sb.toString();
    }
}

// Write your BinarySearchTree sealed interface and its implementations here
