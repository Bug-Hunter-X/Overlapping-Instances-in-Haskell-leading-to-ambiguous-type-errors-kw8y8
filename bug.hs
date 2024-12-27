{-# LANGUAGE FlexibleInstances #-}

{-# LANGUAGE UndecidableInstances #-}

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
  print (f 5)
  print (f [1,2,3])
  print (f True)
  print (f [True, False])