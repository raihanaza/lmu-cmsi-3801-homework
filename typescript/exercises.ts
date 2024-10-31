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

export async function meaningfulLineCount(fileName: string): Promise<number> {
  const file = await open(fileName, "r")
  let count = 0

  for await (const line of file.readLines()) {
    const newLine = line.trim()
    if (!(newLine.length == 0 || newLine[0] == "#")) {
      count += 1
    }
  }
  return count
}

// Write your shape type and associated functions here

// Write your binary search tree implementation here
