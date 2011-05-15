-- configuration :)
theAnswer = 24

-- returns whether the guess is high or low
result :: Int -> String
result n
    | n > theAnswer = "You're a bit high.\n"
    | n < theAnswer = "You're a bit low.\n"
    | otherwise     = "...you broke the game! :(\n"

prompt :: Int -> IO ()
prompt 0 = youLose
prompt lives = do
    putStrLn ("You've got " ++ (show lives) ++ " lives left.")
    putStrLn "Enter a number from 1-100 >"
    guessedNumber <- getLine
    if (read guessedNumber :: Int) == theAnswer
    then youWin
    else do
        putStrLn $ result (read guessedNumber :: Int)
        prompt (lives - 1)

-- if you win
youWin :: IO ()
youWin = putStrLn "\nYou win!"
-- if you lose
youLose :: IO ()
youLose = putStrLn "\nYou lose."

main :: IO ()
main = do
    putStrLn "djanatyn's guessing game"
    putStrLn "------------------------\n"

    putStrLn "number of attempts?"
    attempts <- getLine

    -- begin the game with the number of attempts specified by the user
    prompt (read attempts :: Int)
