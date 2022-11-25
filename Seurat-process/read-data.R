# GSM files
fs=list.files('./','^GSM')  
fs
library(stringr)
samples=str_split(fs,'_',simplify = T)[,1] 

lapply(unique(samples),function(x){
  y=fs[grepl(x,fs)]
  folder=paste0("5/", str_split(y[1],'_',simplify = T)[,1])
  dir.create(folder,recursive = T)
  file.rename(paste0("./",y[1]),file.path(folder,"barcodes.tsv.gz"))
  file.rename(paste0("./",y[2]),file.path(folder,"features.tsv.gz"))
  file.rename(paste0("./",y[3]),file.path(folder,"matrix.mtx.gz"))
})
samples=list.files('./','^GSM')

## create seuratobj for each sample
sceList = lapply(samples,function(pro){
  folder=file.path("5/",pro)
  CreateSeuratObject(counts = Read10X(folder), 
                     project = pro ,min.cells=50,min.features=800) 
})
for (i in 1:length(sceList)) {
  sceList[[i]][["percent.mt"]]=PercentageFeatureSet(sceList[[i]],pattern = "^MT-")
}

## merge
scRNA <- merge(sceList[[1]], sceList[2:length(sceList)])

# h5 file
scRNA <- Read10X_h5(filename = "GSM4107899_LH16.3814_raw_gene_bc_matrices_h5.h5")
scRNA <- CreateSeuratObject(counts = sce)
