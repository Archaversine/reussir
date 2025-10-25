module Parser.Types.Stmt where

import Parser.Types.Expr

data FunctionVis = Public | Private deriving Show

data Stmt 
    = Function FunctionVis Identifier [(Identifier, Typename)] (Maybe Typename) Expr
    | Struct FunctionVis Identifier [Typename]
    deriving Show
