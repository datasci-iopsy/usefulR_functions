#define global knitr options
#really helpful for documentation!

```{r global_options, include=FALSE}
knitr::opts_chunk$set(fig.width=12, fig.height=8, fig.path='Figs/',
                      echo=FALSE, warning=FALSE, message=FALSE)
```

#this code helps define package options; useful I'm sure 

```{r load_packages, include=FALSE}
#instaill.packages(broman)
library(broman)
```