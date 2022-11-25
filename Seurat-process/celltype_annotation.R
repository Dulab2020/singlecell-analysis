# cluster define
## find marker
library(future)
plan("multiprocess", workers = 16)
options(future.globals.maxSize = 200*1024^3)
markers <- FindAllMarkers(scRNA, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
write.table(markers, file = "./markers.csv", sep = ",", quote = F ,row.names = T)

## define celltype according to markers

## modify seuratobj
new.cluster.ids <- c("TNK", "Mye", "Fib", "End", "Mye", "TNK", "B", "Epi", "Epi")
names(new.cluster.ids) <- levels(scRNA)
scRNA = RenameIdents(scRNA, new.cluster.ids)
scRNA[['sub_cluster']] = Idents(scRNA)

## save metainfo
info=subset(scRNA@meta.data, select = c('dataset', 'sub_cluster', 'orig.ident'))
write.csv(info, './meta.csv')