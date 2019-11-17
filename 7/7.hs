main = putStrLn $ show $ primes !! 10000

-- Not at all an efficient implementation
primes = sieve [2..]
    where 
        sieve (p:xs) = p : sieve [ns| ns <- xs, ns `rem` p /= 0]
