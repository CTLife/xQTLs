library(ashr)
library(mashr)
library(corrplot)


dat <- readRDS("formatted/FastQTLSumStats.list.mash.rds")
names(dat)
dim(dat$strong.b)
dim(dat$strong.z)
dim(dat$strong.s)
 
dim(dat$random.b)
dim(dat$random.z)
dim(dat$random.s)


data.strong = list(Bhat=dat$strong.b,  Shat=dat$strong.s )
data.random = list(Bhat=dat$random.b,  Shat=dat$random.s )
 
m.1by1 = mash_1by1(mash_set_data(data.strong$Bhat, data.strong$Shat))
strong.subset = get_significant_results(m.1by1,0.05)

random.subset = sample(1:nrow(data.random$Bhat), 10000)

data.temp = mash_set_data(data.random$Bhat[random.subset,],  data.random$Shat[random.subset,])
Vhat = estimate_null_correlation_simple(data.temp)
rm(data.temp)




data.random2 = mash_set_data(data.random$Bhat[random.subset,],  data.random$Shat[random.subset,], V=Vhat)
data.strong2 = mash_set_data(data.strong$Bhat[strong.subset,],  data.strong$Shat[strong.subset,], V=Vhat)


U.pca = cov_pca(data.strong2, 5)
U.ed = cov_ed(data.strong2, U.pca)


U.c = cov_canonical(data.random2)
m = mash(data.random2, Ulist = c(U.ed,U.c), outputlevel = 1)

m2 = mash(data.strong2, g=get_fitted_g(m), fixg=TRUE)

head(get_lfsr(m2))
head(get_pm(m2))
head(get_psd(m2))
dim(get_lfsr(m2))
dim(get_pm(m2))
dim(get_psd(m2))



results = get_significant_results(m2, thresh = 0.001, conditions = NULL, sig_fn = get_lfsr )

print(  length(results) ) 

pdf("top5.pdf")
mash_plot_meta(m.c,get_significant_results(m.c)[1], ylab = "Brain regions")
mash_plot_meta(m.c,get_significant_results(m.c)[2], ylab = "Brain regions")
mash_plot_meta(m.c,get_significant_results(m.c)[3], ylab = "Brain regions")
mash_plot_meta(m.c,get_significant_results(m.c)[4], ylab = "Brain regions")
mash_plot_meta(m.c,get_significant_results(m.c)[5], ylab = "Brain regions")
dev.off()



m3 = mash_compute_posterior_matrices(m2, data.strong2, algorithm.version = 'R',  posterior_samples = 100)
names(m3)
m2$result = m3
x3 = get_pairwise_sharing(m2, factor=0.5)


pdf("Pairwise_sharing.pdf")
corrplot(x3, method='color', cl.lim=c(0,1), type='upper', addCoef.col = "black", tl.col="black", tl.srt=45, title = 'Pairwise Sharing by Magnitude', mar = c(4,0,4,0))
dev.off()



x3a = get_pairwise_sharing(m2, factor=0.5, lfsr_thresh = 1)
pdf("Pairwise_sharing-2.pdf")
corrplot(x3a, method='color', cl.lim=c(0,1), type='upper', addCoef.col = "black", tl.col="black", tl.srt=45, title = 'Pairwise Sharing by Magnitude', mar = c(4,0,4,0))
dev.off()



x3b = get_pairwise_sharing(m2, factor=0.5, lfsr_thresh = 0.05)
pdf("Pairwise_sharing-3.pdf")
corrplot(x3b, method='color', cl.lim=c(0,1), type='upper', addCoef.col = "black", tl.col="black", tl.srt=45, title = 'Pairwise Sharing by Magnitude', mar = c(4,0,4,0))
dev.off()




x3a = get_pairwise_sharing_from_samples(m2, factor=0.5, lfsr_thresh = 1)
pdf("Pairwise_sharing-4.pdf")
corrplot(x3a, method='color', cl.lim=c(0,1), type='upper', addCoef.col = "black", tl.col="black", tl.srt=45, title = 'Pairwise Sharing by Magnitude', mar = c(4,0,4,0))
dev.off()




x3b = get_pairwise_sharing_from_samples(m2, factor=0.5, lfsr_thresh = 0.05)
pdf("Pairwise_sharing-5.pdf")
corrplot(x3b, method='color', cl.lim=c(0,1), type='upper', addCoef.col = "black", tl.col="black", tl.srt=45, title = 'Pairwise Sharing by Magnitude', mar = c(4,0,4,0))
dev.off()











x3b = get_pairwise_sharing(m2, factor=0.5, lfsr_thresh = 0.001)
pdf("Pairwise_sharing-6.pdf")
corrplot(x3b, method='color', cl.lim=c(0,1), type='upper', addCoef.col = "black", tl.col="black", tl.srt=45, title = 'Pairwise Sharing by Magnitude', mar = c(4,0,4,0))
dev.off()








