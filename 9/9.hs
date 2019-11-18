main = putStrLn $ show $ specialTripletProduct

specialTripletProduct :: Int
specialTripletProduct = specialTripletHelper 1 1 998
    where specialTripletHelper a b c
            | b == 0 = specialTripletHelper 1 a (c-1)
            | a^2 + b^2 == c^2 = a*b*c
            | otherwise = specialTripletHelper (a+1) (b-1) c
