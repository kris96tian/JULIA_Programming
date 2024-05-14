####
#  function to calculate the volume of a sphere
function sphere_vol(r)
    # julia allows Unicode names (in UTF-8 encoding)
    # so either "pi" or the symbol π can be used
    return 4/3*pi*r^3
end

###### Binomial
##### calculates x for 0 = a*x^2+b*x+c, arguments types can be defined in function definitions
function quadratic(a, b, c)
    (-b + sqrt(b^2 - 4*a*c))/(2*a)
end

function binomial(a::Float64, b::Float64, c::Float64)
    sqr_term = sqrt(Complex(b^2-4a*c))
    r1 = quadratic(a, sqr_term, b)
    r2 = quadratic(a, -sqr_term, b)
    r1, r2
end


############## STRINGS
# julia allows string Interpolation:
a = "welcome"
b = "julia"
println("$a to $b.")
#> welcome to julia.

# this can extend to evaluate statements:
println("1 + 2 = $(1 + 2)")
#> 1 + 2 = 3

# strings can also be concatenated using the * operator
# using * instead of + isn't intuitive when you start with Julia,
# however people think it makes more sense
s2 = "this" * " and" * " that"
println(s2)
#> this and that

# as well as the string function
s3 = string("this", " and", " that")
println(s3)
#> this and that


# julia has a built-in function to check if a string contains a substring
println(occursin("world", "hello world"))
#> true

# and to replace a substring
println(replace("hello world", "world" => "julia"))
#> hello julia

# and to split a string
println(split("hello world", " "))

#> SubString{String}["hello", "world"]

# and to join a string
println(join(["hello", "world"], " "))
#> hello world

# get a slice of a string methode 1
println("hello"[1:3])
#> hel


# get a slice of a string methode 3
println("hello"[begin:3])
#> hel

# get a slice of a string methode 4
println("hello"[1:end])
#> hello


###########################
