# heatmap
heatmap = pheatmap(data, 
                   #annotation_row = annotation,
                   #annotation_col=anno, 
                   show_colnames = T, 
                   #show_rownames=TRUE,
                   fontsize=10,
                   breaks = bk,
                   color = c(colorRampPalette(c("#0c00e6","#FFFFFF"))(length(bk) / 2), colorRampPalette(colors=c('#FFFFFF', '#e00000'))(length(bk) / 2)),
                   #color = colorRampPalette(c("#0c00e6",'#FFFFFF',"#e00000"))(100),
                   annotation_legend=TRUE,
                   border_color=NA,
                   scale="none",
                   cluster_rows = FALSE,
                   cluster_cols = FALSE,
                   legend_breaks = c(min(data), 0, max(data)),
                   legend_labels = c(round(min(data), 2), 0 ,round(max(data), 2)),
                   cellheight = 20,
                   cellwidth = 20,
                   angle_col = 45,
                   fontsize_col = 12,
                   fontsize_row = 12,
                   display_numbers = T,
                   #gaps_row = c(3,6,9,12,15)
                   #gaps_row = 1:length(rownames(data)),
                   gaps_col = c(1,2,3)
)
ggsave('./heatmap.pdf', plot = heatmap, width = 15, height = 15)
## save heatmap order for custom analysis
write.csv(heatmap$tree_col$order - 1, "./order.csv", quote = F, row.names = T)