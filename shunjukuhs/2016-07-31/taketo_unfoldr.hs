import Data.List

takeTo1 p [] = []
takeTo1 p (x : xs)
  | p x = [x]
  | otherwise = x : takeTo1 p xs

takeTo2 p = foldr (\x -> (x :) . if p x then const [] else id) []

takeTo3 p = unfoldr $ \s -> case s of
  [] -> Nothing
  x : xs | p x -> Just (x, [])
         | otherwise -> Just (x, xs)

main = do
  print $ takeTo1 (== 5) [0..10]
  print $ takeTo2 (== 5) [0..10]
  print $ takeTo3 (== 5) [0..10]
