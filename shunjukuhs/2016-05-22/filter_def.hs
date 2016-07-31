import Data.Char
import Data.List

main = do
  print $ filter even [3, 8, 2, 4, 5, 9, 6, 7]
  print $ filter isUpper "He And She Know Everyone Likes Lisp.\n"

  print $ filterRaw isUpper "He And She Know Everyone Likes Lisp.\n"
  print $ filterF isUpper "He And She Know Everyone Likes Lisp.\n"

  print $ partition even [3, 8, 2, 4, 5, 9, 6, 7]
  print $ partition isUpper "He And She Know Everyone Likes Lisp.\n"

  print $ partitionRaw isUpper "He And She Know Everyone Likes Lisp.\n"
  print $ partitionF isUpper "He And She Know Everyone Likes Lisp.\n"

filterRaw, filterF :: (a -> Bool) -> [a] -> [a]

filterRaw p (x : xs)
  | p x = x : filterRaw p xs
  | otherwise = filterRaw p xs
filterRaw _ _ = []
-- | if(p x) { return [x : filterRaw p xs] } みたいなもの

-- http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/id.html
filterF p = foldr (\x -> if p x then (x :) else id) []

-- partition
partitionRaw, partitionF :: (a -> Bool) -> [a] -> ([a], [a])

-- http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/where.html
partitionRaw p (x : xs)
  | p x = (x : ts, es)
  | otherwise = (ts, x : es)
  where (ts, es) = partitionRaw p xs
partitionRaw _ _ = ([], [])

partitionF p = foldr
  (\x (ts, es) -> if p x then (x : ts, es) else (ts, x : es))
  ([], [])
