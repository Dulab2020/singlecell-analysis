rmBatchEffSeurat <- function(inData, batch, anchorFeatures = 2000){
  seuratList <- SplitObject(inData, split.by = batch) #seurat in
  for(i in 1:length(seuratList)){
    seuratList[[i]] <- NormalizeData(seuratList[[i]]) 
    seuratList[[i]] <- FindVariableFeatures(seuratList[[i]])
  }
  simData.seuratAnchor <- FindIntegrationAnchors(object.list = seuratList, anchor.features = anchorFeatures)
  result <- IntegrateData(anchorset=simData.seuratAnchor, features.to.integrate=row.names(inData))
  DefaultAssay(result) <- "integrated"
  return(result)
}