
#Props to Chat GPT for this example :)

# Load necessary library
library(cluster)

# Load the dataset
data(iris)

# Let's use only the first four columns for clustering
iris_cluster <- iris[, -5]

# Apply k-means clustering
kmeans_result <- kmeans(iris_cluster, 3)

# Start png device
png(filename="clusplot.png", width=800, height=600)

# Plot the clusters
clusplot(iris_cluster, kmeans_result$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

# Close png device
dev.off()
