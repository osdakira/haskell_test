-- data Circle = Circle { centerX :: Double, centerY :: Double, radius :: Double } deriving Show
--
-- main = do
--   let c = Circle 10 15 7
--   print $ c
--   print $ centerX c == 10.0
--   print $ centerY c == 15.0
--   print $ radius c == 7.0
--   let c1 = c { centerX = 25 }
--   print $ c1
--   print $ centerX c1 == 25.0

-- nameとageの2つのフィールドを持つHuman型を定義せよ
-- レコード構文を使ってHuman型の値を作成しletで変数を束縛せよ
-- 上記の変数を束縛した値のageフィールドだけ更新した値を作成せよ
-- 関数name, ageを試してみよ
-- レコード構文によるパターンマッチで人を表現する文字列を返す関数を作成せよ
--    "Masuo(35)"のような表示とする


data Human = Human { name :: String, age :: Integer } deriving Show

echo :: Human -> String
echo Human { name = n, age = a } = n ++ "(" ++ show a ++ ")"

main = do
  let human = Human { name = "Yamato Takeru", age = 200 }
  print $ human
  print $ human { age = 300 }
  print $ name human
  print $ age human
  print $ echo human
