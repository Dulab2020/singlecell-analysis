# dimplot
## plot for clusters
p1 <- DimPlot(mmrp, label = T, pt.size = 1, group.by='ident')+
  NoLegend()+labs(title = "Cluster") +
  theme(panel.border = element_rect(fill=NA,color="black", size=1, linetype="solid"),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank(),
        #plot.title = element_blank()
  ) + scale_color_npg()

## plot for grades
p2 <- DimPlot(mmrp, label = F, pt.size = 1, group.by='grade')+
  #NoLegend()+
  labs(title = "Grade") +
  theme(panel.border = element_rect(fill=NA,color="black", size=1, linetype="solid"),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank(),
        #plot.title = element_blank(),
        legend.position = c(.75, .10),
        legend.background = element_rect(fill = "transparent")
  ) + scale_color_npg()

## plot for the custom column Hypoxia_type
p3 <- DimPlot(mmrp, label = F, pt.size = 1, group.by='Hypoxia_type')+
  #NoLegend()+
  labs(title = "Hypoxia") +
  theme(panel.border = element_rect(fill=NA,color="black", size=1, linetype="solid"),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title = element_blank(),
        axis.text = element_blank(),
        #plot.title = element_blank(),
        legend.position = c(.75, .10),
        legend.background = element_rect(fill = "transparent")
  ) + scale_color_npg()