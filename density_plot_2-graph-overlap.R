## R-coding using 'R version 4.1.2'9; Rstudio 2021.09.1

## directory setup

setwd("set your own directory") ## exmaple: setwd("C:/Users/dplot")

# Libraries required

library(ggplot2)
library(hrbrthemes)
library(dplyr)
library(tidyr)
library(viridis)
library(readr)

## read .CSV file, only change the .csv file name here, make sure column name match: grp, Survival

density_plot <- read_csv("2-cell-density.csv", 
                         col_types = cols(grp = col_character(), 
                                          Survival  = col_number()))
#theme setup of density plot

dplot <- ggplot(data=density_plot, aes(x=Survival , group=grp, fill=grp)) +
  geom_density(alpha=0.9) + 
  scale_x_continuous(limits = c(-0.1, 1.5))

#viewing plot on screen 
dplot

## theme set up
dplot+theme_bw()

dplot + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
           panel.background = element_blank(), axis.line = element_line(colour = "black"))

# save dplot as pdf and svg format, file will save in the above assigned directory

dev.print(svg,"p1.svg")
dev.print(pdf,"p1.pdf")

dev.off()


########

