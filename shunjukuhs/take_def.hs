import Data.List

main = do
  print $ take 4 "monkey"
  print $ takeRaw 4 "monkey"
  print $ takeU 4 "monkey"

  print $ drop 3 "monkey"
  print $ dropRaw 3 "monkey"

  print $ splitAt 3 "monkey"
  print $ splitAtRaw 3 "monkey"

takeRaw, takeU :: Int -> [a] -> [a]
takeRaw n (x : xs) | n > 0 = x : takeRaw (n - 1) xs
takeRaw _ _ = []

takeU = curry . unfoldr $ \nl -> case nl of
  (n, x : xs) | n > 0 -> Just (x, (n - 1, xs))
  _ -> Nothing

-- http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/case.html
-- nl が (n, x : xs) だったら、
--  \nl -> case nl of
--    (n, x : xs) | n > 0 -> Just (x, (n - 1, xs))
--    _ -> Nothing


dropRaw :: Int -> [a] -> [a]
dropRaw n (x : xs) | n > 0 = dropRaw (n - 1) xs
dropRaw _ xs = xs

splitAtRaw :: Int -> [a] -> ([a], [a])
splitAtRaw n (x : xs) | n > 0 = (x : t, d)
  where (t, d) = splitAtRaw (n - 1) xs
splitAtRaw _ xs = ([], xs)
