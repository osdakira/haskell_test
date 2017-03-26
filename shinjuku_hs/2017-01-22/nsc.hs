{-# LANGUAGE TupleSections #-}

import Primitive
import Parse
import Environment
import Maybe
import Eval

scheme :: String -> Env -> Maybe ([Value], Env)
-- scheme src e = (, e) `mapply` (parse `mbind` tokens src)
scheme src e = (`evaluate` e) `mbind` (parse `mbind` tokens src)

main :: IO ()
-- main = interact $ maybe "err" (unlines . map showValue . fst) . (`scheme` env0)
main = interact $ maybe "err" (unlines . map showValue . fst) . (`scheme` env0) . rmvPrfx . head . lines

rmvPrfx :: String -> String
rmvPrfx ('n' : 's' : 'c' : s) = s
rmvPrfx (_ : s) = rmvPrfx s
rmvPrfx _ = ""
