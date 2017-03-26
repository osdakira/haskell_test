import Data.List
-- 整数の10進数表現の各桁の数を下から順に列挙したリストを返す関数を書け
--     整数を10でわった余りと10でわった結果とにわける
--     後者について再帰的にくりかえす
--     35897ならば[7,9,8,5,3]のようになる
-- 1で関数unfoldrを使ったなら生の再帰で、生の再帰を使ったなら関数unfoldrを使って書き直せ

f :: Integer -> [Integer]
f 0 = []
f n = mod n 10 : f (div n 10)

f' :: Integer -> Maybe (Integer, Integer)
-- f' n | n == 0 = Nothing
f' 0 = Nothing
f' n = Just (mod n 10, div n 10)

main = do
  -- print $ f 35
  -- print $ f 35 == [5, 3]
  print $ f 35897 == [7,9,8,5,3]
  print $ unfoldr f' 35897 == [7,9,8,5,3]
