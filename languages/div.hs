data DivError = DivByZero deriving (Show)

divSafe :: Double -> Double -> Either DivError Double
divSafe x 0 = Left DivByZero
divSafe x y = Right (x / y)

main :: IO ()
main = do
    let x = 1.0
        y = 0.0
    case divSafe x y of
        Right z -> putStrLn $ "The result is: " ++ show z
        Left DivByZero -> putStrLn "Division failed: division by zero"