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

interface Sphere { 
  kind: "Sphere"
  readonly radius: number
}

interface Box {
  kind: "Box"
  readonly width: number
  readonly length: number 
  readonly depth: number
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

export function isEqual(shape1: Shape, shape2: Shape): boolean {
  if (shape1.kind !== shape2.kind) return false;
  switch (shape1.kind) {
    case "Sphere":
      return shape1.radius === (shape2 as Sphere).radius;
    case "Box":
      return (
        shape1.width === (shape2 as Box).width &&
        shape1.length === (shape2 as Box).length &&
        shape1.depth === (shape2 as Box).depth
      );
  }
}

// Write your binary search tree implementation here
