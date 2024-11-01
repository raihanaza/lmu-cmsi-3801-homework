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

export function* powersGenerator(base: bigint): Generator<bigint> {
    let power = 1n; // Use `bigint` to handle large numbers
    while (true) {
        yield power;
        power *= base;
    }
}


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


export interface BinarySearchTree<T> {
  size(): number
  insert(value: T): BinarySearchTree<T>
  contains(value: T): boolean
  inorder(): Iterable<T>
}

export class Empty<T> implements BinarySearchTree<T> {
  size(): number {
    return 0
  }

  insert(value: T): BinarySearchTree<T> {
    return new Node(value, this, this)
  }

  contains(value: T): boolean {
    return false
  }

  inorder(): Iterable<T> {
    return []
  }

  toString(): string {
    return "()"
  }
}

class Node<T> implements BinarySearchTree<T> {
  private value: T;
  private left: BinarySearchTree<T>
  private right: BinarySearchTree<T>

  constructor(value: T, left: BinarySearchTree<T>, right: BinarySearchTree<T>) {
    this.value = value
    this.left = left
    this.right = right
  }

  size(): number {
    return this.left.size() + this.right.size() + 1
  }

  insert(value: T): BinarySearchTree<T> {
    if (value < this.value) {
      return new Node(this.value, this.left.insert(value), this.right)
    } else if (value > this.value) {
      return new Node(this.value, this.left, this.right.insert(value))
    } else {
      return this
    }
  }

  contains(value: T): boolean {
    return this.value === value || this.left.contains(value) || this.right.contains(value);
  }

  *inorder(): Iterable<T> {
    if (this.left) {
      yield* this.left.inorder()
    }
    
    if (this.value) {
      yield this.value
    }

    if (this.right) {
      yield* this.right.inorder()
    }
  }

  toString(): string {
    return ("(" + this.left + this.value + this.right + ")").replace(/\(\)/g, '');
  }
}
