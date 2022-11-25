# boxplot
## boxplot for items
p1 = ggplot(data,aes(x=type,y=GLS),fill=type) +
  scale_fill_manual(values=c('#FF1493', '#20B2AA')) +
  geom_boxplot(aes(fill=type),show.legend = F) +
  theme(panel.grid = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(),
        axis.text.x = element_text(angle=90,hjust = 1,vjust=0.5),
        plot.title = element_text(hjust=0.5)) +
  labs(x = NULL,
       y = NULL,
       title = "GLS") +
  #theme_minimal() 
  #geom_sina(aes(color=grade), size=0.1,alpha=0.2) 
  #coord_cartesian(ylim = c(0, 2)) +
  stat_compare_means(symnum.args = list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", " ")),
                     label = "p.signif", method = 'wilcox.test', label.y = 2, label.x = 0.5)  + stat_summary(fun = 'mean', geom = "point")
ggsave("./gls_epi_apoe.pdf", width = 1.5, height = 3, device = cairo_pdf, units = 'in')

## boxplot for items compare
bioCol = c("#1c79c0","#ff3399", "#0389ff")
bioCol = bioCol[1 : length(levels(factor(data[,"type"])))]
p = ggboxplot(data, x = "cluster", y = "SUCLG1", color = "type",
            xlab = "",
            ylab = "",
            legend.title="",
            palette = bioCol,
            width = 0.7)
#p=p+rotate_x_text(60)
p1 = p + stat_compare_means(aes(group=type), symnum.args=list(cutpoints = c(0, 0.001, 0.01, 0.05, 1), symbols = c("***", "**", "*", " ")), label = "p.signif", method = 'kruskal.test')
#p1=p1+geom_point(aes(color=type),position = position_jitterdodge(),size=0.5) +
p1 = p1 + theme(legend.position = c(0.8, 0.9), legend.background = element_blank(), legend.key = element_blank(),
            panel.border = element_rect(linetype = 'solid', size = 0.3, fill = NA))+
  scale_x_discrete(limits=c("Mye", "T/NK", "Epi", "Fib"))
#size width=3,height=6
ggsave(filename = "./SUCLG1_major.pdf", plot = p1, device = 'pdf', width = 6, height = 3, units = 'in')
