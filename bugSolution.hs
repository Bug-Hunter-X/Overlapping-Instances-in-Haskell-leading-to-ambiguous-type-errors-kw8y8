{-# LANGUAGE FlexibleInstances #-}

-- Removing UndecidableInstances as it's not needed for the solution

class C a where
  f :: a -> Int

instance C Int where
  f x = x

instance C a => C [a] where
  f xs = length xs

instance C Bool where
  f True = 1
  f False = 0

main :: IO ()
main = do
  print (f 5 :: Int) -- Explicit type signature resolves ambiguity
  print (f [1,2,3] :: Int)
  print (f True :: Int)
  print (f [True, False] :: Int) -- Explicit type signature for clarity

-- Alternatively, we could modify the instances to be more specific or avoid overlapping instances.
-- This provides a safer approach, eliminating the potential for ambiguity.