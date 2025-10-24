module Parser.Types.Stmt where

import Data.List.NonEmpty

import Parser.Types.Expr

newtype Typename = Typename String

data FunctionVis = Public | Private

data GlobalStmtTy = FuncStmt

data GlobalStmt (t :: GlobalStmtTy) where
    Function :: FunctionVis -> Identifier -> [(Identifier, Typename)] -> Maybe Typename -> Expr -> GlobalStmt FuncStmt

data AnyGlobalStmt = forall t . AnyGlobalStmt (GlobalStmt t)

data Stmt
    = FunctionStmt (GlobalStmt FuncStmt)
    | FuncCall Identifier [Expr]
