module Exercises
    ( change,
      firstThenApply,
      volume, 
    ( change, 
      firstThenApply,
      powers,
      meaningfulLineCount,
      Shape(..),
      volume,
      surfaceArea,
      BST(Empty),
      size,
      contains,
      insert,
      inorder
    ) where

import qualified Data.Map as Map
import Data.Text (pack, unpack, replace)
import Data.List(isPrefixOf, find)
import Data.Char(isSpace)
import GHC.RTS.Flags (DoCostCentres)

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

powers :: Integer -> [Integer]
powers base = iterate (* base) 1

meaningfulLineCount :: FilePath -> IO Int
meaningfulLineCount path = do
  document <- readFile path
  let allWhiteSpace = all isSpace
      trimStart = dropWhile isSpace 
      isMeaningful line = not (allWhiteSpace line) && not ("#" `isPrefixOf` trimStart line)
  return $ length $ filter isMeaningful $ lines document

data Shape 
  = Sphere Double 
  | Box Double Double Double 
  deriving (Eq, Show)

volume :: Shape -> Double
volume (Sphere r) = (4.0 / 3.0) * pi * r^3
volume (Box l w h) = l * w * h

surfaceArea :: Shape -> Double
surfaceArea (Sphere r) = 4.0 * pi * r^2
surfaceArea (Box l w h) = 2.0 * (l * w + h * l + h * w)

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
