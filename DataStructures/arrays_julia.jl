
# 1D Array is a column vector
col_vector = [1, 2, 3]
"""3-element Vector{Int64}:
 1
 2
 3
"""

# ROW - Vectors / 2D Arr / 1 x n Matrix
row_vector = [4.0 5.0 6.0]
"""
1×3 Matrix{Float64}:

      Col_1  Col_2   Col_3
Row_1 4.0    5.0     6.0

"""

# Vec LENGTH
length(row_vector)

# SUM all elems
sum(col_vector)


## SORTING
# (descending, nondestructive)
sort(col_vector; rev = true)

# Sort and MUTATE IN PLACE with "!" 
sort!(col_vector; rev=true)


# add new elem - like push back
push!(col_vector, 42)

#analog
pop!(col_vector)

#
#
#
#
#
#
#
#


## Constr. a Matrix 2 rows x 3 cols
M = [1 3 5; 
     2 4 6]

typeof(M)# Matrix{Int64} (alias for Array{Int64, 2})

# Acces a val
M[1, 3]  #5

## Column- major order
## (col1, row1), (col1, row2), (col2,row1) ....

# Arr w/ elems of diff Data Types
mixed_arr = 
[ 1, 
  1.0, 
  1//3, 
  π, 
  'a', 
  "Pariah", 
  [7 8 9] 
]

typeof(mixed_arr)
# Vector{Any} 
# (alias for Array{Any, 1})





function copy_cols(x::Vector{T}) where T
  inds = axes(x, 1)
  out = similar(Array{T}, inds, inds)
  for i = inds
      out[:, i] = x
  end
  return out
end

arr2 = copy_cols(col_vector)
#  println(arr2)
# [3 3 3; 
#  2 2 2; 
#  1 1 1]


function g_type(t::Type{T}) where T
  x = ones(T, 10)
  return sum(map(sin, x))
end

result = g_type(Float64)
println(result)
# 8.414709848078965
