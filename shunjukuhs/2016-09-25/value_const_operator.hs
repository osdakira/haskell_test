data Cap = Red | Blue | Yellow deriving Show
-- data Order = Change Cap Cap deriving Show
-- recreation :: Cap -> [Order] -> Cap
-- recreation c [] = c
-- recreation Red (Change Red c : os) = recreation c os
-- recreation Blue (Change Blue c : os) = recreation c os
-- recreation Yellow (Change Yellow c : os) = recreation c os
-- recreation c (_ : os) = recreation c os
data Order = Cap :-> Cap deriving Show
recreation :: Cap -> [Order] -> Cap
recreation c [] = c
recreation Red (Red :-> c : os) = recreation c os
recreation Blue (Blue :-> c : os) = recreation c os
recreation Yellow (Yellow :-> c : os) = recreation c os
recreation c (_ : os) = recreation c os
-- recreation Blue [Change Red Blue, Change Blue Red, Change Yellow Red, Change Red Yellow] Yellow

----
    -- 同じ文字の連続を文字と整数値で表現する型を作成せよ
    --     値構築演算子名には:*:を使用せよ
    -- 上記の型の値のリストを文字列に変換する関数を作成せよ

data CharCount = CharCount Char Int deriving Show
-- -- data Count = Count CharCount
-- counting :: String -> [CharCount]
-- counting [] = []
-- counting CharCount (CharCount x: xs) = counting x xs
-- counting x : y : xs = counting (CharCount x 1) xs
-- data Count = String :*: CharCount deriving Show

-- a (x : xs) = x : a(xs)
-- a [] = []
a (x : xs) = a1 (CharCount x 1) xs

a1 :: (CharCount, String) -> [CharCount]
a1 ((CharCount c i), (x : xs)) = case c == x of
  True -> a1 ((CharCount c (i + 1)), xs)
  False -> a1 ((CharCount x 1), xs)
-- a (x : y : xs) = (x, y, xs)
-- a (x : []) = (x, x, "")

main = do
  -- print $ counting "aabbbcaaa" == [(a, 2), (b, 3), (c, 1), (a, 3)]
  print $ a "aabbbcaaa"
  print $ a "ab"
  print $ a "a"
