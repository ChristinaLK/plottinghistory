library(dplyr)
library(ggplot2)

#filename <- '/Users/ckoch/Code/history_analysis/2016_11_23.csv'

args <- commandArgs(trailingOnly = TRUE)
filename <- args[[1]]
prefix <- strsplit(basename(filename), "." )[[1]]
print(prefix)

history_data <- read.table(file = filename, 
                       header = FALSE, sep = ",")

#str(history_data)
#levels(history_data$V1)

history_plot <- history_data %>% 
  group_by(V1) %>%
  summarize(total_uses = n()) %>% 
  mutate(V1 = reorder(V1, total_uses)) %>% 
  ggplot(aes(x = total_uses, y = V1)) + geom_point() + theme_minimal()

ggsave(paste0("img/"filename,".png"), 
       plot = history_plot, 
       width=6, 
       height=4)
