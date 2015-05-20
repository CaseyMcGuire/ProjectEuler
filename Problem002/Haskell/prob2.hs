
evenFibonacciSum max = sum $ filter even $ fibonacci max

fibonacci max = fibonacci' max []

fibonacci' max [] = fibonacci' max [1]
fibonacci' max [_] = fibonacci' max [2,1]
fibonacci' max (x:y:xs)
  | x >= max = (y:xs)
  | otherwise = fibonacci' max (newTerm:x:y:xs)
  where newTerm = x + y
