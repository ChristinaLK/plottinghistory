library(dplyr)
library(ggplot2)
library(tools)

#filename <- '/Users/ckoch/Code/history_analysis/2016_11_23.csv'

args <- commandArgs(trailingOnly = TRUE)
filename <- args[[1]]
prefix <- file_path_sans_ext(basename(filename))

use_cutoff <- 2
top_10 <- FALSE

history_data <- read.table(file = filename,
                       header = FALSE, sep = ",")

rows <- nrow(history_data)
num_commands <- length(levels(history_data$V1))
tallies <- history_data %>%
  group_by(V1) %>%
  tally() %>%
  mutate(V1 = reorder(V1, n)) %>%
  arrange(desc(n))
most_used <- max(tallies$n)

if (use_cutoff) {cutoff <- use_cutoff } else {cutoff <- 0}
if (top_10) {head_num <- 10} else {head_num <- num_commands}

if (use_cutoff) {
  plot_title <- paste("Shell Commands with More Than",
  cutoff, "Uses", "(out of",rows,")")
} else if (top_10) {
  plot_title <- paste("Top 10 Shell Commands (out of",rows,")")
} else {
  plot_title <- paste("Shell Command Use (out of",rows,")")
}
plot_height <- round(num_commands / 8)

history_plot <- tallies %>%
  head(head_num) %>%
  filter(n >= cutoff) %>%
  ggplot(aes(x = n, y = V1)) +
   geom_point() +
   ggtitle(plot_title) +
   xlab("Number of Uses") +
   ylab("Command") +
   theme_minimal()

ggsave(paste0("img/",prefix,".png"),
       plot = history_plot,
       width=6,
       height=plot_height)
