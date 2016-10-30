import Data.List
import Data.Either

data Apple = Leaf | Flower | Fruit | Branch Apple Apple deriving Show
type Basket = [Apple]

price1 :: Apple -> Int
price1 Leaf = 50
price1 Flower = 80
price1 Fruit = 100
price1 (Branch a1 a2) = 20 + price1 a1 + price1 a2

price :: Basket -> Int
price = sum . map price1

dfs :: Apple -> [Apple]
dfs (Branch a1 a2) = dfs a1 ++ dfs a2
dfs a = [a]

bfs :: Apple -> [Apple]
bfs = concat . bfsl . (: [])

bfsl :: [Apple] -> [[Apple]]
bfsl = unfoldr $ \as -> if null as then Nothing
  else let (ats, brs) = partitionEithers $ map branch as in
    Just (ats, concat brs)

branch :: Apple -> Either Apple [Apple]
branch (Branch a1 a2) = Right [a1, a2]
branch a = Left a

-- main = do
--   print $ price [Leaf, Leaf, Flower, Fruit, Fruit, Fruit] == 480
--   print $ price1 $ Branch (Branch Fruit Leaf) Flower
--   print $ dfs $ Branch (Branch Fruit Leaf) Flower
--   print $ bfs $ Branch (Branch Fruit Leaf) Flower

data Matryoshka = Nest | Term
dfs :: Apple -> [Apple]
dfs (Branch a1 a2) = dfs a1 ++ dfs a2
dfs a = [a]

count :: [Matryoshka] -> Int
price = sum . map price1

main = do
   print $ count [Nest, Nest, Term]
