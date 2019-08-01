{-
module Stack (Stack, push, pop, top, empty, isEmpty) where

data Stack a = Stk [a]

push::a->Stack a->Stack a
push x (Stk xs) = Stk (x:xs)

pop::Stack a -> Stack a
pop (Stk(_:xs)) = Stk xs
pop _ = error "Stack.pop: empty stack"

top::Stack a -> a
top(Stk (x:_)) = x
top _ = error "Stack.top: empty stack"

empty::Stack a
empty = Stk []

isEmpty::Stack a -> Bool
isEmpty (Stk []) = True
isEmpty (Stk _) = False
-}
module Stack (Stk, push, pop, top, empty, isEmpty) where

data Stk a = Stk [a] deriving (Eq, Show)

push::Stk a -> a -> Stk a
push (Stk xs) x = Stk (x:xs)

pop::Stk a -> Stk a
pop (Stk (x:xs)) = Stk xs

top::Stk a -> a
top (Stk (x:_)) = x

empty::Stk a -> Stk a
empty (Stk xs) = Stk []

isEmpty::Stk a -> Bool
isEmpty (Stk []) = True
isEmpty (Stk _) = False