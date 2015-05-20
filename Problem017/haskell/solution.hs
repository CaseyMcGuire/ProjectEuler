

sumLetters lst = length $ filter (/=' ') $ foldr1 (++) $ numbersToWords lst

numbersToWords lst = map numToWord lst

numToWord num = case num of
                 0 -> ""
                 1 -> "one"
                 2 -> "two"
                 3 -> "three"
                 4 -> "four"
                 5 -> "five"
                 6 -> "six"
                 7 -> "seven"
                 8 -> "eight"
                 9 -> "nine"
                 10 -> "ten"
                 11 -> "eleven"
                 12 -> "twelve"
                 13 -> "thirteen"
                 14 -> "fourteen"
                 15 -> "fifteen"
                 16 -> "sixteen"
                 17 -> "seventeen"
                 18 -> "eighteen"
                 19 -> "nineteen"
                 1000 -> "one thousand"
                 x -> let result = findDoubleDigitName x
                          name = fst result
                          divisor = snd result
                          remainder = if divisor == 0 then 0 else mod x divisor
                        in name ++ (numToWord remainder)
                   where findDoubleDigitName num'
                           | num' < 20 = ("", 0)
                           | num' >= 20 && num' <= 29 = ("twenty ", 20)
                           | num' >= 30 && num' <= 39 = ("thirty ", 30)
                           | num' >= 40 && num' <= 49 = ("forty ", 40)
                           | num' >= 50 && num' <= 59 = ("fifty ", 50)
                           | num' >= 60 && num' <= 69 = ("sixty ", 60)
                           | num' >= 70 && num' <= 79 = ("seventy ", 70)
                           | num' >= 80 && num' <= 89 = ("eighty ", 80)
                           | num' >= 90 && num' <= 99 = ("ninety ", 90)
                           | otherwise = let result' = findTripleDigitName num'
                                             name' = fst result'
                                             divisor' = snd result'
                                         in (name', divisor')
                         findTripleDigitName num''
                           | num'' >= 100 && num'' <= 199 = ("one hundred " ++ containsAnd num'' 100, 100)
                           | num'' >= 200 && num'' <= 299 = ("two hundred " ++ containsAnd num'' 200, 200)
                           | num'' >= 300 && num'' <= 399 = ("three hundred " ++ containsAnd num'' 300, 300)
                           | num'' >= 400 && num'' <= 499 = ("four hundred " ++ containsAnd num'' 400, 400)
                           | num'' >= 500 && num'' <= 599 = ("five hundred " ++ containsAnd num'' 500, 500)
                           | num'' >= 600 && num'' <= 699 = ("six hundred " ++ containsAnd num'' 600, 600)
                           | num'' >= 700 && num'' <= 799 = ("seven hundred " ++ containsAnd num'' 700, 700)
                           | num'' >= 800 && num'' <= 899 = ("eight hundred " ++ containsAnd num'' 800, 800)
                           | num'' >= 900 && num'' <= 999 = ("nine hundred " ++ containsAnd num'' 900, 900)
                           | otherwise = error "Invalid number"
                         containsAnd numb divisor
                           | mod numb divisor /= 0 = "and "
                           | otherwise = ""
