# initiate an array of 1000 elements
# and fill it with random numbers
array = rand(1000)
# sort the array
array = sort(array)
# print the first 10 elements
#println(array[1:10])

# initiate a matrix wit 3 4 5 shape
# and fill it with random numbers
A = rand(3, 4)'

# print the first 10 elements
println(typeof(A))

# print matrix A and its size
println(A)
println(size(A))
