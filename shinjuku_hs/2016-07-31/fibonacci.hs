-- 0, 1で始まり前の値の2倍と今の値を足した値が次の値になるような数列を作れ
--    0, 1, 1, 3, 5, 11, 21, 43, 85, 171, ...

f 0 = 0
f 1 = 1
f n = (f (n - 2)) * 2 + f (n - 1)

calc a b = b + a * 2
f1@(_ : tf) = 0 : 1 : zipWith calc f1 tf

main = do
  print $ map f [0..10]
  print $ take 10 f1
