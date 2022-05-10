import Test.Tasty
import Test.Tasty.QuickCheck

import Lib

main :: IO ()
main = defaultMain $ testProperties "Behaves like quotRem" props

props :: [(String, Property)]
props = [
    ("pos, pos", property $ prop getPositive getPositive)
  , ("neg, neg", property $ prop getNegative getNegative)
  , ("pos, neg", property $ prop getPositive getNegative)
  , ("neg, pos", property $ prop getNegative getPositive)
  , ("0, pos",   property $ prop id getPositive 0)
  , ("0, neg",   property $ prop id getNegative 0)
  ]
  where
  prop xcond ycond x y
    = myDiv (xcond x) (ycond y) == quotRem (xcond x) (ycond y)
