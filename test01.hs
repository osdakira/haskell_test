-- runhashkell test01.hs
module Main where
main::IO()
main = do
  print "aa"

-- # 3章


--   5. 同様に、空でないリストから最後の要素を取り除くライブラリ関数 init が、二通りの方法で定義できることを示せ。


-- 4. この章で紹介したライブラリ関数を使って、空でないリストの最後の要素 を取り出す関数 last を定義せよ。さらに他の定義も考えよ。
-- my_last x = head (reverse x)
-- my_last2 x = x !! ((length x) - 1)

-- main = do
--   print (my_last [1,2,3,4,5] == 5)
--   print (my_last2 [1,2,3,4,5] == 5)



-- main = do
--   print(2 ^ 3 * 4 == (2 ^ 3) * 4)
--   print( 2 * 3 + 4 * 5 == (2 * 3) + (4 * 5))
--   print( 2 + 3 * 4 ^ 5 == 2 + (3 * (4 ^ 5)))

-- 2.6
-- p2_6 bool = 2 ^ 3 * 4 == (2 ^ 3) * 4

-- -- 1. 関数名は小文字から
-- -- 2. インデント
-- -- 3. ？？？
-- n = a `div` length xs
--   where
--     a = 10
--     xs = [1,2,3,4,5]

-- main::IO()
-- main = do
--   print n

-- # 第2章


-- -- 4. リストを逆順に整列するように関数 qsort の定義を変えるにはどうすればよいか?

-- qsort :: Ord a => [a] -> [a]
-- qsort [] = []
-- qsort (x:xs) = qsort larger ++ [x] ++ qsort smaller
--   where
--     smaller = [a | a <- xs, a > x]
--     -- larger  = [b | b <- xs, b <= x]
--     larger  = [b | b <- xs, b < x]

-- main::IO()
-- main = do
--   print (qsort [2,2,3,1,1])

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
