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
k = 4 

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