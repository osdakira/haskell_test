takeTo :: (a -> Bool) -> [a] -> [a]
takeTo _ [] = []
takeTo p (x : xs)
  | p x = [x]
  | otherwise = x : takeTo p xs
-- takeTo p = foldr (\x -> (x :) . if p x then const [] else id) []

collatzNext :: Integer -> Integer
collatzNext n
  | even n = n `div` 2
  | otherwise = n * 3 + 1

collatzInf :: Integer -> [Integer]
collatzInf n = n : collatzInf (collatzNext n)

-- collatzInf :: Integer -> [Integer]
-- collatzInf = iterate $ \n -> if even n then n `div` 2 else n * 3 + 1

collatz :: Integer -> [Integer]
collatz = takeTo (== 1) . collatzInf

main = do
  print $ takeTo even [3, 7, 9, 8, 5, 4, 2]
  print $ collatz 11
