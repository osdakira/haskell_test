type RGB = (Int, Int, Int)
data Suit = Spade | Heart | Diamond | Club
data Color = Black | Red
rgb :: Suit -> RGB
color :: Suit -> Color
toRGB :: Color -> RGB
rgb = toRGB . color
color Spade = Black
color Heart = Red
color Diamond = Red
color Club = Black
toRGB Black = (0, 0, 0)
toRGB Red = (0xff, 0, 0)

-- 性別を表現する型を定義せよ
-- - 性別と名前(文字列)のタプルを引数としてとり"Mrs. ..."または"Mr. ..."といった文字列を返す関数を定義せよ
data Gender = Male | Female
call :: (Gender, String) -> String
call (Male, s) = "Mr. " ++ s
call (Female, s) = "Mrs. " ++ s

-- main = do
--   print $ call (Male, "Alpha")
--   print $ call (Female, "Beta")

-- 型Boolはどのように定義されるか考えてみよう
data Bool = True | False

-- 日曜日から土曜日までを表現する型を作れ
-- - 日曜日には"play"をそれ以外の曜日には"work"を返す関数を作れ
data Day = Sun | Mon | Tue | Wed | Thu | Fri | Sat
whatdo Sun = "play"
whatdo _   = "work"

main = do
  print $ [whatdo(x) | x <- [Sun, Mon, Tue, Wed, Thu, Fri, Sat]]
