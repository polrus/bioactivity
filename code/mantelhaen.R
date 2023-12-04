df <- read.csv("analysis/three_way_table_GE_plus.csv", header = TRUE)
df

# Convert the factors to numeric binary representation
df$isActive <- as.integer(df$isActive == "True")
df$isMoA <- as.integer(df$isMoA == "True")
df$isGE_plus <- as.integer(df$isGE_plus == "True")
df

# Create a 3-dimensional array for the contingency tables
# The dimensions are for isActive, isMoA, and isGE_plus
contingency_tables <- array(df$count, dim = c(2, 2, 2),
                            dimnames = list(
                              isActive = c("False", "True"),
                              isMoA = c("False", "True"),
                              isGE_plus = c("False", "True")
                            ))
contingency_tables

# Apply the Mantel-Haenszel test
mantelhaen.test(contingency_tables)
