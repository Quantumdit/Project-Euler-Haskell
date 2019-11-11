main = putStrLn $ show $ sumUntilLargerThan 4000000 [n | n <- fibs, even n]

fibs = map fst $ iterate nextFib (1,2)

nextFib :: (Int,Int) -> (Int,Int)
nextFib (fst,snd) = (snd, fst+snd)

--Sums up a list of ints until it sees an int of a certain size or larger
sumUntilLargerThan :: Int -> [Int] -> Int
sumUntilLargerThan limit lst = sumUntilLargerThanHelper limit lst 0
    where sumUntilLargerThanHelper limit (x:xs) sumSoFar
            | x > limit = sumSoFar
            | otherwise = sumUntilLargerThanHelper limit xs (x + sumSoFar)