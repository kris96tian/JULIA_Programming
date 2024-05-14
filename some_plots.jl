using Plots
using StatsPlots

# Generate some data
x = 1:10
y = rand(10)

# Create a plot with customizations
plot(x, y,

    color=:blue,                  # Set line color
    marker=:circle,               # Set marker shape
    markersize=8,                 # Set marker size
    linestyle=:dashdot,           # Set line style

    xlabel="X Axis",              # Set x-axis label
    ylabel="Y Axis",              # Set y-axis label

    title="Beautiful Plot",       # Set plot title
    label="Random Data",          # Set legend label
    legend=:topright,             # Set legend position

    grid=true,                    # Show grid
    framestyle=:box               # Set frame style

    
)

# Save the plot to a file into a plots directory
#savefig("plots/plot1.png")





# Generate some random data
data = randn(1000)

# Create a histogram plot
histogram(
    data,
    bins=20,                       # Number of bins
    color=:lightblue,              # Color of bars
    xlabel="Value",                # X-axis label
    ylabel="Frequency",            # Y-axis label
    title="Histogram of Random Data",  # Plot title
    legend=false                   # Hide legend
)

# Save the plot to a file into a plots directory   
#savefig("plots/histogram.png")





# Generate some random data for coordinates
x_values = rand(100)
y_values = rand(100)

# Create a scatter plot
scatter(
    x_values, y_values,
    color=:blue,                   # Set color of markers
    markersize=5,                  # Set size of markers
    marker=:circle,                # Set marker shape
    xlabel="X Values",             # Set x-axis label
    ylabel="Y Values",             # Set y-axis label
    title="Scatter Plot",          # Set plot title
    legend=false                   # Hide legend
)

# Save the plot to a file into a plots directory
#savefig("plots/scatter.png")

"""
# Generate some random data
a = rand(100)
b = rand(100)

# Create a more complex plot with multiple series where each line has a different color

plot(
    a, b,                          # First series
    color=:blue,                   # Set line color
    label="Series 1",              # Set legend label
    linestyle=:dashdot,            # Set line style
    linewidth=2,                   # Set line width
)

plot!(
    a, 2b,                         # Second series
    color=:red,                    # Set line color
    label="Series 2",              # Set legend label
    linestyle=:dash,               # Set line style
    linewidth=2,                   # Set line width
)

plot!(
    a, 3b,                         # Third series
    color=:green,                  # Set line color
    label="Series 3",              # Set legend label
    linestyle=:dot,                # Set line style
    linewidth=2,                   # Set line width
)

xlabel!("X Axis")                  # Set x-axis label
ylabel!("Y Axis")                  # Set y-axis label
title!("Multiple Series Plot")     # Set plot title
#legend!(:topright)                 # Set legend position
#grid!(true)                        # Show grid
#framestyle!(:box)                  # Set frame style


# save the plot to a file into a plots directory
savefig("plots/multiple_series2.png")
"""

# Violin plot
data = [randn(100), randn(100), randn(100)]

violin(data, color=:lightblue, xlabel="Group", ylabel="Value", title="Violin Plot", legend=false)

# Save the plot to a file into a plots directory
savefig("plots/violin.png")


