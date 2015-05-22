import Data.Char

main = do
  let
    answer = show $
             sum $
             map digitToInt $
             show $
             factorial 100
  putStrLn answer

factorial 0 = 1
factorial n = foldr1 (*) [1..n]

