import Data.Char
import Data.List

main = do
  print $ toUpper `map` "Haskell"
  -- 文字列は、配列である
  print $ filter isLower "Capes"
  -- 小文字のみ取り出す
  print $ partition isLower "Capes"
  print $ partition isLower "HelloWorld"
  -- isLower の成否で、分割する
  print $ take 4 "monkey"
  -- 4文字目まで抜き出す
  print $ drop 3 "monkey"
  -- 後ろの3文字を取り出す
  print $ splitAt 3 "monkey"
  -- 3文字目で分割する
  print $ takeWhile isLower "takeWhile"
  print $ takeWhile isLower "HelloWorld"
  -- isLower の間だけ取り出す
  print $ dropWhile isLower "takeWhile"
  print $ dropWhile isLower "HelloWorld"
  -- isLower じゃない間は無視する
  print $ span isLower "takeWhile"
  print $ span isLower "HelloWorld"
  -- isLower の部分だけで、分割する
  print $ zip [0 ..] "hello"
  print $ zip [10 ..] "HelloWorld"
  -- 2つのリストをzipする。無限リスト + 有限リストで、有限になる
  print $ zipWith (+) [2, 5, 10] [5, 9, 7, 8]
  -- 短い方は無視
  print $ unzip [(4, 'a'), (4, 'b'), (9, 'c'), (2, 'd')]
  -- unzip. 短いとかはない。
  print $ "Yoshikuni" ++ "Jujo"
  print $ concat ["Haskell", "Brooks", "Curry"]
  print $ reverse "gateman"
  -- 代表的な文字列操作
  print $  take 32 $ repeat 'a'
  -- 'a' をリピートする無限リストから、32文字取り出す。
  print $ replicate 32 'a'
  -- 32回くり変えす
  print $ take 32 $ cycle "Happy"
