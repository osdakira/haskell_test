-- main = do
--   print $ [10 .. 15]

-- 整数(Integer)型の値に対して関数enumFromToと同じように動く関数myEnumFromToを作成する。始めの値と最後の値を引数としてとり始めの値から1ずつふやして最後の値に達するまでのリストを返す。

myEnumFromTo :: Integer -> Integer -> [Integer]
myEnumFromTo m n | m > n = []
myEnumFromTo m n = m : myEnumFromTo (m + 1) n

main = do
  print $ myEnumFromTo 10 15
