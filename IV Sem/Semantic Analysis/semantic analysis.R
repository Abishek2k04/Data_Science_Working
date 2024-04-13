library(tm)
library(ggplot2)
library(lsa)

text <- c("transporting food by cars will cause global warming .so we should go local",
          "we should try to convince our parents to stop using cause  because it will cause global warming",
          "some food, such as mongo,require  a warm weather to grow.so htey have to be transported to canada",
          "a typical electronic circuit can be build wth a battert,a bulb, and a switch",
          "electricy flow form batteries to the bulb, just like water flows through a tube ",    
          "batteries have chemical energe in it. then electrongs flow through a bulb to light it up",
          "birds can flu because they have feather and they are light",
          "why some birds like pigeon can fly while some others like chicken cannot?",
          "feather is important for birds fly.if feather on a bird's wing is removed, this bird cannot fly.")
text
#factoring 
view <- factor(rep(c("view 1", "view 2", "view 3"), each = 3))
view

#converting it to data frame
df <- data.frame(text,view,stringAsFactors=FALSE)
df
View(df)


#corpus
corpus <- Corpus(VectorSource(df$text))
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, function(x) removeWords(x, stopwords("english")))
corpus <- tm_map(corpus, stemDocument,language = "english")
corpus

#term document matrix
td.mat <- as.matrix(TermDocumentMatrix(corpus))
View(td.mat)
