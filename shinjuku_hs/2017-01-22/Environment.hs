-- module Environment (Env, M.fromList, Value(..), showValue, Symbol) where
-- module Environment (Env, M.fromList, refer, Value(..), showValue, Symbol) where
module Environment(
  Env, M.fromList, refer, set, Value(..), showValue, Symbol) where

import qualified Data.Map as M

type Env = M.Map Symbol Value

-- data Value = Int Integer
data Value =
  Sym Symbol
  | Int Integer
  | List [Value]
  | Subr ([Value] -> Env -> Maybe (Value, Env))
  | Sntx ([Value] -> Env -> Maybe (Value, Env))
  | Lmbd [Symbol] Value

showValue :: Value -> String
showValue (Sym s) = s
showValue (Int i) = show i
showValue (List vs) = "(" ++ unwords (map showValue vs) ++ ")"
showValue (Subr _) = "#<subr>"
showValue (Sntx _) = "#<syntax>"
showValue (Lmbd _ _) = "#<lambda>"

type Symbol = String

refer :: Symbol -> Env -> Maybe Value
refer = M.lookup

set :: Symbol -> Value -> Env -> Env
set = M.insert

main = do
  print $ showValue $ Int 8
