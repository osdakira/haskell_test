data Foo = Bar Bool Char | Baz Int Double deriving (Show, Read)

main = do
  let it = show $ Bar False 'c'
  print $ it
  -- print $ read it :: Foo -- gchi なら動く
