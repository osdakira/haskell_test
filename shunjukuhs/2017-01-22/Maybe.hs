module Maybe (mapply, mbind) where

mapply :: (a -> b) -> Maybe a -> Maybe b
mapply = maybe Nothing . (Just .)

mbind :: (a -> Maybe b) -> Maybe a -> Maybe b
mbind = maybe Nothing

main = do
  print $ (+ 3) `mapply` Just 8
  print $ (+ 3) `mapply` Nothing
