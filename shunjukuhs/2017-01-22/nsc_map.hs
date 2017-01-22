import Data.Map

-- ghci 上なら、動くコード

main = do
  let d = Data.Map.empty
  insert 3 "hello" d
  insert 15 "world" d
  insert 8 "good-bye" d
  print $ Data.Map.lookup 8 d
  print $ Data.Map.lookup 10 d
  -- fromList [(3, "hello"), (15, "world"), (8, "good-bye")]
