module Exercises
    ( change,
      firstThenApply,
      BST(Empty),
      size,
      contains,
      insert,
      inorder
      -- put the proper exports here
    ) where

import qualified Data.Map as Map
import Data.Text (pack, unpack, replace)
import Data.List(isPrefixOf, find)
import Data.Char(isSpace)

change :: Integer -> Either String (Map.Map Integer Integer)
change amount
    | amount < 0 = Left "amount cannot be negative"
    | otherwise = Right $ changeHelper [25, 10, 5, 1] amount Map.empty
        where
          changeHelper [] remaining counts = counts
          changeHelper (d:ds) remaining counts =
            changeHelper ds newRemaining newCounts
              where
                (count, newRemaining) = remaining `divMod` d
                newCounts = Map.insert d count counts

firstThenApply :: [a] -> (a -> Bool) -> (a -> b) -> Maybe b
firstThenApply lst predicate fn = fn <$> find predicate lst

-- Write your infinite powers generator here

-- Write your line count function here

-- Write your shape data type here

-- Write your binary search tree algebraic type here
data BST  a = Empty | Node a (BST a) (BST a)

insert :: (Ord a) => a -> BST a -> BST a
insert value Empty = Node value Empty Empty
insert x (Node value left right)
  | x < value = Node value (insert x left) right
  | x > value = Node value left (insert x right)
  | otherwise = Node value left right

contains :: (Ord a) => a -> BST a -> Bool
contains _ Empty = False
contains x (Node value left right)
  | x == value = True
  | x < value = contains x left 
  | otherwise = contains x right

size :: BST a -> Int
size Empty = 0
size (Node _ left right) = 1 + size left + size right

inorder :: BST a -> [a]
inorder Empty = []
inorder (Node value left right) = inorder left ++ [value] ++ inorder right

instance (Show a) => Show (BST a) where
  show :: Show a => BST a -> String
  show Empty = "()"
  show (Node value Empty Empty) = "(" ++ show value ++ ")"
  show (Node value Empty right) = "(" ++ show value ++ show right ++ ")"
  show (Node value left Empty) = "(" ++ show left ++ show value ++ ")"
  show (Node value left right) = "(" ++ show left ++ show value ++ show right ++ ")"
