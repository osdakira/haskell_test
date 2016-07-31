import Data.Char
import Data.List

main = do
  print $ map (* 3) [5, 3, 4, 9, 1]
  print $ map toUpper "Hello"

  print $ mapF (* 3) [5, 3, 4, 9, 1]
  print $ mapU (* 3) [5, 3, 4, 9, 1]

mapRaw f (x : xs) = f x : mapRaw f xs
mapRaw _ _ = []

mapF f = foldr ((:) . f) []
-- http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/function_summary.html
-- \x xs -> f x : xs
-- 関数定義は関数リテラルによる関数の作成と変数束縛の2つを同時にする構文糖だ。
-- \x xs -> (:) (f x) xs
-- 演算子は丸括弧で関数に、関数はバッククォートで演算子になる。
-- \x -> (:) $ f x
-- (:) . f
-- http://skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/fold_right.html


-- skami.iocikun.jp/computer/haskell/web_lecture/for_programmer/unfoldr.html
-- import Data.List
mapU f = unfoldr $ \l -> case l of
  x : xs -> Just (f x, xs)
  _ -> Nothing


--  \l -> case l of
--    x : xs -> Just (f x, xs)
--    _ -> Nothing
-- l がリストなら、
  -- Just (f x, xs)
-- それ以外は
  -- Nothing
-- を返す関数
