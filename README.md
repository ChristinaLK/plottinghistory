# plottinghistory

## Requirements
* Python
* R + the tidyverse (specifically dplyr, knitr and ggplot2

## Usage
* Download a copy of your shell history (`history > history.txt`) and place in the `data/raw` folder. 
* Turn into a csv by running `python scripts/make_csv.py <path to history file>`.  Example: 
~~~
python scripts/make_csv.py data/raw/2018-04-27.history.txt
~~~
* Create a plot of your command usage by running `Rscript scripts/history_plot.R <path to history csv>`. Example: 
~~~
Rscript scripts/history_plot.R data/csv/2018-04-27.history.csv
~~~
The plot will appear in the `img/` directory.
* Alternatively, open RStudio and create a new project in this main directory.  Then open `report/history_report.Rmd`, 
set the name of the file you want to use in the first code chunk, and "knit." 
