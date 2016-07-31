import Data.List

main = do
  print $ "monk" ++ "ey"
  print $ "monk" .++ "ey"

  print $ "monk" .++. "ey"

  print $ "monk" .++.. "ey"

  print $ concat ["He", "And", "She", "Know", "Everyone", "Likes", "Lisp"]
  print $ concatRaw ["He", "And", "She", "Know", "Everyone", "Likes", "Lisp"]
  print $ concatF ["He", "And", "She", "Know", "Everyone", "Likes", "Lisp"]

  print $ reverse "gateman"
  print $ reverseRaw "gateman"
  print $ reverseF "gateman"
  print $ reverseRaw' "gateman"

(x : xs) .++ ys = x : (xs .++ ys)
[] .++ ys = ys

-- xs .++. ys = foldr (:) ys xs
-- http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/flip.html
(.++.) = flip $ foldr (:)

(.++..) = curry . unfoldr $ \xys -> case xys of
  (x : xs, ys) -> Just (x, (xs, ys))
  (_, y : ys) -> Just (y, ([], ys))
  _ -> Nothing

concatRaw, concatF :: [[a]] -> [a]
concatRaw (xs : xss) = xs ++ concatRaw xss
concatRaw _ = []

concatF = foldr (++) []

reverseRaw, reverseF :: [a] -> [a]
reverseRaw = rv []
  where
  rv rs (x : xs) = rv (x : rs) xs
  rv rs _ = rs

rv2 rs (x : xs) = rv2 (x : rs) xs
rv2 rs _ = rs
reverseRaw' = rv2 []

reverseF = foldl (flip (:)) []
