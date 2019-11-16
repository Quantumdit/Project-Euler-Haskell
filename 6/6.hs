main = putStrLn $ show $ abs $ squareOfSum - sumOfSquares

squareOfSums = sqr $ foldr (+) 0 [1..100])
sumOfSquares = foldr (+) 0 $ map sqr [1..100]

sqr :: Int -> Int
sqr n = n*n
