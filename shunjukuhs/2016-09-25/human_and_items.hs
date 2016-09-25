-- 名前と高さで建物を表現する型を作成せよ
--
--     建物の高さを教える文字列を作る関数を作成せよ
--     以下の例を試せ
--         Burj Khalifa: 828m
--         Abraj Al Bait Towers: 601m
--         One World Trade Center: 541m

data Building = Building String Int

height :: Building -> String
height (Building n i) = n ++ " is " ++ show i ++ "m"

building1 = Building "Burj Khalifa" 828
building2 = Building "Abraj Al Bait Towers" 601
building3 = Building "One World Trade Center" 541

main = do
  print $ [height x | x <- [building1, building2, building3] ]
