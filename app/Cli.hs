module Cli (
  step,
  promptUser
) where

import Control.Monad (when)

type PreCondition = IO Bool

step :: String -> PreCondition -> IO () -> IO ()
step _ pc action = do
  preCond <- pc 
  when preCond action

promptUser :: String -> IO Bool
promptUser str = do
  putStrLn (str ++ " [y/N]")
  res <- getLine
  if head (words res) == "y"
    then return True
    else return False
