module Exercises
    ( change,
      meaningfulLineCount
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

-- Write your first then apply function here

-- Write your infinite powers generator here

meaningfulLineCount :: FilePath -> IO Int
meaningfulLineCount path = do
  document <- readFile path
  let allWhiteSpace = all isSpace
      trimStart = dropWhile isSpace 
      isMeaningful line = not (allWhiteSpace line) && not ("#" `isPrefixOf` trimStart line)
  return $ length $ filter isMeaningful $ lines document

-- Write your shape data type here

-- Write your binary search tree algebraic type here
