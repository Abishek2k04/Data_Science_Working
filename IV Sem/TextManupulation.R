library(robotstxt)
library(rvest)

url <- "https://www.espncricinfo.com/story/anantha-narayanan-jayasuriya-stunner-in-singapore-and-all-the-other-outliers-in-odi-history-1348299"

path = paths_allowed(url)

web = read_html(url)
View(web)     

content <- web %>% html_nodes(".ci-html-content div") %>% html_text()
View(content)
#change to lowercase
lowc = tolower(content)
View(lowc)
lowc
#change to uppercase
highc = toupper(content)
View(lowc)
highc
#char replacement
chartr(old = "a", new = "A", lowc)
#split strings
spl = strsplit(highc, split =" ")
View(spl)
spl
#extract the element
spl[[2]]
#access single element
spl2 = unlist(strsplit(highc, split = " "))
View(spl2)
#number indicate data with htese number which show word for that number
spl2
spl2[2000]
spl2[3120]

library(stringr)
#lengith of string
str_length(content)
str_length(spl)
str_length(spl2)
#detect string
str_detect(spl2, "Z")
str_detect(spl2, "TO")
spl2[791]

#detecting string index
str_which(spl2, "AT")
spl2[1874]
