import Data.Char
-- 同じ型の値3つを格納する型Threeを定義せよ
-- 上記の型の中身に同じ関数を適用する関数mapThreeを定義せよ
--
--     mapThree ord $ Three 'h' 's' 'k'で試してみよ

data Three a = Three a a a deriving Show
-- mapThree :: (a -> b -> c) -> Three a -> Three b -> Three c
mapThree f (Three x y z) = Three (f x) (f y) (f z)

main = do
  print $ mapThree ord $ Three 'h' 's' 'k'
