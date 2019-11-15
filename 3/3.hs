main = putStrLn $ show $ head $ primeFactorization 600851475143

-- Not at all an efficient implementation
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [ns| ns <- xs, ns `rem` p /= 0]

primeFactorization :: Int -> [Int]
primeFactorization num = primeFactorizationHelper num [] primes

primeFactorizationHelper :: Int -> [Int] -> [Int] -> [Int]
primeFactorizationHelper 1 factors _ = factors
primeFactorizationHelper num factors shiftedPrimes@(p:ps)
    | num `rem` p == 0 = primeFactorizationHelper (num `div` p) ([p] ++ factors) shiftedPrimes
    | otherwise = primeFactorizationHelper num factors ps