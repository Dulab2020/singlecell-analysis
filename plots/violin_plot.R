# violin plot
p = ggplot(data, aes(x = type,y = GLUL),fill = type)+
  scale_fill_manual(values=c('#20B2AA', '#FF1493'))+
  geom_violin(aes(fill = type), show.legend = F, trim = F)+
  theme(panel.grid = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        #axis.text.x = element_text(angle=90,hjust = 1,vjust=0.5),
        plot.title = element_text(hjust=0.5)) +
  labs(x = NULL,
       y = NULL,
       title = "Complexity") +
  #theme_minimal() 
  #geom_sina(aes(color=grade), size=0.1,alpha=0.2) 
  #coord_cartesian(ylim = c(0, 1))+
  stat_compare_means(symnum.args = list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", " ")),
  label = "p.signif", method='wilcox.test', label.y = 4, label.x = 0.5)