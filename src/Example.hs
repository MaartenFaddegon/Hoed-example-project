module Example where
import Debug.Hoed

isOdd :: Int -> Bool
isOdd = observe "isOdd" isOdd'

isOdd' n = isEven (plusOne n)

isEven :: Int -> Bool
isEven = observe "isEven" isEven'

isEven' n = mod2 n == 0

plusOne :: Int -> Int
plusOne = observe "plusOne" plusOne'

plusOne' n = n + 1

mod2 :: Int -> Int
mod2 = observe "mod2" mod2'

mod2' n = div n 2

prop_isOdd :: Int -> Bool
prop_isOdd x = isOdd (2 * x + 1)

main :: IO ()
main = printO (prop_isOdd 1)
