main = putStrLn $ show $ foldr lcm 1 [11..20]

{-
Note that we can start at 11, because lcm(1 .. n) = lcm(floor(n/2)+1 .. n).
Consider the example [1..10]
lcm(1,2,3,4,5,6,7,8,9,10)
iteration 1:
=lcm(1,lcm(2,2),3,lcm(4,4),5,lcm(6,6),7,lcm(8,8),9,lcm(10,10))
    by the fact that n = lcm(n,n)
=lcm(1,2,2,3,4,4,5,6,6,7,8,8,9,10,10)
    by removing the redundant small lcm calls
=lcm(lcm(1,2),lcm(2,4),lcm(3,6),lcm(4,8),lcm(5,10),6,7,8,9,10)
    by rearraging
=lcm(2,4,6,8,10,6,7,8,9,10)
    by lcm(n,2n) = 2n
=lcm(2,4,6,7,8,9,10)
    by lcm(n,n) = n
iteration 2:
=lcm(2,4,4,6,7,8,8,9,10)
=lcm(lcm(2,4),lcm(4,8),6,7,8,9,10)
=lcm(4,8,6,7,8,9,10)
=lcm(4,6,7,8,9,10)
iteration 3:
=lcm(4,6,7,8,8,9,10)
=lcm(lcm(4,8),6,7,8,9,10)
=lcm(8,6,7,8,9,10)
=lcm(6,7,8,9,10)
The key is that after each iteration, all numbers that were originally in the first half are doubled
Hence, eventually they will end up as a number in the second half of the original list
-}