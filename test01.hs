module Main where

-- 4. リストを逆順に整列するように関数 qsort の定義を変えるにはどうすればよいか?

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
  where
    smaller = [a | a <- xs, a > x]
    -- larger  = [b | b <- xs, b <= x]
    larger  = [b | b <- xs, b < x]

main::IO()
main = do
  print (qsort [2,2,3,1,1])

-- qsort [] = []
-- qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
--   where
--     smaller = [a | a <- xs, a <= x]
--     larger  = [b | b <- xs, b > x]

-- main = do
--   print(qsort [3,5,1,4,2])

-- 3. 数値のリストに対し要素の積を計算する関数 product を定義せよ。そして、その定義を使って product [ 2, 3, 4 ] = 24 となることを示せ。

-- my_product [] = 1
-- my_product (x:xs) = x * my_product xs
-- main = do print (my_product [ 2, 3, 4 ] == 24)


-- double x = x * 2
-- main = do print (double (double 2))

-- double x = x + x
-- main = do print (double (double 2))

-- main = do putStrLn "What is 2 + 2?"
--           x <- readLn
--           if x == 4
--               then putStrLn "You're right!"
--               else putStrLn "You're wrong!"
