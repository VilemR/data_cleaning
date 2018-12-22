install.packages("knitr")

#test je to tam? podruhe?

install.packages("markdown")

require(knitr)
require(markdown)

setwd('/home/vilem_reznicek/Development/RStudio_projects/RStudio_projects/coursera')
knit("hpaData.R", encoding="ISO8859-1")
markdownToHTML("hpaData.R", "hpaData.R.html")


#https://github.com/benjamin-chan/GettingAndCleaningData