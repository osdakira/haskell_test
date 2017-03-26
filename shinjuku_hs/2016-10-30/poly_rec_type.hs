data Apple = Leaf | Flower | Fruit deriving Show
-- data Tree a = Branch (Tree a) (Tree a) | Atom a deriving Show
-- 1. 上記Treeに枝がひとつしかない値を追加した型を作成せよ
data Tree a = Branch (Tree a) (Tree a) | Twig (Tree a) | Atom a deriving Show

priceA :: Apple -> Int
priceA Leaf = 50
priceA Flower = 80
priceA Fruit = 100

price1 :: Tree Apple -> Int
price1 (Atom a) = priceA a
price1 (Twig t1) = 20 + price1 t1
price1 (Branch t1 t2) = 20 + price1 t1 + price1 t2

dfs :: Tree a -> [a]
dfs (Atom a) = [a]
dfs (Twig t1) = dfs t1
dfs (Branch t1 t2) = dfs t1 ++ dfs t2

main = do
  print $ (price1 $ Branch (Branch (Atom Leaf) (Atom Flower)) (Atom Fruit)) == 270
  print $ (price1 $ Branch (Branch (Atom Leaf) (Atom Flower)) (Twig (Atom Fruit))) == 290
  print $ dfs $ Branch (Branch (Atom Leaf) (Atom Flower)) (Atom Fruit)
  -- => [Leaf,Flower,Fruit]
  print $ dfs $ Branch (Branch (Atom Leaf) (Atom Flower)) (Twig (Atom Fruit))
  -- => [Leaf,Flower,Fruit]
