#boolean.py
_true  = (x) -> (y) -> x
_false = (x) -> (y) -> y

lambdaToBoolean = (_bool) -> _bool(true)(false)
booleanToLambda = (coffeeNoBoolean) -> if coffeeNoBoolean then _true else _false

#Operadores comutativos
_and = (left) -> (right) -> left(right)(left)
_or  = (left) -> (right) -> right(right)(left)
_not = (center) -> center(_false)(_true)

#common.py

#control.py
_if = (cond) -> cond(_true)(_false)

#natural.py

_zero  = (f) -> (x) -> x
_one   = (f) -> (x) -> f x
_two   = (f) -> (x) -> f f x
_three = (f) -> (x) -> f f f x
_four  = (f) -> (x) -> f f f f x

_successor = (n) -> ((f) ->  (x) -> n(f)(f x))

#_predecessor = (n) -> 

_isZero = (n) -> n((_) -> _false)(_true)

lambdaToNumber = (lambda) -> lambda((x) -> x + 1)(0)

numberToLambda = (num) -> if num is 0 then _zero else _successor numberToLambda(num - 1)

#expr1 = _true
#expr2 = _true

#a = _if(_and(expr1)(expr2))(-> 2)(-> 3)

##And tests
console.log (lambdaToBoolean _and(_true)(_true)) is true
console.log (lambdaToBoolean _and(_true)(_false)) is false
console.log (lambdaToBoolean _and(_false)(_true)) is false
console.log (lambdaToBoolean _and(_false)(_false)) is false

##Or tests
console.log (lambdaToBoolean _or(_true)(_true)) is true
console.log (lambdaToBoolean _or(_true)(_false)) is true
console.log (lambdaToBoolean _or(_false)(_true)) is true
console.log (lambdaToBoolean _or(_false)(_false)) is false

#Not tests
console.log (lambdaToBoolean _not(_true)) is false
console.log (lambdaToBoolean _not(_false)) is true

#Natural tests
console.log (lambdaToNumber _four)

console.log lambdaToNumber numberToLambda 6

console.log lambdaToBoolean _isZero _zero
