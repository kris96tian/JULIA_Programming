# binary search algorithm
function binary_search(arr, target)
    left = 1
    right = length(arr)
    while left <= right
        mid = left + (right - left) ÷ 2
        if arr[mid] == target
            return mid
        elseif arr[mid] < target
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return -1
end

# test
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
target = 5
println(binary_search(arr, target))




## binary search on matrix
function binary_search_matrix(matrix, target)
    # matrix is a 2D array
    m, n = size(matrix)
    left = 1
    right = m * n # number of elements in the matrix
    while left <= right
        mid = left + (right - left) ÷ 2 
        row = (mid - 1) ÷ n + 1
        col = (mid - 1) % n + 1
        if matrix[row, col] == target
            return (row, col)
        elseif matrix[row, col] < target
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return (-1, -1)
end

# test
matrix = [1 3 5 7; 10 11 16 20; 23 30 34 60]
target = 3
println(binary_search_matrix(matrix, target))


## function that checks if a number is element of a matrix using binary search
function is_element(matrix, target)
    m, n = size(matrix)
    left = 1
    right = m * n
    while left <= right
        mid = left + (right - left) ÷ 2
        row = (mid - 1) ÷ n + 1
        col = (mid - 1) % n + 1
        if matrix[row, col] == target
            return true
        elseif matrix[row, col] < target
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return false
end

# test
matrix = [1 3 5 7; 10 11 16 20; 23 30 34 60]
target = 3
println(is_element(matrix, target))
target = 13
println(is_element(matrix, target))


## implementation of searching a binary tree
struct TreeNode
    val
    left
    right
end

function search_bst(root, target)
    while !isnothing(root)
        if root.val == target
            return root
        elseif root.val < target
            root = root.right
        else
            root = root.left
        end
    end
    return nothing
end

# test
root = TreeNode(4, TreeNode(2, TreeNode(1, nothing, nothing), TreeNode(3, nothing, nothing)), TreeNode(7, TreeNode(6, nothing, nothing), TreeNode(9, nothing, nothing)))
target = 2
println(search_bst(root, target).val)
#
#
#
#
#
#
#
#
##
#
#

function quicksort(arr)
    if length(arr) <= 1
        return arr
    end
    
    pivot = arr[rand(1:end)]
    smaller = [x for x in arr if x < pivot]
    equal = [x for x in arr if x == pivot]
    larger = [x for x in arr if x > pivot]
    
    return vcat(quicksort(smaller), equal, quicksort(larger))
end

# Example usage:
arr = [3, 6, 8, 10, 1, 2, 1]
sorted_arr = quicksort(arr)
println("Sorted array: ", sorted_arr)

#
#
#
#
#
#
#

function merge_sort(arr)
    if length(arr) <= 1
        return arr
    end
    
    mid = length(arr) ÷ 2
    left = merge_sort(arr[1:mid])
    right = merge_sort(arr[mid+1:end])
    
    return merge(left, right)
end

function merge(left, right)
    result = []
    i = 1
    j = 1
    while i <= length(left) && j <= length(right)
        if left[i] < right[j]
            push!(result, left[i])
            i += 1
        else
            push!(result, right[j])
            j += 1
        end
    end
    
    while i <= length(left)
        push!(result, left[i])
        i += 1
    end
    
    while j <= length(right)
        push!(result, right[j])
        j += 1
    end
    
    return result
end

# Example usage:
arr = [3, 6, 8, 10, 1, 2, 1]
sorted_arr = merge_sort(arr)
println("Sorted array: ", sorted_arr)

#
#
#
#
#
#
#

function exponential_search(arr, target)
    n = length(arr)
    if arr[1] == target
        return 1
    end
    
    i = 1
    while i < n && arr[i] <= target
        i *= 2
    end
    return binary_search(arr[i ÷ 2:min(i, n)], target)
end

# Example usage:
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
target = 5
println(exponential_search(arr, target))

#
#
#
#
#
#
#
#

## graph search algorithms
function dfs(graph, start)
    visited = []
    stack = [start]
    
    while !isempty(stack)
        node = pop!(stack)
        if node in visited
            continue
        end
        push!(visited, node)
        for neighbor in graph[node]
            push!(stack, neighbor)
        end
    end
    
    return visited
end

# Example usage:
graph = Dict(1 => [2, 3], 2 => [4], 3 => [5], 4 => [6], 5 => [6], 6 => [])
start = 1
println(dfs(graph, start))
