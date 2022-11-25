# ssgsea
library(readr)

## prepare pathway
pathway <- read_delim("./genes.csv", ",", escape_double = FALSE, trim_ws = TRUE)
pathway <- as.data.frame(pathway)
pathway_list <- lapply(pathway, function(x) {
  unique(na.omit(x))
})

## prepare data
exprSet_t = as.matrix(as.data.frame(scRNA@assays$RNA@data))

## cal
ssgsea_score = gsva(exprSet_t, pathway_list, method = "ssgsea", ssgsea.norm = TRUE, verbose = TRUE)

write.csv(ssgsea_score, "./ssgsea.csv")
