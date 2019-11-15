main = putStrLn $ show $ maximum $ filter isPalindromeInt $ [xs*ys | xs <- threeDigitNumbers, ys <- threeDigitNumbers]

threeDigitNumbers = [100 .. 999]

isPalindromeInt :: Int -> Bool
isPalindromeInt num = numString == (reverse numString)
    where numString = show num