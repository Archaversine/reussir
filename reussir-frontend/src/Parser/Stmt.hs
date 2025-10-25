module Parser.Stmt where

import Data.Maybe

import Parser.Expr

import Parser.Types
import Parser.Types.Expr
import Parser.Types.Stmt

parseTypedParam :: Parser (Identifier, Typename)
parseTypedParam = do 
    name <- parseIdentifier <* char ':' <* space 
    ty   <- parseTypename

    return (name, ty)

parseFuncDef :: Parser Stmt
parseFuncDef = do 
    vism <- optional (string "pub" *> space)
    name <- string "fn" *> space *> parseIdentifier <* openParen
    args <- optional $ parseTypedParam `sepBy` comma
    ret  <- closeParen *> optional (string "->" *> space *> parseTypename)
    body <- parseBody

    let vis = case vism of { Nothing -> Private; Just () -> Public }

    return (Function vis name (fromMaybe [] args) ret body)

parseStmt :: Parser Stmt
parseStmt = parseFuncDef

