import Data.List

main = do
  print $ zip [0 ..] "hello"
  print $ zipRaw [0 ..] "hello"
  print $ zipU [0 ..] "hello"

  print $ zipZW [0 ..] "hello"

  print $ zipWith (*) [5, 8, 2, 1] [3 ..]
  print $ zipWithRaw (*) [5, 8, 2, 1] [3 ..]

  print $ unzip [(3, 8), (9, 5), (4, 2)]
  print $ unzipRaw [(3, 8), (9, 5), (4, 2)]
  print $ unzipF [(3, 8), (9, 5), (4, 2)]

zipRaw, zipU :: [a] -> [b] -> [(a, b)]
zipRaw (x : xs) (y : ys) = (x, y) : zipRaw xs ys
zipRaw _ _ = []

zipU = curry . unfoldr $ \l -> case l of
  (x : xs, y : ys) -> Just ((x, y), (xs, ys))
  _ -> Nothing

zipWithRaw op (x : xs) (y : ys) = x `op` y : zipWithRaw op xs ys
zipWithRaw _ _ _ = []

zipZW = zipWith (,)

unzipRaw, unzipF :: [(a, b)] -> ([a], [b])
unzipRaw ((x, y) : xys) = (x : xs, y : ys)
  where (xs, ys) = unzipRaw xys
unzipRaw _ = ([], [])

unzipF = foldr (\(x, y) (xs, ys) -> (x : xs, y : ys)) ([], [])
