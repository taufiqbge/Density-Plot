## R-coding using 'R version 4.1.2'9; Rstudio 2021.09.1

## directory setup

setwd("set your own directory") ## exmaple: setwd("C:/Users/dplot")

library(readr)
library(ggplot2)
library(ggridges)

theme_set(theme_bw())

## read .CSV file, only change the .csv file name here, make sure column name match: grp, Survival


density_plot <- read_csv("exp-1-8.csv", 
                         col_types = cols(grp = col_character(), 
                                          Survival  = col_number()))
ggplot(
  data= density_plot, 
  #aes(x=Survival, y = grp, fill = stat(x))
  aes(x=Survival, y = grp))+
  geom_density_ridges(scale=3, fill = "lightblue", alpha = 0.8)
#) + 

#geom_density_ridges_gradient(scale = 3, size = 0.2, rel_min_height = 0.01) +
#theme_ridges(grid = TRUE) 
# +

# scale_fill_viridis_c(name = "Exp", option = "H") +
#labs(title = 'Density plot') 

# save dplot as pdf and svg format, file will save in the above assigned directory

dev.print(svg,"p1.svg")
dev.print(pdf,"p1.pdf")

dev.off()
