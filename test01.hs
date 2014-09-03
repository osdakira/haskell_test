-- runhashkell test01.hs
module Main where
main::IO()

-- 4.8 練習問題
-- 1. ライブラリ関数を用いて、偶数の長さを持つリストを半分ずつに分割する
-- 関数 halve :: [a ] → ([a ], [a ]) を定義せよ。
  -- 以下に使用例を示す。
  -- > halve [1,2,3,4,5,6]
-- ([1, 2, 3], [4, 5, 6])

-- halve :: [a] -> ([a], [a])
-- halve xs = splitAt (div (length xs) 2) xs
-- main = do
--   print $ halve [1,2,3,4,5,6] == ([1, 2, 3], [4, 5, 6])

-- 2. ライブラリ関数 tail のように振る舞う関数を safetail :: [a ] → [a ] とす る。
      -- tail は空リストを与えるとエラーとなるが、safetail は空リストをエ ラーとせず、空リストを返すという違いがある。
      -- 以下を用いて、safetail を定義せよ。
-- a. 条件式
-- safetail :: [a] -> [a]
-- safetail xs = if null xs then [] else tail xs
-- main = do
--   print $ null (safetail [])
--   print $ safetail [1, 2, 3] == [2, 3]

-- b. ガード付きの等式
-- safetail :: [a] -> [a]
-- safetail xs | null xs = []
--             | otherwise = tail xs
-- main = do
--   print $ null (safetail [])
--   print $ safetail [1, 2, 3] == [2, 3]

-- c. パターンマッチ
-- safetail :: [a] -> [a]
-- safetail [] = []
-- safetail xs = tail xs
-- main = do
--   print $ null (safetail [])
--   print $ safetail [1, 2, 3] == [2, 3]


-- ヒント:ライブラリ関数 null を利用せよ。


-- 3. 論理積演算子 ∧ と同様に、パターンマッチを用いて、論理和演算子 ∨ を
--   四通りの方法で定義せよ。
-- (||) :: Bool -> Bool -> Bool
-- True  || True  = True
-- True  || False = True
-- False || True  = True
-- False || False = False

-- (||) :: Bool -> Bool -> Bool
-- False || False = False
-- _  || _  = True

-- main = do
--   print $ True Main.|| True
--   print $ True Main.|| False
--   print $ False Main.|| True
--   print $ False Main.|| False


-- 4. 以下のように定義される論理積演算子をパターンマッチではなく条件式を用いて再定義せよ。
      -- True ∧ True = True
      -- _ ∧ _ = False

-- (&&) :: Bool -> Bool -> Bool
-- (&&) x y = if x == False then False else
--              if y == False then False else True

-- main = do
--   print $ ((Main.&& True) True) == True
--   print $ ((Main.&& True) False) == False

-- 5. 以下についても同様にせよ。必要になる条件式の個数が異なることに 注意。
-- True ∧ b = b
-- False ∧ ￼ = False


------------------------
-- -- TODO 分からない --
------------------------
-- (&&) :: forall a. a => Bool -> a -> a
-- (&&) x y = if x == False then False else y
-- main = do
--   print $ True Main.&& 1 == 1
--   print $ True Main.&& False == False
--   print $ False Main.&& 1 == False
--   print $ False Main.&& True == False


-- 6. カリー化された関数multxyz=x∗y∗zは、λ式を用いるとどのよう に表現できるか示せ。


-- signum n | n < 0     = -1
--          | n == 0    = 0
--          | otherwise = 1


-- # 3章

--  1. 以下の値の型は何か?
--  ['a','b','c']
  -- Prelude> :t ['a','b','c']
  -- ['a','b','c'] :: [Char]

--  ('a', 'b', 'c')
  -- Prelude> :t ('a', 'b', 'c')
  -- ('a', 'b', 'c') :: (Char, Char, Char)

--  [ (False , '0'), (True , '1') ]
  -- Prelude> :t [ (False , '0'), (True , '1') ]
  -- [ (False , '0'), (True , '1') ] :: [(Bool, Char)]

-- ([False, True ], ['0','1'])
  -- Prelude> :t ([False, True ], ['0','1'])
  -- ([False, True ], ['0','1']) :: ([Bool], [Char])


-- [ tail , init , reverse ]
  -- Prelude> :t [ tail , init , reverse ]
  -- [ tail , init , reverse ] :: [[a] -> [a]]


-- 2. 以下の関数の型は何か?
-- second xs = head (tail xs)
-- Prelude> let second xs = head (tail xs)
-- Prelude> :type second
-- second :: [a] -> a

-- swap (x,y) = (y,x)
  -- Prelude> let swap (x,y) = (y,x)
  -- Prelude> :t swap
  -- swap :: (t1, t) -> (t, t1)

-- pair x y  = (x,y)
  -- Prelude> let pair x y  = (x,y)
  -- Prelude> :t pair
  -- pair :: t -> t1 -> (t, t1)

-- double x  = x * 2
  -- Prelude> let double x  = x * 2
  -- Prelude> :t double
  -- double :: Num a => a -> a

-- palindrome xs = reverse xs == xs
  -- Prelude> let palindrome xs = reverse xs == xs
  -- Prelude> :t palindrome
  -- palindrome :: Eq a => [a] -> Bool

-- twice f x = f (f x)
  -- Prelude> let twice f x = f (f x)
  -- Prelude> :t twice
  -- twice :: (t -> t) -> t -> t








--   ヒント:関数定義に多重定義された演算子が使われている場合、クラス制
--   約を記述すべきことに注意せよ。
-- 3. 上記二つの問題の答えを Hugs を使って確かめよ。
-- 4. 一般的に関数の型を Eq クラスのインスタンスにするのが実現不可能な理
-- 由は何か? どういった場合に実現可能か? ヒント:同じ型の二つの関 数が同等であるのは、同等な引数に対して同等な結果を返すときである。

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
