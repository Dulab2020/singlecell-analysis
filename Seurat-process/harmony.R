rmBatchEffHarmony <- function(harmonyIn, batchInfor){
  harmonyIn <- FindVariableFeatures(harmonyIn)
  harmonyIn <- ScaleData(harmonyIn)
  harmonyIn <- RunPCA(harmonyIn, features = VariableFeatures(harmonyIn))
  harmonyIn <- RunHarmony(harmonyIn, group.by.vars = batchInfor, plot_convergence = FALSE)
  return(harmonyIn)
}