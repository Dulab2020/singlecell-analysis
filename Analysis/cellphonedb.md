# cellphonedb
## prepare data for cellphonedb 
```R
write.table(as.matrix(scRNA@assays$RNA@data), "./data.txt", sep='\t', quote=F)
write.table(as.matrix(cbind(rownames(d2@meta.data), scRNA@meta.data[,'ident', drop=F])), './meta.txt', sep='\t', quote=F, row.names=F)
```

``` shell
cellphonedb method statistical_analysis meta.txt data.txt --counts-data=gene_name
```