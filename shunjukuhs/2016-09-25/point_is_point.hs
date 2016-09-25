-- 1. 円(Circle)、正方形(Square)、長方形(Rectangle)を含むShape型を定義せよ
--
--     正方形、長方形は座標軸に対して傾いていないものとする
--     円は中心と半径、正方形は左上と1辺の長さ、 長方形は左上と横と縦の長さで表現できる
--     deriving Showをつけておく
--     対話環境で試してみる

data Point = Cartesian Double Double | Polar Double Double deriving Show
data Shape = Circle Point Double | Square Point Double | Rectangle Point Double Double deriving Show

point1 :: Point
point1 = Cartesian 0 0

circle1 = Circle point1 1
square1 = Square (Cartesian 1 1) 1
rectangle1 = Rectangle (Cartesian 1 1) 1 2

-- square :: Rectangle -> Square
-- square :: Circle -> Circle
-- square :: Square -> Square

square (Rectangle p x y) = (Square p x)
square a = a

main = do
  print $ point1
  print $ circle1
  print $ square1
  print $ rectangle1
  print $ square circle1
  print $ square square1
  print $ square rectangle1
