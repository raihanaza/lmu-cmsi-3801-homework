module Exercises
    ( change, powers,
      -- put the proper exports here
      volume, 
      surfaceArea,
      Shape(..), 
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

-- Write your first then apply function here

-- Write your infinite powers generator here

powers :: Integer -> [Integer]
powers base = iterate (* base) 1

-- Write your line count function here

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

-- Write your binary search tree algebraic type here
