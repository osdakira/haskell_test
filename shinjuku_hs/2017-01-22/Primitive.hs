module Primitive (env0) where
import Eval
import Environment
import Maybe

env0 :: Env
-- env0 = fromList []
env0 = fromList [
    ("hoge", Int 12345),
    -- ("+", Subr add),
    ("+", Subr . int2 $ (Int .) . (+)),
    ("-", Subr . int2 $ (Int .) . (-)),
    ("*", Subr . int2 $ (Int .) . (*)),
    ("define", Sntx define),
    ("lambda", Sntx lambda)
    ]

-- add ::[Value] -> Env -> Maybe (Value, Env)
-- add [Int m, Int n] e = Just (Int $ m + n, e)
-- add _ _ = Nothing

int2 :: (Integer -> Integer -> Value) -> [Value] -> Env -> Maybe (Value, Env)
int2 op [Int m, Int n] e = Just (m `op` n, e)
int2 _ _ _ = Nothing

-- add op vs e = int2 (\m n -> Int $ m + n) op vs e

define :: [Value] -> Env -> Maybe (Value, Env)
define [sm@(Sym s), v] e = (\(v', e') -> (sm, set s v' e')) `mapply` eval v e
define _ _ = Nothing

lambda :: [Value] -> Env -> Maybe (Value, Env)
lambda [vs, v] e = (\ps -> (Lmbd ps v, e)) `mapply` symbols vs
lambda _ _ = Nothing

symbols :: Value -> Maybe [Symbol]
symbols (List vs) = ss vs
  where
  ss (Sym s : vs') = (s :) `mapply` ss vs'
  ss [] = Just []
  ss _ = Nothing
symbols _ = Nothing
