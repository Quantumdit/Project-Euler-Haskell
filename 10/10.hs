main = putStrLn $ show $ foldr (+) 0 $ takeWhile (\x -> x < 2000000) primes

-- Not at all an efficient implementation
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [ns| ns <- xs, ns `rem` p /= 0]
