--find the sum of all multiples of 3 or 5 below 1000

solution = sum [ x | x <- [1..999], fizzbuzz x == True]

fizzbuzz :: Integral a => a -> Bool
fizzbuzz x = if x `mod` 3 == 0 || x `mod` 5 == 0
                then True
                else False
                      
