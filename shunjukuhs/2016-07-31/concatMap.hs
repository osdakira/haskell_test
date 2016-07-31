import Data.List
    -- 関数concatMapFを定義せよ
    --     関数concatMapと同じ動作
    --     関数foldrで定義する
    --     関数mapFの定義が参考になる
    -- 関数concatMapRawを定義せよ
    --     関数concatMapと同じ動作
    --     生の再帰で定義する
    --     関数concatは使わない
    --     関数mapRawの定義が参考になる
    --     関数cycleRawの定義が参考になる
    --     (:)の代わりに(++)を使うことを考える

concatMap' :: (a -> [b]) -> [a] -> [b]
-- concatMap' f = concat . map f
-- concatMap' f = (concat .) $ map f
-- concatMap' f = (concat .) . map $ f
concatMap' = (concat .) . map

mapRaw f (x : xs) = f x : mapRaw f xs
mapRaw _ _ = []

mapF f = foldr ((:) . f) []
concatF = foldr (++) []

concatMapRaw f (x : xs) = f x ++ concatMapRaw f xs
concatMapRaw _ _ = []

-- concatMapF :: (a -> [b]) -> [a] -> [b]
concatMapF f = foldr ((++) . f) []

main = do
  print $ mapF (+ 2) [0..5]
  print $ concatMap' (replicate 3) "hello"
  print $ concatMapRaw (replicate 3) "hello"
  print $ concatMapF (replicate 3) "hello"
