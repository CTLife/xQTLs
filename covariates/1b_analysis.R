####################
## Load libraries ##
####################

library(MOFA2)

################
## Load model ##
################

file <- "peer/model.hdf5"
model <- load_model(file)

AllResults_g <- "peer"
if( ! file.exists(AllResults_g) ) { dir.create(path=AllResults_g, recursive = TRUE) }

pdf( paste(AllResults_g, "figures.pdf", sep="/") )

####################################
## (Optional) add sample metadata ##
####################################

# Important: 
# (1) the row names in the sample metadata data.frame have to match the sample names in the MOFA model
# (2) the sample name has to contain at least two columns: 
# 		- sample: sample names
#		- group: group name. Only required for multi-group inference. In your case just set the entire column to the same value

# Load metadata

# stopifnot(all(samples(model)[[1]]==metadata$sample))
# samples_metadata(model) <- metadata

###############################
## (Optional) Subset factors ##
###############################

# We can remove factors that explain little variance (in this case, we require at least 0.01%)
# r2 <- model@cache$variance_explained$r2_per_factor
# factors <- sapply(r2, function(x) x[,1]>0.0001)
# model <- subset_factors(model, which(apply(factors,1,sum) >= 1))

#############################
## Plot variance explained ##
#############################

# Plot variance explained using individual factors
plot_variance_explained(model, factors="all")
plot_variance_explained(model, factors=c(1,2,3))
plot_variance_explained(model, factors=c(1,2,3,4,5,6))

# Plot total variance explained using all factors
plot_variance_explained(model, plot_total = TRUE)[[2]]

########################
## Plot factor values ##
########################

plot_factor(model, factor = 1)
plot_factors(model, factor = c(1,2))

###########################
## Plot feature loadings ##
###########################

# The weights or loadings provide a score for each gene on each factor. 
# Genes with no association with the factor are expected to have values close to zero
# Genes with strong association with the factor are expected to have large absolute values. 
# The sign of the loading indicates the direction of the effect: a positive loading indicates that the feature is more active in the cells with positive factor values, and viceversa.

# Plot the distribution of loadings for Factor 1.
plot_weights(model,
  view = 1,
  factor = 1,
  nfeatures = 10,     # Top number of features to highlight
  scale = T           # Scale loadings from -1 to 1
)

# If you are not interested in the full distribution, but just on the top loadings:
plot_top_weights(model, 
  view = 1, 
  factor = 1, 
  nfeatures = 10,
  scale = T
)

######################################
## Plot correlation between factors ##
######################################

cors = plot_factor_cor(model)
write.table(  cors$corr, paste0(AllResults_g, "/cors.txt"), quote=F, sep="\t", row.names=F, col.names=T )

###################
## Fetch factors ##
###################

# fetch factors in matrix format, with dimensions (nfactors,nsamples)
factors <- get_factors(model)[[1]]
dim(factors)

write.table(  factors, paste0(AllResults_g, "/factors.txt"), quote=F, sep="\t", row.names=T, col.names=T )
write.table(  t(factors), paste0(AllResults_g, "/factors.T.txt"), quote=F, sep=" ", row.names=T, col.names=T )



# fetch factors in long data.frame format, with columns "sample", "factor", "value"
factors <- get_factors(model, as.data.frame = T)
head(factors) 

###################
## Fetch weights ##
###################

# fetch weights in matrix format, with dimensions (nfeatures,nfactors)
weights <- get_weights(model)[[1]]
dim(weights)

# fetch weights in long data.frame format, with columns "feature", "view", "factor", "value"
weights <- get_weights(model, as.data.frame = T)
head(weights)

dev.off() 




