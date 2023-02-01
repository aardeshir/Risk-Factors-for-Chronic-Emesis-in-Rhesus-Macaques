# OR Plot Script
## Call Packages and Functions -----
library(ggpubr)
library(ggbreak)

## Call and Edit Data -----
EmesisOddsRatios = read.csv(paste(getwd(),"/raw_data/emesis_odds_ratios.csv",sep=""))
### Sets the wanted order to be plotted as SIB, Confident, Gentle, Vigilant, Nervous
ORReverseOrder = c("Nervous", "Vigilant", "Gentle", "Confident", "SIB")
EmesisOddsRatios$Variable = factor(EmesisOddsRatios$Variable, levels = ORReverseOrder)

## Make Plot -----
EmesisORPlot= ggplot(EmesisOddsRatios, aes(x = Variable, y = OR)) +
  geom_pointrange(aes(ymin=Low.95.CI, ymax=High.95.CI), fatten = 2, size = 1) +
  geom_hline(yintercept = 1, size = 0.25, color="dark red", linetype = 2) +
  theme_bw() + 
  coord_flip() + 
  xlab("") + 
  ylab("Odds Ratio") +
  scale_y_break(c(5, 17), scales = 0.25, ticklabels=c(17,18)) #+ geom_text(aes(label = paste("P =",p.value)), hjust=-0.1, vjust=-0.4, size=4)

## Displays Plot -----
# EmesisORPlot

## Creates folder to save plot -----
dir.create(paste(getwd(),"/plots",sep=""))

## Saves Plot -----
### Saves as .pdf file
ggsave(paste(getwd(),"/plots/emesis_or_plot.pdf",sep=""), width = 6.74, height = 4.27, units = "in")

### Saves as .png file
ggsave(paste(getwd(),"/plots/emesis_or_plot.png",sep=""), width = 6.74, height = 4.27, units = "in")

### Saves as .svg file
ggsave(paste(getwd(),"/plots/emesis_or_plot.svg",sep=""), width = 6.74, height = 4.27, units = "in")
