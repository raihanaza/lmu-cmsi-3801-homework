import { open } from "node:fs/promises"

export function change(amount: bigint): Map<bigint, bigint> {
  if (amount < 0) {
    throw new RangeError("Amount cannot be negative")
  }
  let counts: Map<bigint, bigint> = new Map()
  let remaining = amount
  for (const denomination of [25n, 10n, 5n, 1n]) {
    counts.set(denomination, remaining / denomination)
    remaining %= denomination
  }
  return counts
}

// Write your first then apply function here

// Write your powers generator here

export function* powersGenerator(base: bigint): Generator<bigint> {
    let power = 1n; // Use `bigint` to handle large numbers
    while (true) {
        yield power;
        power *= base;
    }
}


// Write your line count function here

// Write your shape type and associated functions here

// Write your binary search tree implementation here
