# corr heatmap
# data = as.matrix(data)
pdf("plot_2/mmrp_all.pdf", width=5, height=5)
col = c(colorRampPalette(c("#0c00e6","#FFFFFF"))(100), colorRampPalette(colors = c('#EEA9B8', '#ff0c00'))(100))
p1 = corrplot(data, type = "lower", order = "hclust", tl.col = "black", tl.srt = 45, col = col)
dev.off()