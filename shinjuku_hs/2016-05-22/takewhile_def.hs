import Data.List

main = do
  print $ takeWhile even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]
  print $ takeWhileRaw even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]
  print $ takeWhileF even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]
  print $ takeWhileU even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]

  print $ dropWhile even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]
  print $ dropWhileRaw even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]

  print $ span even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]
  print $ spanRaw even [4, 10, 8, 2, 5, 4, 1, 3, 2, 9]

takeWhileRaw, takeWhileF, takeWhileU :: (a -> Bool) -> [a] -> [a]

takeWhileRaw p (x : xs) | p x = x : takeWhileRaw p xs
takeWhileRaw _ _ = []

takeWhileF p = foldr (\x -> if p x then (x :) else const []) []

takeWhileU p = unfoldr $ \l -> case l of
  x : xs | p x -> Just (x, xs)
  _ -> Nothing

dropWhileRaw :: (a -> Bool) -> [a] -> [a]
dropWhileRaw p (x : xs) | p x = dropWhileRaw p xs
dropWhileRaw _ xs = xs

spanRaw :: (a -> Bool) -> [a] -> ([a], [a])
spanRaw p (x : xs) | p x = (x : t, d)
  where (t, d) = spanRaw p xs
spanRaw _ xs = ([], xs)
-- ガード節の otherwise の代わりに、定義している
