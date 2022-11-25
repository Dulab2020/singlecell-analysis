library(GSVA)
library(GSEABase)
library(msigdbr)
## prepare pathway
pathway <- read_delim("./genes.csv", ",", escape_double = FALSE, trim_ws = TRUE)
pathway <- as.data.frame(pathway)
pathway_list <- lapply(pathway, function(x) {
  unique(na.omit(x))
})

## prepare data
exprSet_t = as.matrix(as.data.frame(scRNA@assays$RNA@data))

gsva_res = gsva(exprSet, gset.idx.list = pathway_list, kcdf="Gaussian",method = "gsva", parallel.sz=8)
write.csv(gsva_res,file = "/public/home/yuwenqi/geneSet/gsva.csv")
