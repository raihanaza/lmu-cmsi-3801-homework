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

// Write your line count function here

interface Sphere { 
  kind: "Sphere"
  radius: number
}

interface Box {
  kind: "Box"
  width: number
  length: number 
  depth: number
}

export type Shape = Sphere | Box

export function surfaceArea (shape: Shape): number {
  switch (shape.kind) {
    case "Sphere":
      return 4 * Math.PI * shape.radius ** 2;
    case "Box":
      return 2 * (shape.width * shape.length + shape.width * shape.depth + shape.length * shape.depth);
  }
}

export function volume (shape: Shape): number {
  switch (shape.kind) {
    case "Sphere":
      return (4 / 3) * Math.PI * shape.radius ** 3
    case "Box":
      return (shape.length * shape.width * shape.depth)
  }
}

// Write your binary search tree implementation here
