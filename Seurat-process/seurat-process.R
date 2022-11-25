# Seurat workflow
library(Seurat)
library(harmony)
library(tidyverse)
library(patchwork)

## define atributes
maxGene = 6000
pctMT = 20

## check mt percent
scRNA[["percent.mt"]]=PercentageFeatureSet(scRNA,pattern = "^MT-")
scRNA = subset(scRNA, subset = nFeature_RNA < maxGene & percent.mt < pctMT)

## process data
scRNA = NormalizeData(scRNA)
scRNA = FindVariableFeatures(scRNA, nfeatures = 3000)
scRNA = ScaleData(scRNA)
scRNA = RunPCA(scRNA, verbose = F)
pc.num=1:30
scRNA = RunUMAP(scRNA, dims=pc.num)
scRNA <- FindNeighbors(scRNA, dims=pc.num) %>% FindClusters(resolution=0.05)

## check batch
library(cowplot)
p3 <- DimPlot(scRNA, reduction = "umap", group.by = "orig.ident", pt.size=0.5)
p4 <- DimPlot(scRNA, reduction = "umap", group.by = "ident",   pt.size=0.5, label = TRUE,repel = TRUE)
fig_umap <- plot_grid(p3, p4, labels = c('orig.ident','ident'),align = "v",ncol = 2)
ggsave(filename = "./batch_plot.pdf", plot = fig_umap, device = 'pdf', width = 30, height = 15, units = 'cm')