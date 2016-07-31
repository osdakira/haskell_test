import Data.Char
import Data.List

filterU :: (a -> Bool) -> [a] -> [a]
filterU p = unfoldr $ \l -> case dropWhile (not . p) l of
  x : xs -> Just (x, xs)
  _ -> Nothing

main = do
  print $ filterU even [3, 8, 2, 4, 5, 9, 6, 7]
  print $ filterU isUpper "He And She Know Everyone Likes Lisp.\n"
