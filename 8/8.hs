main = putStrLn $ show $ biggestDigitProduct 13 $ numToDigitList bigNumber

bigNumber :: Integer
bigNumber = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

numToDigitList :: Integer -> [Integer]
numToDigitList 0 = []
numToDigitList num = (numToDigitList restOfNum) ++ [digit]
    where
        (restOfNum,digit) = quotRem num 10

biggestDigitProduct :: Int -> [Integer] -> Integer
biggestDigitProduct prodLength xs = biggestDigitProductHelper prodLength startingProduct startingProduct startingDigits (drop prodLength xs)
    where
        startingDigits = take prodLength xs
        startingProduct = (foldr (*) 1 startingDigits)
        
biggestDigitProductHelper :: Int -> Integer -> Integer -> [Integer] -> [Integer] -> Integer
biggestDigitProductHelper _ biggestProd _ _ [] = biggestProd
biggestDigitProductHelper _ biggestProd _ _ (0:[]) = biggestProd
biggestDigitProductHelper prodLength biggestProd _ _ (0:x:remainingDigits) = biggestDigitProductHelper prodLength biggestProd 1 [] (x:remainingDigits)
biggestDigitProductHelper prodLength biggestProd currentProd currentDigits (nextDigit:remainingDigits)
    | (length currentDigits) < prodLength = biggestDigitProductHelper prodLength biggestProd (currentProd*nextDigit) (currentDigits ++ [nextDigit]) remainingDigits
    | newProd > biggestProd = biggestDigitProductHelper prodLength newProd newProd newDigits remainingDigits
    | otherwise = biggestDigitProductHelper prodLength biggestProd newProd newDigits remainingDigits
    where
        lastDigit = head currentDigits
        newProd = (currentProd `quot` lastDigit) * nextDigit
        newDigits = (tail currentDigits) ++ [nextDigit]