install.packages('gsheet')
library(gsheet)
url = 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco = as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)
