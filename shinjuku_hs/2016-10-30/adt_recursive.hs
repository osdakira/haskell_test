import Data.List
import Data.Either

data Matryoshka = Nest Matryoshka | Term deriving Show

search :: Matryoshka -> [Matryoshka]
search (Nest a) = [Term] ++ search a
search Term = [Term]

count :: Matryoshka -> Int
count = length . search

main = do
  print $ search Term
  print $ search (Nest Term)
  print $ search (Nest (Nest Term))
  print $ count (Nest (Nest Term))
  print $ count (Nest (Nest (Nest Term)))
