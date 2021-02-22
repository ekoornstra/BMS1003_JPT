# Open libraries
library("gdata")
library("cluster")
library("factoextra")
library("magrittr")
library("fpc")

# Prepare data
Overlap <- read.delim("~/Documents/Uni/MA jaar 1/MBS1003 JPT/Other/Overlap.txt", row.names=1)

# View the first 3 rows
head(Overlap, n = 3)

# Hierarchical clustering
# Compute hierarchical clustering
res.hc <- Overlap %>%
  scale() %>%                    # Scale the data
  dist(method = "euclidean") %>% # Compute dissimilarity matrix
  hclust(method = "ward.D2")     # Compute hierachical clustering

#Visualize using factoextra
fviz_dend(res.hc)
# Cut in 4 groups and color by groups
fviz_dend(res.hc, k = 4, # Cut in five groups
          cex = 0.5, # label size
          k_colors = c("#FFCA28", "#2196F3", "#8E24AA", "#FF5722"),
          color_labels_by_k = TRUE, # color labels by groups
          rect = TRUE # Add rectangle around groups
)
