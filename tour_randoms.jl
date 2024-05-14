
mutable struct Knighty
    name::String
    health::Int
    armor::Int
end

white = Knighty("Sir Lancelot", 7, 2)
# Knight("Sir Lancelot", 7, 2)

white.health = 8

#
#
#
#
#
#


x = 9

if x > 5
    "large"
elseif x > 3
    "medium"
else
    "small"
end


s = x > 1000 ? "large" : "small"

#
#
#
#
#
#
#


## One-liner functions
f(x) = 2x +4

f(2) # 8 

## Multi-line fnc. with type annotations
function add(x::Integer, y::Int)
    return x + y
end

add(2, 4) #6

#
#
#
#
#
#


x_as_tuple = [("two", 2), ("four", 4)]
"""2-element Vector{Tuple{String, Int64}}:
    ("two", 2)
    ("four", 4)
"""
x_as_dict_from_tuple = Dict(x_as_tuple)
"""Dict{String, Int64} with 2 entries:
    "two"  => 2
    "four" => 4
"""

## Annonymous functions and closures
square = x -> x^2
map(square, [1, 2, 3, 4]) 
# [1, 4, 9, 16]

# or
map(x -> x^2, [1, 2, 3, 4])
# [1, 4, 9, 16]


## Closures
function make_multiplier(n)
    return x -> x * n
end

times_5 = make_multiplier(5)
times_5(3) # 15


# Multi-liner inlined
map([1, 2, 3, 4]) do x
    x^2
end

#####
##Partial application
findfirst(x->x == 6, [3,4,6,7,6]) #3
# same as:
findfirst(==(6), [3,4,6,7,6]) #3

filter(>=(6), [3,4,6,7,6])
#  6
#  7
#  6


#####
## Broadcasting
x = [1, 2, 3, 4]
y = [5, 6, 7, 8]

x .+ y
# [6, 8, 10, 12]

x .> y
# [false, false, false, false]

#####
## List comprehensions
[x^2 for x in 1:4]
# [1, 4, 9, 16]

[x^2 for x in 1:4 if x % 2 == 0]
# [4, 16]


#####
## Dict comprehensions
Dict("$x" => x for x in 1:4)
# Dict{String, Int64} with 4 entries:
#   "1" => 1
#   "2" => 2
#   "3" => 3
#   "4" => 4


#####
## More structs with methods
mutable struct Student
    name::String
    age::Int
    gpa::Float64

    function Student(name::String, age::Int, gpa::Float64)
        if !(0 <= gpa <= 4)
            throw(ArgumentError("GPA must be between 0 and 4"))
        end
        new(name, age, gpa)
    end
end

function get_status(obj::Student)  # Define get_status as an external function
    if obj.gpa >= 3.5
        return "honors"
    elseif obj.gpa >= 2.5
        return "passing"
    else
        return "failing"
    end
end

s = Student("Alice", 20, 3.8)
status = get_status(s) 

#
#
#
#
#
#
#

## Algorithms for bioinformatics
function reverse_complement(seq::String)
    complement = Dict('A' => 'T', 'T' => 'A', 'C' => 'G', 'G' => 'C')
    return join(reverse([complement[base] for base in seq]))
end

reverse_complement("ATCG") # "CGAT"


