module Parser.Stmt where

import Parser.Types
import Parser.Types.Stmt

parseFuncDef :: Parser (GlobalStmt FuncStmt)
parseFuncDef = error "todo"

parseIfStmt :: Parser Stmt 
parseIfStmt = error "todo"

parseFuncCall :: Parser Stmt
parseFuncCall = error "todo"

parseGlobalStmt :: Parser AnyGlobalStmt
parseGlobalStmt = error "todo"

parseStmt :: Parser Stmt
parseStmt = error "todo"

