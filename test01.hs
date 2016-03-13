-- runhashkell test01.hs

import System.Random
import Control.Arrow

points :: Int -> [(Double, Double)]
points = uncurry zip . (randomRs (-1, 1) *** randomRs (-1, 1)) . split . mkStdGen

inCircle :: (Double, Double) -> Bool
inCircle (x, y) = x ^ 2 + y ^ 2 <= 1

inCirclePoints :: Int -> Int -> [(Double, Double)]
inCirclePoints g n = filter inCircle . take n $ points g

guessPi :: Int -> Int -> Double
guessPi g n = 4 * fromIntegral (length $ inCirclePoints g n) / fromIntegral n

main = do
  print $ guessPi 9 100000
  print $ guessPi 8 100000


-- すべての正の立方数(整数の3乗となる数)のリストcubesを作成せよ
-- cubesの先頭20要素を表示せよ

-- cubes = map (^ 3) [1..]
-- main = do
--   print $ take 20 cubes


-- 1からnまでの奇数を3倍した値すべての積を求める関数productOdd3を作成せよ
-- productOdd3 n = product . map (* 3) $ filter odd [1..n]
-- main = do
--   print $ productOdd3 3 == (1 * 3) * (3 * 3)
--   print $ productOdd3 5 == (1 * 3) * (3 * 3) * (5 * 3)

-- 1から2 * n + 1までのすべての奇数の積を求める関数productOddsを作成せよ
-- 関数oddは奇数であることを確認する関数だ

-- productOdds n = product $ filter odd [1 .. 2 * n + 1]
-- main = do
--   print $ productOdds 2 == 1 * 3 * 5
--   print $ productOdds 3 == 1 * 3 * 5 * 7
--   print $ productOdds 4 == 1 * 3 * 5 * 7 * 9

-- 1からnまでの積を求める関数productNを作成せよ
-- 関数productはリストの要素の積を返す
-- productN n = product [1..n]
-- main = do
--   print $ productN 5 == 5 * 4 * 3 * 2

-- 第2引数と第3引数を第1引数で割った余りが等しいことを確認する関数congruentを作成せよ
-- congruent 3 8 11は8も11も3で割った余りが2となり等しいのでTrue
-- congruent 5 8 14は8を5で割った余りは3で14を5で割った余りは4なのでFalse
-- aをbで割った余りをはa `mod` bで求められる
-- aとbが等しいかどうかはa == bで確かめられる

-- import Data.Function
-- congruent x y z = on (==) (`mod` x) y z
--
-- uncurry3 :: (Integer -> Integer -> Integer -> Bool) -> (Integer, Integer, Integer) -> Bool
-- uncurry3 f (x, y, z) = f x y z
--
-- main = do
--   print $ congruent 3 8 11 == True
--   print $ congruent 5 8 14 == False
--   print $ uncurry3 congruent (3, 8, 11) == True

-- 第1引数に値段を第2引数に税率をとり税込み価格を返す関数を作成せよ

-- tax selling rate = (div (selling * rate) 100) + selling
-- tax' :: (Integer, Integer) -> Integer
-- tax' = uncurry tax
--
-- main = do
--   print $ tax 100 8 == 108
--   print $ tax' (100, 8) == 108

-- 3整数タプルの要素が三角形の3辺になることを確認する関数triangleを作成せよ
-- 全ての数が1以上であり
-- どの数も他の2数の和よりも小さければ良い
-- 演算子(>), 演算子(<), 演算子(&&)等が使える
-- (>), (<)はそれぞれ「大なり」「小なり」を意味する
-- (&&)は「かつ」という意味だ
-- triangle (3, 5, 7)はTrueとなりtriangle (5, 7, 12)はFalseとなる

-- triangle :: (Integer, Integer, Integer) -> Bool
-- triangle (x, y, z)
--   | x < 1 || y < 1 || z < 1 = False
--   | x >= y + z || y >= x + z || z >= x + y = False
--   | otherwise = True
--
-- triangle (x, y, z)
--   = x > 0 && y > 0 && z > 0 &&
--     x < y + z && y < x + z && z < x + y
--
-- curry3 :: ((Integer, Integer, Integer) -> Bool) -> Integer -> Integer -> Integer -> Bool
-- curry3 f x y z = f (x, y, z)
--
-- main = do
--   print $ triangle (0, 1, 2) == False
--   print $ triangle (3, 5, 7) == True
--   print $ triangle (5, 7, 12) == False
--   print $ curry3 triangle 3 5 7 == True

-- 年齢と公開可能かどうかのブール値のタプルをとり適切に文字列化する関数を作成せよ
-- ブール値がTrueなら年齢を文字列化しFalseなら"secret"とする
-- age :: (Integer, Bool) -> String
-- age (a, bool)
--   | bool = show a
--   | otherwise = "secret"
-- -- main = do
-- --   print $ age (35, True) == "35"
-- --   print $ age (35, False) == "secret"
--
-- --  上記関数を年齢(例えば39)だけに部分適用せよ
-- --  ブール値をとり指定した年齢(39)または"secret"を表示する関数となる
-- age39 = curry age 39
-- main = do
--   print $ age39 True == "39"
--   print $ age39 False == "secret"

-- introduction :: (String, Integer) -> String
-- introduction (n, a) =
--   "My name is " ++ n ++
--   ". I'm " ++ show a ++ " years old."
--
-- main = do
--   print $ introduction ("Yoshikuni Jujo", 35)

-- 対話環境で文字'c'を文字コードに変換したものが偶数かどうかをチェックせよ

-- import Data.Char
-- main = do
--   print $ even $ ord 'c'
--   print $ (even . ord) 'c'

-- half :: Double -> Double
-- half = (/ 2)
-- seven :: Integer
-- seven = 7
--
-- main = do
--   -- half seven
--   print . half $ fromIntegral seven

-- dist0 :: Double -> Double -> Double
-- dist0 x y = sqrt $ x ^ 2 + y ^ 2
--
-- px, py :: Double
-- px = 9.0
-- py = 5.0
--
-- p :: (Double, Double)
-- p = (9.0, 5.0)
--
-- dist0' :: (Double, Double) -> Double
-- dist0' (x, y) = sqrt $ x ^ 2 + y ^ 2

-- タプルで表現された2点間の距離を求める関数distを定義せよ

-- dist :: (Double, Double) -> Double
-- dist (x, y) = sqrt $ x ^ 2 + y ^ 2
-- p :: (Double, Double)
-- p = (9.0, 5.0)
-- main = do
--   print $ dist p == dist0 9.0 5.0

-- 3引数関数の3つの引数すべてに同じ関数を適用する関数on3を定義せよ
-- on3 f a b c = (f a) + (f b) + (f c)
-- main = do
--   print $ on3 (+ 2) 1 2 3 == 3 + 4 + 5

-- 第1引数を無視し第2引数の値を返す関数const'を関数flipとconstで定義せよ
-- const' = flip const
--
-- main = do
--   -- (const id 0) 4492
--   print $ const' 0 4492 == 4492
--   print $ const' 'A' "Hello, world!" == "Hello, world!"
--   print $ const' 'A' 999 == 999




-- 3引数関数の第1引数と第3引数をいれかえる関数flip13を定義せよ

-- func a b c = a * b + c
-- flip13 f a b c = f c b a
-- const' =
--
-- main = do
--   print $ func 2 3 4 == 10
--   print $ flip13 func 4 3 2 == 10
--   print $ flip13 func 2 3 4 == 14
--   print $ const' func 4 3 2 == 10
--   print $ const' func 2 3 4 == 14

-- 第1引数の値に第2引数の関数を適用する関数applyを定義せよ
-- import Data.Char
--
-- main = do
--   print $ (.) ord toLower 'A' == 97

-- apply a f = f $ a
--
-- main = do
--   print $ apply 2 succ == 3

-- main = do
--   print $ recip $ (3 + 5) / 2

-- 第1引数を無視し第2引数の値を返す関数const'定義せよ
-- const' :: a -> b -> b
-- const' _ a = a
-- const' = const id

-- main = do
--   -- (const id 0) 4492
--   print $ const' 0 4492 == 4492
--   print $ const' 'A' "Hello, world!" == "Hello, world!"
--   print $ const' 'A' 999 == 999

-- fromMaybe _ (Just x) = x
-- fromMaybe d _ = d
--
-- maybe _ f (Jus   jjjt x) = f x
-- maybe d _ _ = d

-- fromMaybe a b = maybe a id b
--
-- main = do
--   print $ fromMaybe 0 (Just 8) == 8
--   print $ fromMaybe 0 Nothing == 0
--   print $ fromMaybe ' ' (Just 'c') == 'c'
--   print $ fromMaybe ' ' Nothing == ' '

-- *Main Data.Char> :t id "hello"
-- id "hello" :: [Char]

-- maybe2 f (Just a) (Just b) = f(a) b
-- maybe2 _ _ _ = Nothing

-- main = do
--   print $ maybe2 div (Just 6) (Just 2) == 3
--   print $ maybe2 div 6 2 == Nothing

-- 3の倍数なら3で割りそれ以外はそのままにする関数div3を定義せよ
-- 関数mod、div、演算子(==)を使う

-- div3 x
--   | mod x 3 == 0 = div x 3
--   | otherwise = x
--
-- main = do
--   print $ div3 2 == 2
--   print $ div3 3 == 1
--   print $ div3 4 == 4
--   print $ div3 5 == 5
--   print $ div3 6 == 2

-- notZero 0 = Nothing
-- notZero x = Just x

-- main = do
--   print $ notZero 0 == Nothing
--   print $ notZero 1 == Just 1

-- friend (Just name) = name ++ " is my friend"
-- friend _ = "I'm alone"
--
-- main = do
--   print $ friend (Just "osada")
--   print $ friend Nothing



-- isLarge n = n > 100
-- isLarge = (> 100)
--
-- main = do
--   print $ isLarge 99 == False
--   print $ isLarge 101 == True

-- selling /+/ tax = selling + ceiling(selling * tax)
-- -- selling /+/ tax = (div (selling * tax) 100) + selling
-- main =
--   -- print $ 100 /+/ 8 == 108
--   print $ 100 /+/ 0.08 == 108

-- tax selling = ceiling(selling * 1.08)
-- tax = \selling -> ceiling(selling * 1.08)
-- main =
--   print $ tax 100 == 108

-- third = \f n -> f(f(f n))
-- main =
--   print $ third pred 2

-- double n = n * 2
-- nary n a b = n * a + b
--
-- octal a b = nary 8 a b
--
-- main = do
--   print $ nary 10 3 8 == 38
--   print $ nary 8 2 1 == 17
--   print $ nary 2 1 1 == 3
--   print $ nary 16 3 4 == 52
--
--   print $ octal 2 1 == 17


-- module Main where
-- main::IO()

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


-- 6. カリー化された関数mult x y z = x ∗ y ∗ zは、λ式を用いるとどのよう に表現できるか示せ。
-- multi = \ x -> (\ y -> (\ z -> x * y * z))
-- main = do
--   print $ multi 2 3 4


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
