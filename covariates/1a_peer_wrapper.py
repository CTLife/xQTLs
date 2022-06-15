######################################################
## Template script to train a MOFA model via Python3 ##
######################################################

from mofapy2.run.entry_point import entry_point
import numpy as np
import pandas as pd
import os

###############
## Load data ##
###############
##os.system( ""  )
datafile = "merged.txt"

# The data has to be loaded as a pandas dataframe or as a numpy matrix with dimensions (samples,features)
data = pd.read_csv(datafile, header=1, sep='\t')
data = np.transpose(data)

###########################
## Initialise MOFA model ##
###########################

# initialise the entry point
ent = entry_point()

# Set data
# MOFA is a multi-view and multi-group inference framework. 
# If usig only a single view and a single group (as in PEER), the data needs to be embedded into a nested list
ent.set_data_matrix([[data]])

# Set model options
# - factors: number of factors
# - spikeslab_weights: use spike-and-slab sparsity on the loading?
# - ard_weights: use ARD prior on the loadings (please do not edit this)
ent.set_model_options(factors=20, spikeslab_weights=False, ard_weights=False)   ################## based on number of samples

# Set training options
# - iter: maximum number of iterations
# - convergence_mode: fast, medium, slow
# - startELBO: initial iteration to start evaluating convergence using the ELBO (recommended >1)
# - freqELBO: frequency of evaluation of ELBO (recommended >1)
# - gpu_mode: use GPU (need cupy installed and working)
# - verbose: verbosity
# - seed
ent.set_train_options(iter=10000, convergence_mode="fast", startELBO=1, freqELBO=1, gpu_mode=False, verbose=False, seed=42)

####################################
## Build and train the MOFA model ##
####################################

ent.build()
ent.run()

####################
## Save the model ##
####################

# The output is an hdf5 file that can be subsequently loaded into R (no python package for the downstream analysis is available yet)
outdir="peer"
os.mkdir(outdir)

outfile = "model.hdf5"
ent.save(outdir + "/" + outfile)






