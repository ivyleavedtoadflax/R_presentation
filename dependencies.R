library(devtools)
library(httr)
set_config(
  use_proxy(url="10.70.76.247", port=3128)
)

install_github('ramnathv/slidify')
install_github('ramnathv/slidifyLibraries')

remove.packages(c("ggplot2", "data.table"))
install.packages('Rcpp', dependencies = TRUE)
install.packages('ggplot2', dependencies = TRUE)
install.packages('data.table', dependencies = TRUE)

install.packages('devtools', dependencies = TRUE)
