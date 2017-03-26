import Data.Char

toJustUpper = Just . toUpper

main = do
  print $ toJustUpper 'a'
