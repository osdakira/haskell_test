{-# LANGUAGE TupleSections #-}

module Eval (evaluate, eval) where
-- module Eval (eval) where

import Environment
import Maybe

eval :: Value -> Env -> Maybe (Value, Env)
eval (Sym s) e = (, e) `mapply` refer s e
-- eval i@(Int _) e = Just (i, e)
-- eval l@(List _) e = Just (l, e)
eval (List (v : vs)) e = (\(f, e') -> apply f vs e') `mbind` eval v e
eval v e = Just (v, e)

apply :: Value -> [Value] -> Env -> Maybe (Value, Env)
-- apply (Sntx _ s) vs e = s vs e
apply (Sntx s) vs e = s vs e
apply (Subr s) vs e = (\(as, e') -> s as e') `mbind` evaluate vs e
apply (Lmbd ps bd) vs e = (`mbind` evaluate vs e) $ \(as, e') ->
  (\(r, _) -> (r, e'))
    `mapply` (eval bd . foldr (uncurry set) e $ zip ps as)
apply _ _ _ = Nothing

evaluate :: [Value] -> Env -> Maybe ([Value], Env)
evaluate [] e = Just ([], e)
evaluate (v : vs) e = case eval v e of
  Just (v', e') -> (\(vs', e'') -> (v' : vs', e''))
    `mapply` evaluate vs e'
  _ -> Nothing

main = do
  print $ (showValue . fst) `mapply` eval (Sym "hoge") (fromList [("hoge", Int 12345)])
  print $ (map showValue . fst) `mapply` evaluate [Int 123, Sym "hoge"] (fromList [("hoge", Int 12345)])
