# feature plot
## select genes
selected_genes = c("NKG7", "KRT7", "SPP1", "FABP4", "IGHG3", "DCN", "TPSB2", "CST6", "TFF3")

## plot
plot = FeaturePlot(pbmc, reduction = "umap", features = c("NKG7", "KRT7", "SPP1", "FABP4", "IGHG3", "DCN", "TPSB2", "CST6", "TFF3"))

## save plot
ggsave(filename = "features.pdf", plot = plot, device = 'pdf')
