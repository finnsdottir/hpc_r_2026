




One easy way to use R on the Alliance's HPC clusters is to access RStudio through JupyterHub in your browser window. 



By default, there are only a small number of packages installed in RStudio on the clusters. The first time you log into RStudio on a cluster, you will need to install the packages you use through the  ([see more here](https://docs.alliancecan.ca/wiki/R#Installing_R_packages)). As the clusters are not hooked up to the internet, you cannot do this within RStudio. 

Start by logging into the cluster you plan to use through the shell. Then, start an R session and choose the version of R that you plan to use in RStudio. Once that is loaded up, you'll be able to install the required packages the normal way, for example:

!!!note
    `R
    install.packages('tidyverse')
    install.packages('ggplot2')
    `

