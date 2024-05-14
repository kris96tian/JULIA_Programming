########################################
#####    Unsupervised Learning    ######
#####       kmeans Clustering     ######
########################################


# loading packages
using Clustering
using Plots
using Random


# inti a Plot 
gr(size = (500,500))

# generating random points
Random.seed!(42)

feature1 = rand(100)
feature2 = rand(100)


# plotting the data
myplot=scatter(feature1, feature2,
       xlabel = "Feature 1",
       ylabel = "Feature 2",
       tittle = "Random Data",
       legend = false
)

# Pre-processing data 
X = [feature1 feature2]'

# initializing variables
k = 3

# setting a number for max iterations
itr = 100 

# Clustering data using k-means cl. algo
Random.seed!(42)

result = kmeans(X, k; maxiter = itr, display = :iter)
# >>  K-means converged with 3 iterations

a = assignments(result)

c = counts(result)
#>>  3-element Vector{Int64}:
#       36
#       38
#       26


# identify centroids of the clusters 
mu = result.centers

# Centroids (mu) :
# >>                Matrix{Float64}:
# X-coord.: 0.853437  0.251423  0.414812
# y-coord.: 0.417992  0.30434   0.816574

# Ploting clusters
plot_kmeans_demo = scatter(feature1, feature2,
       xlabel = "Feature 1",
       ylabel = "Feature 2",
       tittle = "k-means Clustering Demo",
       legend = false,
       group = a,
       markersize = 10,
       alpha = 0.7
)

# Plot the centroids
scatter!(mu[1, :], mu[2, :],
       color = :yellow,
       markersize = 20,
       alpha = 0.7
)

# saving plot 
savefig(plot_kmeans_demo, "kmeans_plot1.png")

########################################
########################################
########################################
########   PART II     #################
########################################
########################################

using RDatasets

# loading some data 
cats = dataset("boot", "catsM")

# view data
vscodedisplay(cats)
cats
"""
97×3 DataFrame
 Row │ Sex   BWt      HWt     
     │ Cat…  Float64  Float64 
─────┼────────────────────────
   1 │ M         2.0      6.5
   2 │ M         2.0      6.5
   3 │ M         2.1     10.1
   4 │ M         2.2      7.2
   5 │ M         2.2      7.6
   6 │ M         2.2      7.9
   7 │ M         2.2      8.5
   8 │ M         2.2      9.1
  ⋮  │  ⋮       ⋮        ⋮
  91 │ M         3.6     14.8
  92 │ M         3.6     15.0
  93 │ M         3.7     11.0
  94 │ M         3.8     14.8
  95 │ M         3.8     16.8
  96 │ M         3.9     14.4
  97 │ M         3.9     20.5
               82 rows omitted
"""

# plot 
plot_of_cats = scatter(cats.BWt, cats.HWt,
       xlabel = "Body Weight (kg)",
       ylabel = "Heart Weight (g)",
       tittle = "Weight Data for Domestic cats (raw data)",
       legend = false
)
savefig(plot_of_cats, "cats_wght_raw.png")


# x is in kg, y is in g 
# lets scale:

## MIN-MAX-NORMALISATION
## Data is between [0,1]
f1 = cats.BWt
f2 = cats.HWt

f1_min = minimum(f1)
f2_min = minimum(f2)

f1_max= maximum(f1)
f2_max = maximum(f2)

f1_n = (f1 .- f1_min) ./ (f1_max - f1_min)
f2_n = (f2 .- f2_min) ./ (f2_max - f2_min)

X = [f1_n f2_n]'

# re-ploting norm-data
plot_of_cats = scatter(f1_n, f2_n,
       xlabel = "Body Weight (kg)",
       ylabel = "Heart Weight (g)",
       tittle = "Weight Data for Domestic cats (normalized data)",
       legend = false
)
savefig(plot_of_cats, "cats_wght_normalised.png")


########################################
########################################


# init vars 
k = 3
itr = 10
Random.seed!(42)

results = kmeans(X, k; maxiter = itr, display =:iter)
a = assignments(results)
c = counts(results)
mu = results.centers

# Ploting results
plot_kmeans_cats = scatter(f1_n, f2_n,
       xlabel = "Body Weight (kg)",
       ylabel = "Heart Weight (g)",
       tittle = "Weight Data for Domestic cats (iter = $itr)",
       legend = false,
       group = a,
       markersize = 10,
       alpha = 0.7
)
savefig(plot_kmeans_cats, "plot_kmeans_cats.png")


# inspect centroids by plot 
scatter!(mu[1, :], mu[2, :],
       color = :yellow,
       markersize = 20,
       alpha = 0.7
)
savefig(plot_kmeans_cats, "plot_kmeans_cats_centroids.png")
