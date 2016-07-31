-- したのルールで値nから次の値を求めることで作られる無限リストを返す関数を書け
--     値nが3の倍数ならば3で割る
--     値nを3で割った余りが1ならば2倍して1足す
--     値nを3で割った余りが2ならば2倍して2足す
--     初期値が11なら11, 24, 8, 18, 6, 2, 6, 2, ...
-- 1で関数iterateを使ったなら生の再帰で、生の再帰を使ったなら関数iterateで書き直せ

fNext :: Integer -> Integer
fNext n = case mod n 3 of
  0 -> div n 3
  1 -> n * 2 + 1
  2 -> n * 2 + 2

f :: Integer -> [Integer]
f n = n : f (fNext n)

main = do
  print $ map fNext [0..10]
  print $ take 10 $ f 11
  print $ take 10 $ iterate fNext 11
